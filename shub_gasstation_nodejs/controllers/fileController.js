// controllers/fileController.js
const xlsx = require("xlsx");
const moment = require("moment");
const path = require("path");
const fs = require("fs");
const { validateSheetHeaders } = require("../utils/validateSheetHeaders"); // Import hàm validateSheetHeaders

// Upload file controller
const uploadFile = (req, res) => {
  const file = req.file;

  if (!file) {
    return res.status(400).send("No file uploaded.");
  }

  res.send(`File uploaded and saved as ${file.filename}`);
};

// Hàm chuyển đổi từ Excel Date (số serial) sang JavaScript Date
function excelDateToJSDate(serial) {
  const excelEpoch = new Date(Date.UTC(1899, 11, 30)); // Excel dùng epoch từ 30/12/1899
  const jsDate = new Date(excelEpoch.getTime() + serial * 86400000); // Thêm số ngày vào epoch
  return jsDate;
}

// Read file controller
const readFile = (req, res) => {
  const { fromDate, toDate } = req.query;

  if (!fromDate || !toDate) {
    return res.status(400).send("Please provide fromDate and toDate.");
  }

  const from = moment(fromDate, "DD/MM/YYYY");
  const to = moment(toDate, "DD/MM/YYYY");

  const files = fs.readdirSync("./uploads/");
  if (files.length === 0) {
    return res.status(400).send("No files found.");
  }

  const latestFile = files[files.length - 1];
  const workbook = xlsx.readFile(path.join("./uploads", latestFile));
  const sheetName = workbook.SheetNames[0];
  const worksheet = workbook.Sheets[sheetName];

  // Convert sheet to JSON
  const jsonData = xlsx.utils.sheet_to_json(worksheet, { header: 1 });

  // Validate headers
  const headers = jsonData[7];
  if (!validateSheetHeaders(headers)) {
    return res.status(400).send("Invalid file format.");
  }

  // Filter data by date
  const filteredData = jsonData.slice(8).filter((row) => {
    const dateValue = row[1];
    let date;

    if (typeof dateValue === "number") {
      const temp = moment(excelDateToJSDate(dateValue)).subtract(7, "hour");
      date = temp.toDate();
      row[1] = temp.format("DD/MM/YYYY");
    } else {
      date = moment(dateValue, "DD/MM/YYYY").toDate();
    }

    return moment(from).isSameOrBefore(date) && moment(to).isSameOrAfter(date);
  });

  res.json(filteredData);
};

module.exports = { uploadFile, readFile };

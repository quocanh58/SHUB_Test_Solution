// services/fileService.js
const xlsx = require("xlsx");
const path = require("path");
const fs = require("fs");
const moment = require("moment");
const validateSheetHeaders = require("../utils/validateSheetHeaders");

function excelDateToJSDate(serial) {
  const excelEpoch = new Date(Date.UTC(1899, 11, 30));
  return new Date(excelEpoch.getTime() + serial * 86400000).toISOString();
}

function readAndFilterExcel(fromDate, toDate) {
  const from = moment(fromDate, "DD/MM/YYYY");
  const to = moment(toDate, "DD/MM/YYYY");

  const files = fs.readdirSync("./uploads/");
  if (files.length === 0) {
    throw new Error("No files found.");
  }

  const latestFile = files[files.length - 1];
  const workbook = xlsx.readFile(path.join("./uploads", latestFile));
  const sheetName = workbook.SheetNames[0];
  const worksheet = workbook.Sheets[sheetName];

  const jsonData = xlsx.utils.sheet_to_json(worksheet, { header: 1 });

  const headers = jsonData[7];
  if (!validateSheetHeaders(headers)) {
    throw new Error("Invalid file format.");
  }

  const filteredData = jsonData.slice(8).filter((row) => {
    const dateValue = row[1];
    let date;

    if (typeof dateValue === "number") {
      date = moment(excelDateToJSDate(dateValue)).subtract(7, "hour").toDate();
      row[1] = moment(date).format("DD/MM/YYYY");
    } else {
      date = moment(dateValue, "DD/MM/YYYY").toDate();
    }

    return moment(from).isSameOrBefore(date) && moment(to).isSameOrAfter(date);
  });

  return filteredData;
}

module.exports = { readAndFilterExcel };

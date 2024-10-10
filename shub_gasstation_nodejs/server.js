const express = require("express");
const colors = require("colors");
const cors = require("cors");
const morgan = require("morgan");
const dotenv = require("dotenv");
const multer = require("multer");
const path = require("path");

const { uploadFile, readFile } = require("./controllers/fileController");

// dotenv configuration
dotenv.config();

// rest object
const app = express();

// middleware
app.use(cors());
app.use(express.json());
app.use(morgan("dev"));

// Define storage for multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  },
});
const upload_file = multer({ storage: storage });

// Routes
app.get("/test", (req, res) => {
  return res.status(200).send("<h1>Welcome to gas-station-app</h1>");
});

app.post("/upload", upload_file.single("file"), uploadFile);

app.get("/read-file", readFile);

// PORT
const PORT = process.env.PORT || 5000;

//listen
app.listen(PORT, () => {
  console.log(`Server is running on ${PORT}`.white.bgMagenta);
});

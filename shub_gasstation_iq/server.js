const express = require("express");
const colors = require("colors");
const cors = require("cors");
const dotenv = require("dotenv");
const axios = require("axios");

// dotenv configuration
dotenv.config();

// PORT
const PORT = process.env.PORT || 5000;

// rest object
const app = express();

// middleware
app.use(cors());
app.use(express.json());

// ================================ PROCESS ==============================================

function processQueries(data, queries) {
  const prefixSum = [0];
  const altPrefixSum = [0];

  // tính tổng các số trước no
  for (let i = 0; i < data.length; i++) {
    prefixSum[i + 1] = prefixSum[i] + data[i];
    altPrefixSum[i + 1] = altPrefixSum[i] + (i % 2 === 0 ? data[i] : -data[i]);
  }

  // Process each query
  return queries.map((query) => {
    const {
      type,
      range: [l, r],
    } = query;
    if (type === "1") {
      return prefixSum[r + 1] - prefixSum[l];
    } else if (type === "2") {
      return altPrefixSum[r + 1] - altPrefixSum[l];
    }
  });
}

app.get("/solve", async (req, res) => {
  try {
    // Fetch data from the API
    const response = await axios.get(
      "https://test-share.shub.edu.vn/api/intern-test/input"
    );
    const { token, data, query } = response.data;
    console.log(response.data);

    const results = processQueries(data, query);

    await axios.post(
      "https://test-share.shub.edu.vn/api/intern-test/output",
      results, // send only results[]
      { headers: { Authorization: `Bearer ${token}` } }
    );

    // Send response
    res.status(200).json({ message: "Precessing query successful.", results });
  } catch (error) {
    console.error("Error:", error.message); // Thêm thông tin lỗi
    res.status(500).json({
      error: "Precessing fail.",
      details: error.message,
    });
  }
});
// ==============================================================================

// Routes
app.get("/test", (req, res) => {
  return res.status(200).send("<h1>Welcome to gas-station-app</h1>");
});

//listen
app.listen(PORT, () => {
  console.log(`Server is running on ${PORT}`.white.bgMagenta);
});

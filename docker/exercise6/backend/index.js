const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());

app.get("/api/v1", (req, res) => {
  const data = {
    message: "Hello world!",
  };
  res.json(data);
});

const port = process.env.PORT || 3001;

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

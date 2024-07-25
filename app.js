const express = require("express");
const app = express();
const PORT = 8000;

app.get("/", (req, res) => {
  res.send("hlw from the devops side !!!");
});

app.listen(PORT, () => {
  console.log(`Server is running ${PORT}`);
});

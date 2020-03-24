const express = require("express");
const serverless = require("serverless-http");
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql");

const app = express();

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "checkitout"
});


app.use(cors());
app.use(bodyParser.json());



app.get("/itemstatus/:item", function(req, res) {

const item = req.params.ite,;

  // connection.query("SELECT id, name FROM cocktail " +
  //                  "WHERE name = ?",
  //                  [name],
  //                 function(err, data) {
  //   if (err) {
  //     console.log("Error fetching item", err);
  //     res.status(500).json({
  //       error: err
  //     });
  //   } else {
  //     res.json({
  //       itemlist: data
  //     });
  //   }
  // });

});




// app.post("/addstatus/:item/:store/:status", function(req, res) {
//   const name = req.body.name;
//   const alcoholic = req.body.alcoholic;
//   const drinks = req.body.drinks;
//   const recipe = req.body.recipe;

//   res.json({
//     message: "Received a request to add a cocktail " + name
//   });
// });



module.exports.checkitout = serverless(app);

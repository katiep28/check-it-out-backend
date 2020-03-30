const express = require("express");
const serverless = require("serverless-http");
const cors = require("cors");
const mysql = require("mysql");
const bodyParser = require("body-parser");


const app = express();


const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "checkitout"
});

app.use(cors());
app.use(bodyParser.json());

app.get("/tasks", function(req, res) {
  res.send({ tasks: ["water plants", "do dishes", "buy oats"] });
});

app.get("/itemname", function(req, res) {
 
    connection.query("SELECT name FROM item ",
                    function(err, data) {
      if (err) {
        console.log("Error fetching items", err);
        res.status(500).json({
          error: err
        });
      } else {
        res.json({
          itemData: data
        });
      }
    });
  });
  
// app.get("/itemstatus/:itemid/:location", function(req, res) {

// const itemid = req.params.itemid;
// const location = req.params.location;

// connection.query("SELECT store.name, " +
//                           "item_store_location.quantity, " +
//                           "item_store_location.dateupdated " +
//                    "FROM item_store_location " + 
//                    "INNER JOIN store ON item_store_location.storeid=store.id " +
//                    "WHERE item_store_location.itemid = ? " +
//                    "AND item_store_location.postcode= ? ",
//                 [itemid, location],
//                 function(err, data) {
//                   if (err) {
//                       console.log("Error fetching item status", err);
//                       res.status(500).json({
//                         error: err
//                       }); 
//                   }
//                   else {
//                       res.json({
//                         itemData: data
//                       });
//                   }
//                   });
//           });



module.exports.items = serverless(app);



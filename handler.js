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

app.get("/itemname", function(req, res) {
 
    connection.query("SELECT name, id FROM item ",
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
  
app.get("/itemstatus/:itemid/:postcode", function(req, res) {

const itemid = req.params.itemid;
const postcode = req.params.postcode;

connection.query("SELECT store.name, store.id, " +
                          "item_store_location.quantity, " +
                          "DATE_FORMAT(item_store_location.dateupdated,\"%d %b %H:%i\") AS dateformatted " +
                   "FROM item_store_location " + 
                   "INNER JOIN store ON item_store_location.storeid=store.id " +
                   "WHERE item_store_location.itemid = ? " +
                   "AND item_store_location.postcode= ?" +
                   "ORDER BY store.name",
                [itemid, postcode],
                function(err, data) {
                  if (err) {
                      console.log("Error fetching item status", err);
                      res.status(500).json({
                        error: err
                      }); 
                  }
                  else {
                      res.json({
                        itemData: data
                      });
                  }
                  });
          });

app.put("/updatequantity/:postcode/:storeid/:itemid/:quantity/:date", function (request, response) {
  // Update task here
  const postcode = request.params.postcode;
  const storeid = request.params.storeid;
  const itemid  = request.params.itemid;
  const quantity = request.params.quantity;
  const date = request.params.date;
  
  connection.query("UPDATE item_store_location " +
                   "SET quantity = ? " +
                   ", dateupdated = ? " +
                   "WHERE postcode = ? " +
                   "AND storeid = ? " +
                   "AND itemid = ? ", 
                  [quantity,date, postcode,storeid,itemid], 
                  function (err, data) {
    if (err) {
      console.log("Error updateing status", err);
      response.status(500).json({
        error: err
      });
    } else {
      console.log("Update worked");
      response.status(200).send("Updated status " + itemid);
    };
  });

});


module.exports.items = serverless(app);



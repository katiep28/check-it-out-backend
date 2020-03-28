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


itemname

app.get("/itemname", function(req, res) {
  console.log("Hello");
    connection.query("SELECT name FROM item ",
                    function(err, data) {
      if (err) {
        console.log("Error fetching items", err);
        res.status(500).json({
          error: err
        });
      } else {
        res.json({
          itemlist: data
        });
      }
    });
  
  });
  

app.get("/itemstatus/:itemid/:location", function(req, res) {

const itemid = req.params.itemid;
const location = req.params.location;

  connection.query("SELECT store.name, " +
                          "item_store_location.quantity, " +
                          "item_store_location.dateupdated " +
                   "FROM item_store_location " + 
                   "INNER JOIN store ON item_store_location.storeid=store.id " +
                   "WHERE item_store_location.itemid = ? "+
                   "AND item_store_location.postcode= ?"
                [itemid, location],
                function(err, data) {
                  if (err) {
                      console.log("Error fetching item", err);
                      res.status(500).json({
                        error: err
                      }); 
                  }
                  else {
                      res.json({
                        itemStatusList: data
                      });
                  }
                  });
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

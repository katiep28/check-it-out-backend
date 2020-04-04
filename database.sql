CREATE DATABASE checkitout;

 USE checkitout;

 
CREATE TABLE item (id VARCHAR(36), name VARCHAR(36), PRIMARY KEY (id));

CREATE TABLE store (id VARCHAR(36), name VARCHAR(36), PRIMARY KEY(id));

CREATE TABLE location (postcode VARCHAR(10), PRIMARY KEY(postcode));

CREATE TABLE store_location (storeid VARCHAR(36),
                            postcode VARCHAR(10),
PRIMARY KEY (storeid, postcode),
FOREIGN KEY (postcode) REFERENCES location(postcode),
FOREIGN KEY (storeid) REFERENCES store(id)
);

 CREATE TABLE item_store_location (id VARCHAR(36), 
                            itemid VARCHAR(36),
                            storeid VARCHAR(36),
                            postcode VARCHAR(10),
                            quantity  VARCHAR(1),
                            dateupdated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,       
PRIMARY KEY (id),
FOREIGN KEY (postcode) REFERENCES location(postcode),
FOREIGN KEY (itemid) REFERENCES item(id),
FOREIGN KEY (storeid) REFERENCES store(id)
);

  INSERT INTO store (id,name)
  VALUES("1","Tesco");
  INSERT INTO store (id,name)
  VALUES("2", "Sainsburys");
  INSERT INTO store (id,name)
  VALUES("3","Aldi");
  INSERT INTO store (id, name)
  VALUES("4","Quality Save");
  INSERT INTO store (id, name)
  VALUES("5","Wilko");
  INSERT INTO store (id, name)
  VALUES("6","B & M");
  INSERT INTO store (id, name)
  VALUES("7","Super Drug");

  INSERT INTO item (id, name)
  VALUES("1","Toilet Roll");
  INSERT INTO item (id, name)
  VALUES("2","Hand Sanitiser");

  INSERT INTO location (postcode)
  VALUES ("M33");
  INSERT INTO location (postcode)
  VALUES ("M32");

INSERT INTO store_location (storeid, postcode)
VALUES ("1","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("2","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("3","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("4","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("5","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("6","M33");
INSERT INTO store_location (storeid, postcode)
VALUES ("7","M33");

  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("1","1","1","M33","L");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("2","1","2","M33","S");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("3","1","3","M33","N");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("4","1","4","M33","N");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("5","1","5","M33","S");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("6","1","6","M33","L");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("7","1","7","M33","N");

  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("8","2","1","M33","L");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("9","2","2","M33","N");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("10","2","3","M33","N");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("11","2","4","M33","S");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("12","2","5","M33","S");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("13","2","6","M33","L");
  INSERT INTO item_store_location (id, itemid, storeid, postcode, quantity)
  VALUES ("14","2","7","M33","L");


SELECT DATE_FORMAT(dateupdated,"%d %M %H:%i") AS formatted_date FROM item_store_location;


SELECT store.name, item_store_location.quantity, item_store_location.dateupdated
FROM item_store_location 
INNER JOIN store ON item_store_location.storeid=store.id
WHERE item_store_location.itemid = "1" AND item_store_location.postcode="M33";

UPDATE item_store_location
SET quantity = "N",
    dateupdated = CURRENT_TIMESTAMP
WHERE postcode = "M33"
AND storeid = "7"
AND itemid = "2";

SELECT
  CONVERT_TZ('2019-04-01 00:00:00','Europe/London','UTC') AS time1,

  SELECT
  CONVERT_TZ(CURRENT_TIMESTAMP,'GMT','+01:00') AS time1,
  CONVERT_TZ(CURRENT_TIMESTAMP,'GMT','+00:00') AS time2;

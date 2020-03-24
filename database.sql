CREATE DATABASE checkitout;

 USE checkitout;

 CREATE TABLE item (id VARCHAR(36), name VARCHAR(36), PRIMARY KEY (id));

 CREATE TABLE store (id VARCHAR(36), name VARCHAR(36), PRIMARY KEY(id));

 CREATE TABLE item_store (id VARCHAR(36), 
                            itemid VARCHAR(36),
                            storeid VARCHAR(36),
                            quantity  VARCHAR(1),
                            datecreated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,                        
PRIMARY KEY (id),
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

  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("1","1","1","L");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("2","1","2","S");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("3","1","3","N");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("4","1","4","N");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("5","1","5","S");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("6","1","6","L");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("7","1","7","N");

  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("8","2","1","L");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("9","2","2","N");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("10","2","3","N");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("11","2","4","S");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("12","2","5","S");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("13","2","6","L");
  INSERT INTO item_store (id, itemid, storeid, quantity)
  VALUES ("14","2","7","L");
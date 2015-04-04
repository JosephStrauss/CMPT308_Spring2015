--  LAB 8 Tables
drop TABLE Orders;
drop TABLE Suppliers;
drop TABLE Clothing;


-- Suppliers --
CREATE TABLE Suppliers(
  name	   text not null,
  addr 	   text,
  city     text,
  state	   CHAR(2),
  zip	   CHAR(5),
  contact  text not null,
  payment  text not null,
  primary key(name)
);

-- Clothes --
CREATE TABLE Clothing(
  sku		CHAR(9) not null,
  description	text,
  retailUSD	NUMERIC(5,2),
  qty		INTEGER,
  primary key(sku)
);

-- Orders --
CREATE TABLE Orders(
  name		text not null references Suppliers(name),
  sku		CHAR(9) not null references Clothing(sku),
  date	     	date not null,
  orderQty	INTEGER not null,
  orderNum	CHAR(8) not null,
  comments	text
);  

-- Insert 5 Suppliers --
INSERT INTO Suppliers(name, addr, city, state, zip, contact, payment)
  VALUES('GAP', 'Big Way Drive', 'Johnsonville', 'NY', 12689, 'Bob Thompson - 914-567-8952 ext. 4321', 'VISA - Due at 15 of Month');

INSERT INTO Suppliers(name, addr, city, state, zip, contact, payment)
  VALUES('OshKosh', 'Oklahoma Ave.', 'Oklahoma City', 'OK', 73101, 'Stacey McKown - 405-555-1212', 'CHK - Due at 05 of Month');

INSERT INTO Suppliers(name, addr, city, state, zip, contact, payment)
  VALUES('Man Dressers', 'Big Man Drive', 'New York', 'NY', 10001, 'Jackie Yan - 212-201-5556', 'CHK - Due at 09 of Month');

INSERT INTO Suppliers(name, addr, city, state, zip, contact, payment)
  VALUES('Kids Barn', 'Big Indian Street', 'Hoboken', 'NJ', 07030, 'Fred McDowell - 234-989-1200', 'VISA - Due at 25 of Month');

INSERT INTO Suppliers(name, contact, payment)
  VALUES('W.K Prod Inc.', 'www.whoknows.com', 'COD');


-- Insert 5 Clothes --
INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('123456789', 'PNTS WHT', 79.99, 10);


-- Insert 10 Orders --
-- INSERT INTO Orders(name, sku, date, orderQty, orderNum)
--   VALUES('KingdomTech', 123456789, 'Apr-02-2015', 100, 12345678);

  
select *
from Suppliers;

select *
from Clothing;

select *
from Orders;

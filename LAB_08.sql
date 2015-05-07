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
  qty		INTEGER not null,
  orderNum	CHAR(5) not null,
  open		BOOLEAN not null,
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
  VALUES('W.K. Prod Inc.', 'www.whoknows.com', 'COD');


-- Insert 5 Clothes --
INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('123456789', 'LVI W32-RXFT-PNTS BLU', 79.99, 54);

INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('123123123', 'AERO XL-SHRT BLU', 29.99, 19);

INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('456456456', 'MLB-NNY CAP PNK', 49.99, 13);

INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('789789789', 'OSH 3T-OVR BLK', 19.99, 4);

INSERT INTO Clothing(sku, description, retailUSD, qty)
  VALUES('321321321', 'LVI W36-PNTS WHT', 79.99, 0);


-- Insert 10 Orders --
INSERT INTO Orders(name, sku, date, qty, orderNum, open)
  VALUES('GAP', 123456789, 'Apr-02-2015', 76, 11111, true);

INSERT INTO Orders(name, sku, date, qty, orderNum, open)
  VALUES('GAP', 321321321, 'Apr-02-2015', 20, 11111, true);

INSERT INTO Orders(name, sku, date, qty, orderNum, open, comments)
  VALUES('OshKosh', 789789789, 'Mar-30-2015', 25, 12121, true, 'Backordered till 5/01/2015');

INSERT INTO Orders(name, sku, date, qty, orderNum, open)
  VALUES('GAP', 789789789, 'Apr-02-2015', 15, 11111, true);

INSERT INTO Orders(name, sku, date, qty, orderNum, open)
  VALUES('Man Dressers', 456456456, 'Apr-08-2015', 26, 22222, true);

INSERT INTO Orders(name, sku, date, qty, orderNum, open)
  VALUES('W.K. Prod Inc.', 123123123, 'Apr-05-2015', 32, 43434, false);



select *
from Suppliers;

select *
from Clothing;

select *
from Orders;

Select sku, sum(qty)
from Clothing NATURAL Join Orders
where Clothing.sku = '123123123'
      AND
      (Orders.sku = '123123123'
              AND Orders.open = true)
GROUP BY sku;



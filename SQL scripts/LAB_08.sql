--  LAB 8 Tables
drop TABLE Suppliers;

-- Suppliers --
CREATE TABLE Suppliers(
  name	   VARCHAR(15) not null,
  addr 	   text,
  city     text,
  state	   CHAR(2),
  zip	   CHAR(5),
  contact  text,
  payment  text,
  primary key(name)
);

INSERT INTO Suppliers(name, addr, city, state, zip, contact, payment)
  VALUES('KingdomTech', '294 Hooker Ave', 'Poughkeepsie', 'NY', 12603, 'Joe Strauss', 'VISA - Due at 15 of Month');

select *
from Suppliers;


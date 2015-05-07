DROP VIEW AlpacaChiefs;

DROP FUNCTION TroopScore(varchar);
DROP FUNCTION villageScore(varchar);
DROP FUNCTION Promote(varchar, varchar);
DROP FUNCTION Demote(varchar, varchar);
DROP FUNCTION addToClan(varchar,varchar);
DROP FUNCTION dropFromClan(varchar);
--DROP FUNCTION newLeader(varchar,varchar);

DROP TABLE WarLogs;
DROP TABLE PlayerTroop_Inventory;
DROP TABLE Playervillage_Inventory;
DROP TABLE Chiefs;
DROP TABLE Clans;

DROP TABLE Archers;
DROP TABLE Balloons;
DROP TABLE Barbs;
DROP TABLE Giants;
DROP TABLE Dragons;
DROP TABLE Hogs;
DROP TABLE Golems;
DROP TABLE LavaHounds;
DROP TABLE Minions;
DROP TABLE WallBreakers;
DROP TABLE Witches;
DROP TABLE Wizards;
DROP TABLE PEKKAS;
DROP TABLE BarbKing;
DROP TABLE ArchQueen;

DROP TABLE AirDefs;
DROP TABLE AirSweepers;
DROP TABLE ArcherTowers;
DROP TABLE Cannons;
DROP TABLE Infernos;
DROP TABLE Mortars;
DROP TABLE Teslas;
DROP TABLE WizardTowers;
DROP TABLE Walls;

--------------------------------------------------------------
--
-- 	INPUT OF ALL TABLES
--
--------------------------------------------------------------

-- CLASH OF CLANS TROOP CHARTS

CREATE TABLE Archers(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Balloons(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Barbs(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Giants(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Dragons(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Hogs(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Golems(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE LavaHounds(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Minions(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE PEKKAS(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE WallBreakers(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);
CREATE TABLE Witches(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Wizards(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE BarbKing(
 lvl		integer,
 score		integer not null,
 primary key(lvl)
);

CREATE TABLE ArchQueen(
 lvl		integer,
 score		integer not null,
 primary key(lvl)
);



-- CLASH OF CLANS DEFENSE CHARTS

CREATE TABLE AirDefs(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE AirSweepers(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE ArcherTowers(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Cannons(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Infernos(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Mortars(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Teslas(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE WizardTowers(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);

CREATE TABLE Walls(
  lvl		integer,
  score		integer not null,
  primary key(lvl)
);


CREATE TABLE Clans(
clanName 		varchar(15),
troopScoreMin		integer not null,
villageScoreMin	integer not null,
wins			integer not null DEFAULT 0,
losses			integer not null DEFAULT 0,
draws			integer not null DEFAULT 0,
leader			varchar(15),
primary key(clanName)
);


CREATE TABLE Chiefs(
  email 	varchar(50),
  fName		varchar(25) not null,
  lName		varchar(25),
  chiefName	varchar(15) not null,
  age		integer not null CHECK (AGE >= 18),
  townHall	integer not null,
  clan		text references Clans(clanName),
  clanStatus	text DEFAULT 'Member',
  primary key(email) 
);   


CREATE TABLE PlayerTroop_Inventory(
 email		varchar(50)references Chiefs(email),
 barbs		integer not null references Barbs(lvl),
 archers	integer not null references Archers(lvl),
 giants		integer not null references Giants(lvl),
 wallBreakers	integer not null references WallBreakers(lvl),
 balloons	integer not null references Balloons(lvl),
 wizards	integer not null references Wizards(lvl), 
 dragons	integer not null references Dragons(lvl),
 pekkas		integer references PEKKAS(lvl),
 minions	integer references Minions(lvl),
 hogs		integer references Hogs(lvl),
 golems		integer references Golems(lvl),
 lavaHounds	integer references LavaHounds(lvl),
 witches	integer references Witches(lvl),
 barbKing	integer references BarbKing(lvl),
 archQueen	integer references ArchQueen(lvl),
 primary key(email) 
);

CREATE TABLE Playervillage_Inventory(
 email		varchar(50)references Chiefs(email),
 airDefs	integer not null references Archers(lvl),
 airSweepers	integer references AirSweepers(lvl),
 archerTowers	integer not null references ArcherTowers(lvl),
 cannons	integer not null references Cannons(lvl),
 infernos	integer references Infernos(lvl),
 mortars	integer not null references Mortars(lvl),
 teslas		integer references Teslas(lvl),
 wizardTowers	integer not null references WizardTowers(lvl),
 walls		integer not null references Walls(lvl),
 barbKing	integer references BarbKing(lvl),
 archQueen	integer references ArchQueen(lvl),
 primary key(email) 
);


CREATE TABLE WarLogs(
 email 		varchar(50) references Chiefs(email),
 threeStars		integer not null DEFAULT 0,
 twoStars		integer not null DEFAULT 0,
 oneStars		integer not null DEFAULT 0,
 zeroStars		integer not null DEFAULT 0,
 primary key(email)
);



--------------------------------------------------------------
--
-- 	INPUT OF ALL DATA IN TABLES
--
--------------------------------------------------------------


-- INSERT OFF & DEF VALUES

--AirDefs table
INSERT INTO AirDefs( lvl, score)
  VALUES(1 , 80);
INSERT INTO AirDefs( lvl, score)
  VALUES(2 , 140);
INSERT INTO AirDefs( lvl, score)
  VALUES(3 , 170);
INSERT INTO AirDefs( lvl, score)
  VALUES(4 , 180);
INSERT INTO AirDefs( lvl, score)
  VALUES(5 , 210);
INSERT INTO AirDefs( lvl, score)
  VALUES(6 , 270);
INSERT INTO AirDefs( lvl, score)
  VALUES(7 , 320);
INSERT INTO AirDefs( lvl, score)
  VALUES(8 , 360);


--AirSweepers table
INSERT INTO AirSweepers( lvl, score)
  VALUES(1 , 24);
INSERT INTO AirSweepers( lvl, score)
  VALUES(2 , 30);
INSERT INTO AirSweepers( lvl, score)
  VALUES(3 , 36);
INSERT INTO AirSweepers( lvl, score)
  VALUES(4 , 42);
INSERT INTO AirSweepers( lvl, score)
  VALUES(5 , 48);
INSERT INTO AirSweepers( lvl, score)
  VALUES(6 , 54);

--ArcherTowers table
INSERT INTO ArcherTowers( lvl, score)
  VALUES(1 , 11);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(2 , 17);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(3 , 21);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(4 , 28);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(5 , 33);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(6 , 38);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(7 , 46);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(8 , 51);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(9 , 60);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(10 , 70);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(11 , 80);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(12 , 93);
INSERT INTO ArcherTowers( lvl, score)
  VALUES(31 , 104);  


--Cannons table
INSERT INTO Cannons( lvl, score)
  VALUES(1 , 9);
INSERT INTO Cannons( lvl, score)
  VALUES(2 , 12);
INSERT INTO Cannons( lvl, score)
  VALUES(3 , 18);
INSERT INTO Cannons( lvl, score)
  VALUES(4 , 22);
INSERT INTO Cannons( lvl, score)
  VALUES(5 , 30);
INSERT INTO Cannons( lvl, score)
  VALUES(6 , 35);
INSERT INTO Cannons( lvl, score)
  VALUES(7 , 48);
INSERT INTO Cannons( lvl, score)
  VALUES(8 , 54);
INSERT INTO Cannons( lvl, score)
  VALUES(9 , 64);
INSERT INTO Cannons( lvl, score)
  VALUES(10 , 73);
INSERT INTO Cannons( lvl, score)
  VALUES(11 , 83);
INSERT INTO Cannons( lvl, score)
  VALUES(12 , 94);
INSERT INTO Cannons( lvl, score)
  VALUES(13 , 108);  

--Infernos table
INSERT INTO Infernos( lvl, score)
  VALUES(1 , 550);
INSERT INTO Infernos( lvl, score)
  VALUES(2 , 687);
INSERT INTO Infernos( lvl, score)
  VALUES(3 , 770);

--Mortars table
INSERT INTO Mortars( lvl, score)
  VALUES(1 , 36);
INSERT INTO Mortars( lvl, score)
  VALUES(2 , 45);
INSERT INTO Mortars( lvl, score)
  VALUES(3 , 54);
INSERT INTO Mortars( lvl, score)
  VALUES(4 , 63);
INSERT INTO Mortars( lvl, score)
  VALUES(5 , 72);
INSERT INTO Mortars( lvl, score)
  VALUES(6 , 81);
INSERT INTO Mortars( lvl, score)
  VALUES(7 , 99);
INSERT INTO Mortars( lvl, score)
  VALUES(8 , 117);

 --Teslas table
INSERT INTO Teslas( lvl, score)
  VALUES(1 , 54);
INSERT INTO Teslas( lvl, score)
  VALUES(2 , 64);
INSERT INTO Teslas( lvl, score)
  VALUES(3 , 76);
INSERT INTO Teslas( lvl, score)
  VALUES(4 , 88);
INSERT INTO Teslas( lvl, score)
  VALUES(5 , 102);
INSERT INTO Teslas( lvl, score)
  VALUES(6 , 120);
INSERT INTO Teslas( lvl, score)
  VALUES(7 , 139);
INSERT INTO Teslas( lvl, score)
  VALUES(8 , 158);

--WizardTowers table
INSERT INTO WizardTowers( lvl, score)
  VALUES(1 , 25);
INSERT INTO WizardTowers( lvl, score)
  VALUES(2 , 30);
INSERT INTO WizardTowers( lvl, score)
  VALUES(3 , 37);
INSERT INTO WizardTowers( lvl, score)
  VALUES(4 , 46);
INSERT INTO WizardTowers( lvl, score)
  VALUES(5 , 55);
INSERT INTO WizardTowers( lvl, score)
  VALUES(6 , 73);
INSERT INTO WizardTowers( lvl, score)
  VALUES(7 , 92);
INSERT INTO WizardTowers( lvl, score)
  VALUES(8 , 115);

--Walls table
INSERT INTO Walls( lvl, score)
  VALUES(1 , 300);
INSERT INTO Walls( lvl, score)
  VALUES(2 , 500);
INSERT INTO Walls( lvl, score)
  VALUES(3 , 700);
INSERT INTO Walls( lvl, score)
  VALUES(4 , 900);
INSERT INTO Walls( lvl, score)
  VALUES(5 , 1400);
INSERT INTO Walls( lvl, score)
  VALUES(6 , 2000);
INSERT INTO Walls( lvl, score)
  VALUES(7 , 2500);
INSERT INTO Walls( lvl, score)
  VALUES(8 , 3000); 
INSERT INTO Walls( lvl, score)
  VALUES(9 , 4000);
INSERT INTO Walls( lvl, score)
  VALUES(10 , 5500);
INSERT INTO Walls( lvl, score)
  VALUES(11 , 7000);    







--Archer table
INSERT INTO Archers( lvl, score)
  VALUES(1 , 7);
INSERT INTO Archers( lvl, score)
  VALUES(2 , 12);
INSERT INTO Archers( lvl, score)
  VALUES(3 , 17);
INSERT INTO Archers( lvl, score)
  VALUES(4 , 21);
INSERT INTO Archers( lvl, score)
  VALUES(5 , 27);
INSERT INTO Archers( lvl, score)
  VALUES(6 , 31);
INSERT INTO Archers( lvl, score)
  VALUES(7 , 35);


--Balloons Table
INSERT INTO Balloons( lvl, score)
  VALUES(1 , 25);
INSERT INTO Balloons( lvl, score)
  VALUES(2 , 60);
INSERT INTO Balloons( lvl, score)
  VALUES(3 , 72);
INSERT INTO Balloons( lvl, score)
  VALUES(4 , 115);
INSERT INTO Balloons( lvl, score)
  VALUES(5 , 205);
INSERT INTO Balloons( lvl, score)
  VALUES(6 , 415);

--Barbs table
INSERT INTO Barbs( lvl, score)
  VALUES(1 , 8);
INSERT INTO Barbs( lvl, score)
  VALUES(2 , 19);
INSERT INTO Barbs( lvl, score)
  VALUES(3 , 25);
INSERT INTO Barbs( lvl, score)
  VALUES(4 , 33);
INSERT INTO Barbs( lvl, score)
  VALUES(5 , 40);
INSERT INTO Barbs( lvl, score)
  VALUES(6 , 44);
INSERT INTO Barbs( lvl, score)
  VALUES(7 , 50);

--Giants table
INSERT INTO Giants( lvl, score)
  VALUES(1 , 11);
INSERT INTO Giants( lvl, score)
  VALUES(2 , 20);
INSERT INTO Giants( lvl, score)
  VALUES(3 , 29);
INSERT INTO Giants( lvl, score)
  VALUES(4 , 34);
INSERT INTO Giants( lvl, score)
  VALUES(5 , 45);
INSERT INTO Giants( lvl, score)
  VALUES(6 , 67);
INSERT INTO Giants( lvl, score)
  VALUES(7 , 71);

--Dragons table
INSERT INTO Dragons( lvl, score)
  VALUES(1 , 140);
INSERT INTO Dragons( lvl, score)
  VALUES(2 , 190);
INSERT INTO Dragons( lvl, score)
  VALUES(3 , 210);
INSERT INTO Dragons( lvl, score)
  VALUES(4 , 230);

--Hogs table
INSERT INTO Hogs( lvl, score)
  VALUES(1 , 60);
INSERT INTO Hogs( lvl, score)
  VALUES(2 , 102);
INSERT INTO Hogs( lvl, score)
  VALUES(3 , 128);
INSERT INTO Hogs( lvl, score)
  VALUES(4 , 147);
INSERT INTO Hogs( lvl, score)
  VALUES(5 , 165);

--Golems table
INSERT INTO Golems( lvl, score)
  VALUES(1 , 129);
INSERT INTO Golems( lvl, score)
  VALUES(2 , 142);
INSERT INTO Golems( lvl, score)
  VALUES(3 , 156);
INSERT INTO Golems( lvl, score)
  VALUES(4 , 170);
INSERT INTO Golems( lvl, score)
  VALUES(5 , 224);

--LavaHounds table
INSERT INTO LavaHounds( lvl, score)
  VALUES(1 , 300);
INSERT INTO LavaHounds( lvl, score)
  VALUES(2 , 360);
INSERT INTO LavaHounds( lvl, score)
  VALUES(3 , 420);

--Minions table
INSERT INTO Minions( lvl, score)
  VALUES(1 , 35);
INSERT INTO Minions( lvl, score)
  VALUES(2 , 42);
INSERT INTO Minions( lvl, score)
  VALUES(3 , 48);
INSERT INTO Minions( lvl, score)
  VALUES(4 , 52);
INSERT INTO Minions( lvl, score)
  VALUES(5 , 58);
INSERT INTO Minions( lvl, score)
  VALUES(6 , 64);

--PEKKAS table
INSERT INTO PEKKAS( lvl, score)
  VALUES(1 , 240);
INSERT INTO PEKKAS( lvl, score)
  VALUES(2 , 345);
INSERT INTO PEKKAS( lvl, score)
  VALUES(3 , 375);
INSERT INTO PEKKAS( lvl, score)
  VALUES(4 , 440);
INSERT INTO PEKKAS( lvl, score)
  VALUES(5 , 480);

--WallBreakers table
INSERT INTO WallBreakers( lvl, score)
  VALUES(1 , 12);
INSERT INTO WallBreakers( lvl, score)
  VALUES(2 , 20);
INSERT INTO WallBreakers( lvl, score)
  VALUES(3 , 29);
INSERT INTO WallBreakers( lvl, score)
  VALUES(4 , 36);
INSERT INTO WallBreakers( lvl, score)
  VALUES(5 , 56);
INSERT INTO WallBreakers( lvl, score)
  VALUES(6 , 66);

--Witches table
INSERT INTO Witches( lvl, score)
  VALUES(1 , 201);
INSERT INTO Witches( lvl, score)
  VALUES(2 , 304);

--Wizards table
INSERT INTO Wizards( lvl, score)
  VALUES(1 , 50);
INSERT INTO Wizards( lvl, score)
  VALUES(2 , 100);
INSERT INTO Wizards( lvl, score)
  VALUES(3 , 120);
INSERT INTO Wizards( lvl, score)
  VALUES(4 , 177);
INSERT INTO Wizards( lvl, score)
  VALUES(5 , 238);
INSERT INTO Wizards( lvl, score)
  VALUES(6 , 255);

--BarbKing table
INSERT INTO BarbKing( lvl, score)
  VALUES(1 , 120);
INSERT INTO BarbKing( lvl, score)
  VALUES(5 , 260);
INSERT INTO BarbKing( lvl, score)
  VALUES(10 , 375);
INSERT INTO BarbKing( lvl, score)
  VALUES(20 , 510);
INSERT INTO BarbKing( lvl, score)
  VALUES(30 , 610);
INSERT INTO BarbKing( lvl, score)
  VALUES(40 , 720);

--ArchQueen table
INSERT INTO ArchQueen( lvl, score)
  VALUES(1 , 160);
INSERT INTO ArchQueen( lvl, score)
  VALUES(5 , 275);
INSERT INTO ArchQueen( lvl, score)
  VALUES(10 , 425);
INSERT INTO ArchQueen( lvl, score)
  VALUES(20 , 550);
INSERT INTO ArchQueen( lvl, score)
  VALUES(30 , 630);
INSERT INTO ArchQueen( lvl, score)
  VALUES(40 , 740);


--Clan Values
INSERT INTO clans(clanName, troopScoreMin,villageScoreMin)
  VALUES('Alpaca Prime',600,750);
INSERT INTO clans(clanName, troopScoreMin,villageScoreMin)
  VALUES('Alpaca Junior',400,375);  



--Chiefs Values
INSERT INTO Chiefs(email, fName, lName, chiefName, age, townHall)
  VALUES('iliveinla@gmail.com','Joe','Strauss','Stark',34,8);
INSERT INTO Chiefs(email, fName, chiefName, age, townHall)
  VALUES('jdoe@gmail.com','Miguel','CastleBone',31,10);
INSERT INTO Chiefs(email, fName, lName, chiefName, age, townHall)
  VALUES('bertbiz@gmail.com','Alan','Strauss','Alan',40,7);
INSERT INTO Chiefs(email, fName, lName, chiefName, age, townHall)
  VALUES('livinlarge77@gmail.com','Max','Fedder','Killer K',37,9);
INSERT INTO Chiefs(email, fName, lName, chiefName, age, townHall)
  VALUES('byhisgrace85@gmail.com','Tammy','Rodgers','Tammy',29,7);

--Chief Troops Inventory
INSERT INTO PlayerTroop_Inventory(email,archers,balloons,barbs,dragons,giants,
				   golems,hogs,minions,wallBreakers,wizards,barbKing)
  VALUES('iliveinla@gmail.com',5,5,5,3,5,2,4,3,5,5,10);
INSERT INTO PlayerTroop_Inventory(email,barbs,archers,giants,wallBreakers,
				   balloons,wizards,dragons,pekkas,minions,hogs,
				   golems,witches,lavaHounds,barbKing,archQueen)
  VALUES('jdoe@gmail.com',5,6,6,6,6,6,4,3,2,4,3,2,1,5,5);
INSERT INTO PlayerTroop_Inventory(email,barbs,archers,giants,wallBreakers,
				   balloons,wizards,dragons,minions,barbKing)
  VALUES('bertbiz@gmail.com',3,3,3,3,3,3,1,1,1);
INSERT INTO PlayerTroop_Inventory(email,barbs,archers,giants,wallBreakers,
				   balloons,wizards,dragons,pekkas,minions,hogs,
				   barbKing,archQueen)
  VALUES('livinlarge77@gmail.com',5,4,4,1,3,5,3,1,1,1,5,5);
INSERT INTO PlayerTroop_Inventory(email,barbs,archers,giants,wallBreakers,
				   balloons,wizards,dragons,minions,hogs,barbKing)
  VALUES('byhisgrace85@gmail.com',3,4,4,3,3,4,2,2,1,1);


--Chief village Inventory
INSERT INTO Playervillage_Inventory(email,airDefs,airSweepers,archerTowers,cannons,mortars,teslas,wizardTowers,walls,barbKing)
  VALUES('iliveinla@gmail.com',6,3,10,10,6,6,6,8,10);
INSERT INTO Playervillage_Inventory(email,airDefs,airSweepers,archerTowers,cannons,infernos,mortars,teslas,wizardTowers,walls,barbKing,archQueen)
  VALUES('jdoe@gmail.com',5,1,9,10,1,6,7,6,8,5,5);
INSERT INTO Playervillage_Inventory(email,airDefs,archerTowers,cannons,mortars,teslas,wizardTowers,walls)
  VALUES('bertbiz@gmail.com',4,7,8,4,1,4,6);
INSERT INTO Playervillage_Inventory(email,airDefs,airSweepers,archerTowers,cannons,mortars,teslas,wizardTowers,walls,barbKing,archQueen)
  VALUES('livinlarge77@gmail.com',4,2,8,10,4,4,4,6,5,5);
INSERT INTO Playervillage_Inventory(email,airDefs,airSweepers,archerTowers,cannons,mortars,teslas,wizardTowers,walls,barbKing)
  VALUES('byhisgrace85@gmail.com',5,1,8,8,5,1,4,6,1);
   
--Creat Warlogs
INSERT INTO warLogs(email)
  VALUES('iliveinla@gmail.com');
INSERT INTO warLogs(email)
  VALUES('bertbiz@gmail.com');
INSERT INTO warLogs(email)
  VALUES('jdoe@gmail.com');
INSERT INTO warLogs(email)
  VALUES('livinlarge77@gmail.com');
INSERT INTO warLogs(email)
  VALUES('byhisgrace85@gmail.com');

--------------------------------------------------------------
--
-- 	ALL FUNCTIONS
--
--------------------------------------------------------------

----------------------------------------------------------------
-- troopScore() will tally the chiefs total troop value       --
----------------------------------------------------------------

create or replace function troopScore(varchar) returns int as
$$
declare
    chiefEmail varchar := $1;
    total int = 0;

begin

  -- These are manditory troops for joining the Alpaca's

  
	 total = total + (SELECT score From Barbs Where lvl = (SELECT barbs 
							      FROM PlayerTroop_inventory 
							      WHERE email = chiefEmail));

	 total = total + (SELECT score From Archers Where lvl = (SELECT archers 
								FROM PlayerTroop_inventory 
								WHERE email = chiefEmail));

	 total = total + (SELECT score From Giants Where lvl = (SELECT Giants 
							       FROM PlayerTroop_inventory 
							       WHERE email = chiefEmail));

	 total = total + (SELECT score From WallBreakers Where lvl = (SELECT wallBreakers 
							      FROM PlayerTroop_inventory 
							      WHERE email = chiefEmail));

	 total = total + (SELECT score From Balloons Where lvl = (SELECT balloons 
								FROM PlayerTroop_inventory 
								WHERE email = chiefEmail));

	 total = total + (SELECT score From Wizards Where lvl = (SELECT wizards 
							       FROM PlayerTroop_inventory 
							       WHERE email = chiefEmail));
							       
	 total = total + (SELECT score From Dragons Where lvl = (SELECT dragons 
							      FROM PlayerTroop_inventory 
							      WHERE email = chiefEmail));


       -- These are not required, therefore we must handle possible NULL values.
       -- All NULL values will equal 0

	       
		IF (total = total + (SELECT score From PEKKAS Where lvl = (SELECT pekkas FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From PEKKAS Where lvl = (SELECT pekkas FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Minions Where lvl = (SELECT minions FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Minions Where lvl = (SELECT minions FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Hogs Where lvl = (SELECT hogs FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Hogs Where lvl = (SELECT hogs FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Golems Where lvl = (SELECT golems FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Golems Where lvl = (SELECT golems FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From LavaHounds Where lvl = (SELECT lavaHounds FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From LavaHounds Where lvl = (SELECT lavaHounds FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Witches Where lvl = (SELECT witches FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Witches Where lvl = (SELECT witches FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From BarbKing Where lvl = (SELECT barbKing FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From BarbKing Where lvl = (SELECT barbKing FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From ArchQueen Where lvl = (SELECT archQueen FROM PlayerTroop_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From ArchQueen Where lvl = (SELECT archQueen FROM PlayerTroop_inventory WHERE email = chiefEmail)); END IF;

	RETURN total;
	
 
end;
$$
LANGUAGE plpgsql;



----------------------------------------------------------------
-- villageScore() will tally the chiefs total base value     --
----------------------------------------------------------------

create or replace function villageScore(varchar) returns int as
$$
declare
    chiefEmail varchar := $1;
    total int = 0;

begin

  -- These are manditory Defenses for joining the Alpaca's

  
	 total = total + (SELECT score From AirDefs Where lvl = (SELECT airDefs 
							         FROM Playervillage_inventory 
							         WHERE email = chiefEmail));

	 total = total + (SELECT score From ArcherTowers Where lvl = (SELECT archerTowers 
								      FROM Playervillage_inventory 
								      WHERE email = chiefEmail));

	 total = total + (SELECT score From Cannons Where lvl = (SELECT cannons 
							         FROM Playervillage_inventory 
							         WHERE email = chiefEmail));

	 total = total + (SELECT score From Mortars Where lvl = (SELECT mortars 
							         FROM Playervillage_inventory 
							         WHERE email = chiefEmail));

	 total = total + (SELECT score From WizardTowers Where lvl = (SELECT WizardTowers 
							              FROM Playervillage_inventory 
								      WHERE email = chiefEmail));

	 total = total + (SELECT score From Walls Where lvl = (SELECT Walls 
							       FROM Playervillage_inventory 
							       WHERE email = chiefEmail));

							       
       -- These are not required, therefore we must handle possible NULL values.
       -- All NULL values will equal 0

       
		IF (total = total + (SELECT score From AirSweepers Where lvl = (SELECT airSweepers FROM Playervillage_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From AirSweepers Where lvl = (SELECT airSweepers FROM Playervillage_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Infernos Where lvl = (SELECT infernos FROM Playervillage_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Infernos Where lvl = (SELECT infernos FROM Playervillage_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From Teslas Where lvl = (SELECT teslas FROM Playervillage_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From Teslas Where lvl = (SELECT teslas FROM Playervillage_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From BarbKing Where lvl = (SELECT BarbKing FROM Playervillage_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From BarbKing Where lvl = (SELECT BarbKing FROM Playervillage_inventory WHERE email = chiefEmail)); END IF;

		IF (total = total + (SELECT score From ArchQueen Where lvl = (SELECT ArchQueen FROM Playervillage_inventory WHERE email = chiefEmail))) IS NULL THEN
			total = total + 0;
		ELSE
			total = total + (SELECT score From ArchQueen Where lvl = (SELECT ArchQueen FROM Playervillage_inventory WHERE email = chiefEmail)); END IF;

	RETURN total;
	
 
end;
$$
LANGUAGE plpgsql;

----------------------------------------------------------------
-- Promote() will promote Members to Elders to Co-leaders     --
----------------------------------------------------------------
create or replace function Promote(chief varchar, clanName varchar) RETURNS void AS
$$
begin
		IF (SELECT clanStatus 
		    FROM Chiefs 
		    WHERE Chiefs.chiefName = chief 
		    AND
		       Chiefs.clan = clanName) = 'Member' THEN
			UPDATE Chiefs
			SET clanStatus = 'Elder'
			WHERE Chiefs.chiefName = chief AND Chiefs.clan = clanName;

		ELSIF (SELECT clanStatus 
		       FROM Chiefs 
		       WHERE Chiefs.chiefName = chief 
		    AND
		        Chiefs.clan = clanName) = 'Elder' THEN
				UPDATE Chiefs
				SET clanStatus = 'Co-Leader'
				WHERE Chiefs.chiefName = chief AND Chiefs.clan = clanName;
		ELSE
		
		END IF;
end;
$$
LANGUAGE plpgsql;


----------------------------------------------------------------
-- Demote() lower the Chief rank by one			      --
----------------------------------------------------------------

create or replace function Demote(chief varchar, clanName varchar) RETURNS void AS
$$
begin
		IF (SELECT clanStatus 
		    FROM Chiefs 
		    WHERE Chiefs.chiefName = chief 
		    AND
		       Chiefs.clan = clanName) = 'Co-Leader' THEN
			UPDATE Chiefs
			SET clanStatus = 'Elder'
			WHERE Chiefs.chiefName = chief AND Chiefs.clan = clanName;

		ELSIF (SELECT clanStatus 
		       FROM Chiefs 
		       WHERE Chiefs.chiefName = chief 
		    AND
		        Chiefs.clan = clanName) = 'Elder' THEN
				UPDATE Chiefs
				SET clanStatus = 'Member'
				WHERE Chiefs.chiefName = chief AND Chiefs.clan = clanName;
		ELSE
		
		END IF;
end;
$$
LANGUAGE plpgsql;


----------------------------------------------------------------
-- newLeader will demote current Leader to Co-Leader and      --
-- promote the given member in the clan to Leader             --
----------------------------------------------------------------
--*******************DEACTIVATED:BUGS***************************

-- create or replace function newLeader(chief varchar, clanName varchar) RETURNS void AS
-- $$
--   declare
--    oldLeader varchar = (SELECT chiefName
-- 		        FROM Chiefs
-- 		        WHERE clanStatus = 'Leader'
-- 		        AND
-- 		              clan = clanName);
-- begin
-- 		IF (oldLeader IS NOT NULL) THEN
-- 			UPDATE Chiefs
-- 			SET clan = clanName, clanStatus =
-- 			CASE
-- 				WHEN chiefName = oldLeader THEN 'Co-Leader'
-- 				WHEN chiefName = chief THEN 'Leader'
-- 			ELSE
-- 				UPDATE Chiefs
-- 				SET clanStatus = 'Leader'
-- 				WHERE Chiefs.chiefName = chief AND Chiefs.clan = clanName;
-- 		END IF;
-- 	
-- 
-- end;
-- $$
-- LANGUAGE plpgsql;


----------------------------------------------------------------
-- addToClan() will add a member to a new clan and change     --
-- their status in that clan to Member			      --
----------------------------------------------------------------
create or replace function addToClan(emailID varchar, clanName varchar) RETURNS void AS
$$

begin
		UPDATE Chiefs
		SET clanStatus = 'Member',clan = clanName
		WHERE Chiefs.email = emailID;
end;
$$
LANGUAGE plpgsql;


----------------------------------------------------------------
-- dropFromClan() will add a member to a new clan and change  --
-- their status in that clan to Member			      --
----------------------------------------------------------------
create or replace function dropFromClan(emailID varchar) RETURNS void AS
$$

begin
		UPDATE Chiefs
		SET clanStatus = 'Member',clan = null
		WHERE Chiefs.email = emailID;
end;
$$
LANGUAGE plpgsql;

----------------------------------------------------------------
-- dropFromClan() will add a member to a new clan and change  --
-- their status in that clan to Member			      --
----------------------------------------------------------------

CREATE VIEW AlpacaChiefs (chief, townHall,clan,status, atkScore, defScore)
AS
SELECT chiefName, townHall, clan, clanStatus, troopScore(email), villageScore(email)
FROM Chiefs
ORDER BY townHall DESC;


--*******************************************
-- TEST QUERIES --
--*******************************************

select troopScore('iliveinla@gmail.com');
select troopScore('bertbiz@gmail.com');
select troopScore('jdoe@gmail.com');

select villageScore('iliveinla@gmail.com');
select villageScore('bertbiz@gmail.com');
select villageScore('jdoe@gmail.com');


select Promote('Stark','Alpaca Prime');
select Demote('Stark','Alpaca Prime');

select newLeader('Tammy','Alpaca Junior');
select addToClan('byhisgrace85@gmail.com', 'Alpaca Junior');

select addToClan('livinlarge77@gmail.com','Alpaca Prime');
select addToClan('jdoe@gmail.com','Alpaca Prime');

select dropFromClan('livinlarge77@gmail.com');

select *
from AlpacaChiefs;

select *
from chiefs;

select villageScore('iliveinla@gmail.com');

select *
from PlayerTroop_Inventory;


select *
From Clans;

select *
from warLogs;
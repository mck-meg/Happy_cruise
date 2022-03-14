DROP DATABASE IF EXISTS `HAPPY_CRUISE`;
CREATE DATABASE IF NOT EXISTS `HAPPY_CRUISE`;
USE `HAPPY_CRUISE`;

CREATE TABLE `PASSENGER` 
( `PASSENGERNUM`  INTEGER(6) PRIMARY KEY,
  `PASSENGERNAME` VARCHAR(25), 
  `SOCSECNUM`     INTEGER(9), 
  `STATE`         VARCHAR(25), 
  `COUNTRY`       VARCHAR(15) );

CREATE TABLE `PORT` 
( `PORTNAME` VARCHAR(25), 
  `COUNTRY`  VARCHAR(15), 
  `NUMDOCKS` INTEGER(2), 
  `MANAGER`  VARCHAR(25), 
  PRIMARY KEY (`PORTNAME`, `COUNTRY`) );

CREATE TABLE `SHIP` 
( `SHIPNUM`    INTEGER(2) PRIMARY KEY, 
  `SHIPNAME`   VARCHAR(35), 
  `BUILDER`    VARCHAR(25), 
  `LAUNCHDATE` DATE, 
  `WEIGHT`     INTEGER(6) );

CREATE TABLE `CRUISE` 
( `CRUISENUM` INTEGER(5) PRIMARY KEY, 
  `STARTDATE` DATE, 
  `ENDDATE`   DATE, 
  `DIRECTOR`  VARCHAR(25), 
  `SHIPNUM`   INTEGER(2),
  FOREIGN KEY (SHIPNUM) REFERENCES SHIP(SHIPNUM) );

CREATE TABLE `VISIT` 
( `CRUISENUM` INTEGER(5), 
  `PORTNAME`  VARCHAR(25), 
  `COUNTRY`   VARCHAR(15), 
  `ARRDATE`   DATE, 
  `DEPDATE`   DATE, 
  PRIMARY KEY (`CRUISENUM`, `PORTNAME`, `COUNTRY`),
  FOREIGN KEY (CRUISENUM) REFERENCES CRUISE(CRUISENUM),
  FOREIGN KEY (PORTNAME, COUNTRY) REFERENCES PORT(PORTNAME, COUNTRY) );

CREATE TABLE `VOYAGE` 
( `PASSENGERNUM` INTEGER(6), 
  `CRUISENUM`    INTEGER(5), 
  `ROOMNUM`      INTEGER(5), 
  `FARE`         DECIMAL(7,2), 
  PRIMARY KEY (`PASSENGERNUM`, `CRUISENUM`),
  FOREIGN KEY (PASSENGERNUM) REFERENCES PASSENGER(PASSENGERNUM),
  FOREIGN KEY (CRUISENUM) REFERENCES CRUISE(CRUISENUM) );

INSERT INTO `PASSENGER`
VALUES 
(481912, 'DuBois', 48294713, 'Paris', 'France'),
(842642, 'Smith', 10482746, 'North Carolina', 'USA'),
(901734, 'Jones', 58377163, 'Tennessee', 'USA'),
(133861, 'Smythe', 83776427, 'London', 'UK'),
(254381, 'Lopez', 59244163, 'Madrid', 'Spain'),
(310656, 'Simmons', 49271183, 'California', 'USA'),
(524891, 'Carter', 72716328, 'Ohio', 'USA'),
(759285, 'Jackson', 49218549, 'Tennessee', 'USA'),
(628902, 'Smith', 31498577, 'Tennessee', 'USA'),
(259028, 'Gonzalez', 13287482, 'Texas', 'USA'),
(945198, 'Billings', 82711611, 'Oregon', 'USA'),
(234149, 'Kaplan', 62945822, 'Oregon', 'USA'),
(428247, 'Jennings', 48375913, 'Texas', 'USA'),
(739716, 'Lopez', 32572856, 'Arkansas', 'USA'),
(142174, 'Carter', 42916465, 'Georgia', 'USA'),
(225729, 'Johnson', 93015012, 'Georgia', 'USA'),
(425911, 'Dodd', 52478221, 'New York', 'USA'),
(394587, 'Singh', 34575207, 'Illinois', 'USA');

INSERT INTO `PORT`
VALUES 
('Vancouver', 'Canada', 23, 'Smythe'),
('Halifax', 'Canada', 18, 'Jones'),
('Montreal', 'Canada', 12, 'Williams'),
('Caracas', 'Venezuela', 18, 'Gomez'),
('Maracaibo', 'Venezuela', 12, 'Perez'),
('Puerto Cabello', 'Venezuela', 2, 'Gonzalez'),
('New York', 'USA', 32, 'Carter'),
('New Orleans', 'USA', 19, 'Adams'),
('Long Beach', 'USA', 41, 'Baker'),
('Boston', 'USA', 15, 'Martin'),
('Oakland', 'USA', 35, 'Fields'),
('Miami', 'USA', 14, 'Vincent'),
('Shanghai', 'China', 45, 'Chen'),
('Hangzhou', 'China', 37, 'Zhang'),
('Fuzhou', 'China', 26, 'Yang'),
('Mombasa', 'Kenya', 10, 'Smith'),
('Gdansk', 'Poland', 9, 'Kowalski');

INSERT INTO `SHIP`
VALUES 
(5, 'Sea Joy', 'Jones', '1999-05-12', 80000),
(9, 'Ocean IV', 'Ajax', '2003-12-10', 75000),
(12, 'Prince Al', 'Ajax', '2004-07-21', 90000),
(20, 'Queen Shirley', 'Master', '1999-09-01', 80000),
(7, 'The Spirit of Memphis', 'Ace Shipbuilding Corp.', '1998-10-20', 65000),
(32, 'King of the Sea', 'Ace Shipbuilding Corp.', '2006-06-24', 55000),
(28, 'Sea Peace', 'Ace Shipbuilding Corp.', '2010-09-22', 95000),
(16, 'Ocean V', 'Ace Shipbuilding Corp.', '2010-01-27', 95000),
(25, 'The Spirit of Nashville', 'Master', '2006-04-30', 48000),
(41, 'Princess of Florida', 'Jones', '2011-02-11', 95000);

INSERT INTO `CRUISE`
VALUES 
(21644, '2002-07-05', '2002-07-12', 'Smith', 9),
(23007, '2002-08-14', '2002-08-24', 'Chen', 20),
(24288, '2003-03-28', '2003-04-04', 'Smith', 9),
(26964, '2003-07-01', '2003-07-11', 'Gomez', 20),
(27045, '2003-07-15', '2003-07-22', 'Adams', 12),
(28532, '2003-08-17', '2003-08-24', 'Adams', 12),
(29191, '2003-12-20', '2003-12-27', 'Jones', 9),
(29890, '2004-01-15', '2004-01-22', 'Levin', 20),
(35218, '2008-02-25', '2008-03-05', 'Carter', 32),
(42983, '2011-07-15', '2011-07-22', 'Lucas', 28),
(42996, '2011-07-22', '2011-07-29', 'Lucas', 28),
(42999, '2011-07-29', '2011-08-05', 'Norton', 28),
(43744, '2011-07-25', '2011-08-10', 'Goldberg', 41),
(44791, '2011-07-21', '2011-07-28', 'Barton', 20),
(45109, '2011-07-02', '2011-07-09', 'Adams', 25),
(45231, '2011-07-09', '2011-07-16', 'Davidson', 25),
(45270, '2011-07-16', '2011-08-03', 'Cohen', 25),
(45382, '2011-08-03', '2011-08-10', 'Stevenson', 25);

INSERT INTO `VISIT`
VALUES 
(27045, 'Caracas', 'Venezuela', '2003-07-16', '2003-07-17'),
(27045, 'Maracaibo', 'Venezuela', '2003-07-17', '2003-07-17'),
(27045, 'Miami', 'USA', '2003-07-19', '2003-07-20'),
(42983, 'Oakland', 'USA', '2011-07-16', '2011-07-17'),
(42983, 'Vancouver', 'Canada', '2011-07-18', '2011-07-19'),
(21644, 'New York', 'USA', '2002-07-06', '2002-07-07'),
(21644, 'Boston', 'USA', '2002-07-07', '2002-07-08'),
(21644, 'Halifax', 'Canada', '2002-07-09', '2002-07-10'),
(23007, 'Fuzhou', 'China', '2002-08-15', '2002-08-16'),
(23007, 'Shanghai', 'China', '2002-08-17', '2002-08-19'),
(23007, 'Hangzhou', 'China', '2002-08-20', '2002-08-21'),
(45270, 'Miami', 'USA', '2011-07-17', '2011-07-19'),
(45270, 'New York', 'USA', '2011-07-20', '2011-07-23'),
(45270, 'Halifax', 'Canada', '2011-07-28', '2011-07-31'),
(44791, 'New Orleans', 'USA', '2011-07-21', '2011-07-22'),
(44791, 'Miami', 'USA', '2011-07-24', '2011-07-25'),
(35218, 'Long Beach', 'USA', '2008-02-25', '2008-02-26'),
(35218, 'Oakland', 'USA', '2008-02-27', '2008-02-29'),
(35218, 'Vancouver', 'Canada', '2008-03-01', '2008-03-04');

INSERT INTO `VOYAGE`
VALUES 
(481912, 45231, 4252, 1000),
(901734, 45109, 3182, 950),
(254381, 45270, 11383, 1550),
(524891, 45382, 7245, 1290),
(628902, 42983, 4564, 799),
(945198, 45109, 8272, 800),
(428247, 45231, 10754, 1256),
(142174, 45270, 5346, 999),
(425911, 45382, 7434, 875),
(394587, 42983, 2562, 690),
(842642, 24288, 4215, 875),
(133861, 29191, 1155, 680),
(310656, 35218, 4233, 950),
(759285, 21644, 6435, 1099),
(259028, 45382, 12414, 1499),
(234149, 27045, 6236, 845),
(739716, 27045, 5234, 725),
(225729, 26964, 3662, 890);
-- create table MATCH

CREATE TABLE PLAYERS.MATCH (
  SLNO INT AUTO_INCREMENT PRIMARY KEY,
  MATCH_ID INT NOT NULL UNIQUE,
  TEAM1 VARCHAR(20),
  TEAM2 VARCHAR(20),
  GROUND VARCHAR(20),
  PLAY_DATE DATE,
  WINNER VARCHAR(20)
) AUTO_INCREMENT=1;


-- insert values

INSERT INTO PLAYERS.MATCH (MATCH_ID, TEAM1, TEAM2, GROUND, PLAY_DATE, WINNER) VALUES
(2475 ,'Australia' ,'India' ,'Melbourn' ,'2008-02-10' ,'Team2'),
(2576 , 'India' ,'Srilanka' ,'Adelaide' ,'2008-02-19' ,'Team1'),
(2677 , 'Australia' ,'India' ,'Sydney' ,'2008-03-02' ,'Team1'),
(2778 , 'Australia' ,'Srilanka' ,'Brisbane' ,'2008-03-04' ,'Team2'),
(2879 , 'Srilanka' ,'India' ,'Colombo' ,'2008-08-27' ,'Team2');

--------------------------------------------------------------------------------------------------------

-- create table PLAYER

CREATE TABLE PLAYERS.PLAYER (
  SLNO INT AUTO_INCREMENT PRIMARY KEY,
  Player_Id INT NOT NULL UNIQUE,
  Lname VARCHAR(20),
  Fname VARCHAR(20),
  Country VARCHAR(20),
  Yborn INT,
  Bplace VARCHAR(20),
  Ftest INT
) AUTO_INCREMENT=100;


--  @@AUTO_INCREMENT_INCREMENT & @@AUTO_INCREMENT_OFFSET cannot be negative and requires manual handling in this case

-- Declareing variable to keep track of SLNO

SET @slno = 100;

-- Insert values manually

INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 49001, 'Tendulkar', 'Sachin', 'India', 1973, 'Mumbai', 1986);

SET @slno = @slno - 10;
INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 49002, 'Dravid', 'Rahul', 'India', 1973, 'Indore', 1996);

SET @slno = @slno - 10;
INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 59001, 'Vass', 'Chaminda', 'Srilanka', 1974, 'Mattumagala', 1994);

SET @slno = @slno - 10;
INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 59002, 'Jayasuriya', 'Sanath', 'Srilanka', 1969, 'Matara', 1991);

SET @slno = @slno - 10;
INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 69001, 'Lee', 'Brett', 'Australia', 1976, 'Wollongong', 1999);

SET @slno = @slno - 10;
INSERT INTO PLAYERS.PLAYER VALUES
(@slno, 69002, 'Symonds', 'Andrew', 'Australia', 1975, 'Birmingham', 2004);

--------------------------------------------------------------------------------------------------------

-- create table BOWLING

CREATE TABLE PLAYERS.BOWLING (
  SLNO INT AUTO_INCREMENT PRIMARY KEY,
  Match_Id INT,
  Player_Id INT,
  Novers INT,
  Maidens INT,
  Nrun_rcv INT,
  Nwickets INT,
  FOREIGN KEY (Match_Id) REFERENCES PLAYERS.MATCH(MATCH_ID),
  FOREIGN KEY (Player_Id) REFERENCES PLAYERS.PLAYER(Player_Id)
) AUTO_INCREMENT=1000;

-- setting increment value

SET @@auto_increment_increment = 2;

-- Inserting values

INSERT INTO PLAYERS.BOWLING (Match_Id, Player_Id, Novers, Maidens, Nrun_rcv, Nwickets) VALUES 
(2576, 59001, 8, 3, 58, 1),
(2677, 69001, 10, 1, 27, 3),
(2879, 49002, 7, 0, 44, 0),
(2576, 49001, 3, 2, 15, 1),
(2778, 59001, 7, 1, 20, 5);

--------------------------------------------------------------------------------------------------------

-- create table BATTING

CREATE TABLE PLAYERS.BATTING (
SLNO INT AUTO_INCREMENT PRIMARY KEY,
Match_Id INT,
Player_Id INT,
Nrun_sc INT,
FOREIGN KEY (Match_Id) REFERENCES PLAYERS.MATCH(MATCH_ID),
FOREIGN KEY (Player_Id) REFERENCES PLAYERS.PLAYER(Player_Id)
) AUTO_INCREMENT = 501;

-- setting increment value back to 1

set @@auto_increment_increment = 1;

-- Inserting values

INSERT INTO PLAYERS.BATTING (Match_Id, Player_Id, Nrun_sc) VALUES
(2677, 49001, 60),
(2778, 59002, 71),
(2879, 59001, 60),
(2778, 69002, 17),
(2879, 59002, 45),
(2576, 49001, 36),
(2475, 49002, 72);

--------------------------------------------------------------------------------------------------------

/*
decrementing has to be done manually
auto_increment_increment would apply to entire session, meaning it would affect all tables using auto_increment and has to be managed accordingly.
/*
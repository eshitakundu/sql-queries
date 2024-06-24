--create a sequence
CREATE SEQUENCE seq_match
START WITH 1
INCREMENT BY 1
MAXVALUE 5
NOCYCLE
CACHE 20;

--create table
CREATE TABLE MATCH(
SLNO NUMBER(1),
Match_ID NUMBER(4) PRIMARY KEY,
Team1 VARCHAR(20),
Team2 VARCHAR(20),
Ground VARCHAR(20),
Play_Date date,
Winner VARCHAR(20)
);

--insert values
INSERT INTO MATCH VALUES ( seq_match.NEXTVAL, 2475 , 'Australia ' , 'India', 'Melbourn', '10-FEB-08', 'Team2');
INSERT INTO MATCH VALUES ( seq_match.NEXTVAL, 2576 , 'India ', 'Srilanka', 'Adelaide ', '19-FEB-08 ', 'Team1 ');
INSERT INTO MATCH VALUES ( seq_match.NEXTVAL, 2677 , 'Australia ', 'India', 'Sydney ', '02-MAR-08 ', 'Team1 ');
INSERT INTO MATCH VALUES ( seq_match.NEXTVAL, 2778 , 'Australia ', 'Srilanka ', 'Brisbane ', '04-MAR-08 ', 'Team2 ');
INSERT INTO MATCH VALUES ( seq_match.NEXTVAL, 2879 , 'Srilanka ', 'India ', 'Colombo ', '27-AUG-08 ', 'Team2 ');

--------------------------------------------------------------------------------------------------------

--create a sequence
CREATE SEQUENCE seq_player
START WITH 100
INCREMENT BY -10
MINVALUE 50 
MAXVALUE 100
NOCYCLE
CACHE 20;

--create table
CREATE TABLE PLAYER(
SLNO NUMBER(3),
Player_Id NUMBER(5) PRIMARY KEY,
Lname VARCHAR(20),
Fname VARCHAR(20),
Country VARCHAR(20),
Yborn NUMBER(4),
Bplace VARCHAR(20),
Ftest NUMBER(4)
);

--insert values
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 49001, 'Tendulkar', 'Sachin', 'India', 1973, 'Mumbai', 1986);
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 49002, 'Dravid', 'Rahul', 'India', 1973, 'Indore', 1996);
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 59001, 'Vass', 'Chaminda', 'Srilanka', 1974, 'Mattumagala', 1994);
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 59002, 'Jayasuriya', 'Sanath', 'Srilanka', 1969, 'Matara', 1991);
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 69001, 'Lee', 'Brett', 'Australia', 1976, 'Wollongong', 1999); 
INSERT INTO PLAYER VALUES (seq_player.NEXTVAL, 69002, 'Symonds', 'Andrew', 'Australia', 1975, 'Birminghum', 2004);

--------------------------------------------------------------------------------------------------------

--create a sequence
CREATE SEQUENCE seq_bowl
START WITH 1000
INCREMENT BY 2
MAXVALUE 1008
NOCYCLE
CACHE 20;

--create table
CREATE TABLE BOWLING(
SLNO NUMBER(4),
Match_Id NUMBER(4) REFERENCES MATCH,
Player_Id NUMBER(5) REFERENCES PLAYER,
Novers NUMBER(2),
Maidens NUMBER(1),
Nrun_rcv NUMBER(2),
Nwickets NUMBER(1)
); 

--insert values
INSERT INTO BOWLING VALUES ( seq_bowl.NEXTVAL, 2576, 59001, 8, 3, 58, 1);
INSERT INTO BOWLING VALUES ( seq_bowl.NEXTVAL, 2677, 69001, 10, 1, 27, 3);
INSERT INTO BOWLING VALUES ( seq_bowl.NEXTVAL, 2879, 49002, 7, 0, 44, 0);
INSERT INTO BOWLING VALUES ( seq_bowl.NEXTVAL, 2576, 49001, 3, 2, 15, 1);
INSERT INTO BOWLING VALUES ( seq_bowl.NEXTVAL, 2778, 59001, 7, 1, 20, 5);

--------------------------------------------------------------------------------------------------------

--create a sequence
CREATE SEQUENCE seq_bat
START WITH 501
INCREMENT BY 1
MAXVALUE 507
NOCYCLE
CACHE 20;

--create table
CREATE TABLE BATTING(
SLNO NUMBER(3),
Match_Id NUMBER(4) REFERENCES MATCH,
Player_Id NUMBER(5) REFERENCES PLAYER,
Nrun_sc NUMBER(2)
);

--insert values
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2677, 49001, 60);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2778, 59002, 71);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2879, 59001, 60);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2778, 69002, 17);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2879, 59002, 45);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2576, 49001, 36);
INSERT INTO BATTING VALUES (seq_bat.NEXTVAL, 2475, 49002, 72);

--------------------------------------------------------------------------------------------------------

/*
Desc user_sequences;
DROP SEQUENCE sequence_name;
*/

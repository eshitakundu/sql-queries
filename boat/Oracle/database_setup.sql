--Create table 'Sailor':

CREATE TABLE Sailor(
	SID VARCHAR2(4) PRIMARY KEY CHECK ( SID LIKE 's%' ),
	SNAME VARCHAR2(10) CHECK ( SNAME = INITCAP(SNAME)),
	MNAME VARCHAR2(10),
	SURNAME VARCHAR2(10) NOT NULL,
	RATING NUMBER(2) DEFAULT 0,
	AGE NUMBER(3,1) NOT NULL);


--Insert values into 'Sailor':

INSERT INTO Sailor VALUES ('s22', 'Fredrico', ' ', 'Roberts', 7, 45);
INSERT INTO Sailor VALUES ('s31', 'Lubber', ' ', 'Sheen', 8, 55.5);
INSERT INTO Sailor VALUES ('s32', 'Charlotte', ' ', 'Gordin', 8, 25.5);
INSERT INTO Sailor VALUES ('s58', 'Mary', 'Beth', 'Lyon', 10, 35);
INSERT INTO Sailor VALUES ('s64', 'Horatio', ' ', 'Powell', 7, 35.4);
INSERT INTO Sailor VALUES ('s71', 'Zorba', ' ', 'Alex', 10, 16);
INSERT INTO Sailor VALUES ('s29', 'Brutus', ' ', 'Slater', 1, 33.8);
INSERT INTO Sailor VALUES ('s95', 'Deep', 'Graceb', 'Davis', 3, 63.5);
INSERT INTO Sailor VALUES ('s74', 'Horatio', ' ', 'Forrest', 9, 35);
INSERT INTO Sailor VALUES ('s85', 'Sara', 'Art', 'Powell', 3, 25.5);
INSERT INTO Sailor VALUES ('s80', 'Deep', 'Kumar', 'Kumar', 6, 17);
INSERT INTO Sailor VALUES ('s87', 'Deep', 'Kumar', 'Jha', NULL, 51);

-----------------------------------------------------------------------------------------

--Create table 'Boat':

CREATE TABLE Boat(
	BID NUMBER(3) PRIMARY KEY,
	BNAME VARCHAR2(10) CHECK ( BNAME = UPPER(BNAME) ),
	COLOUR VARCHAR2(6) CHECK ( COLOUR IN ( 'red', 'green', 'blue' ) ) );


--Insert values into 'Boat':

INSERT INTO Boat VALUES ( 101, 'INTERLAKE', 'blue');
INSERT INTO Boat VALUES ( 102, 'INTERLAKE', 'red');
INSERT INTO Boat VALUES ( 103, 'CLIPPER', 'green');
INSERT INTO Boat VALUES ( 104, 'MARINE', 'red');

-----------------------------------------------------------------------------------------

--Create table 'Reserved':

CREATE TABLE Reserved(
	SID VARCHAR2(4) REFERENCES Sailor,
	BID NUMBER(3) REFERENCES Boat,
	DAY DATE CHECK ( DAY < '1-JAN-2000' ),
	PRIMARY KEY (SID, BID) );


--Insert values into 'Reserved':

INSERT INTO Reserved VALUES ('s22', 101, '10-OCT-1998');
INSERT INTO Reserved VALUES ('s22', 103, '10-AUG-1998');
INSERT INTO Reserved VALUES ('s22', 102, '10-OCT-1998');
INSERT INTO Reserved VALUES ('s22', 104, '10-JUL-1998');
INSERT INTO Reserved VALUES ('s31', 102, '11-OCT-1998');
INSERT INTO Reserved VALUES ('s31', 103, '11-JUN-1998');
INSERT INTO Reserved VALUES ('s31', 104, '11-DEC-1998');
INSERT INTO Reserved VALUES ('s64', 101, '09-MAY-1998');
INSERT INTO Reserved VALUES ('s64', 102, '09-AUG-1998');
INSERT INTO Reserved VALUES ('s74', 103, '09-AUG-1998');
INSERT INTO Reserved VALUES ('s80', 102, '07-JUL-1998');
INSERT INTO Reserved VALUES ('s87', 101, '08-JUL-1998');
INSERT INTO Reserved VALUES ('s87', 102, '12-DEC-1998');

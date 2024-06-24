--Create table 'Employee':
CREATE TABLE EMPLOYEE(
	FNAME VARCHAR(20),
  	MINIT VARCHAR(1),
  	LNAME VARCHAR(20),
  	SSN NUMBER(10) PRIMARY KEY,
  	BDATE date,
  	ADDRESS VARCHAR(50),
  	SEX VARCHAR(1),
  	SALARY NUMBER(10),
  	SUPERSSN NUMBER(10),
  	DNO NUMBER(10));

--Insert values into 'Employee':
INSERT INTO EMPLOYEE VALUES ('John','B','Smith',123456789,'09-JAN-1995','731 Fondren,Houston,TX','M',30000,333445555,5);
INSERT INTO EMPLOYEE VALUES('Alicia','J','Zelaya',999887777,'19-JUL-1951','3321 Castle,Spring,TX','F',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES('Jennifer','S','Wallace',987654321,'20-JUN-1941','291 Berry,bellaire,TX','F',43000,888665555,4);
INSERT INTO EMPLOYEE VALUES('Ramesh','K','Narayan',666884444,'15-SEP-1962','975 Fire Oak,Humble,TX','M',38000,333445555,5);
INSERT INTO EMPLOYEE VALUES('Joyce','A','Bond',453453453,'31-JUL-1963','5631 Rice,Houston,TX','F',25000,333445555,5);
INSERT INTO EMPLOYEE VALUES('Ahmad','V','Jabbar',333445555,'29-MAR-1969','980 Dallas,Houston,TX','M',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES('James','E','Bong',888665555,'10-NOV-1956','450 Stone,Houston,TX','M',55000,987654321,1);

------------------------------------------------------------------------------------------------------------------------------------------------

--Create table 'Department':
CREATE TABLE DEPARTMENT(
DNAME VARCHAR(20),
DNUMBER NUMBER(10) PRIMARY KEY,
MGRSSN NUMBER(10) REFERENCES EMPLOYEE(SSN),
MGRSTARTDATE date);

--Insert values into 'Department':
INSERT INTO DEPARTMENT VALUES('Administration',4,987654321,'1-JAN-1995');
INSERT INTO DEPARTMENT VALUES('Headquarters',1,888665555,'19-JUN-1981');
INSERT INTO DEPARTMENT VALUES('Research',5,333445555,'22-MAY-1988');

------------------------------------------------------------------------------------------------------------------------------------------------

--Create table 'Dept_Location':
CREATE TABLE DEPT_LOCATIONS(
DNUMBER NUMBER(10) REFERENCES DEPARTMENT,
DLOCATION VARCHAR(20));

--Insert values into 'Dept_Location':
INSERT INTO DEPT_LOCATIONS VALUES(1,'Houston');
INSERT INTO DEPT_LOCATIONS VALUES(4,'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES(5,'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES(5,'Sugarland');
INSERT INTO DEPT_LOCATIONS VALUES(5,'Houston');

------------------------------------------------------------------------------------------------------------------------------------------------

--Create table 'Project':
CREATE TABLE PROJECT(
PNAME VARCHAR(20),
PNUMBER NUMBER(10) PRIMARY KEY,
PLOCATION VARCHAR(20),
DNUM NUMBER(10) REFERENCES DEPARTMENT(DNUMBER));

--Insert values into 'Project':
INSERT INTO PROJECT VALUES ('ProductX',1,'Bellaire',5);
INSERT INTO PROJECT VALUES ('ProductY',2,'Sugarland',5);
INSERT INTO PROJECT VALUES ('ProductZ',3,'Houston',5);
INSERT INTO PROJECT VALUES ('Computerization',10,'Stafford',4);
INSERT INTO PROJECT VALUES ('Reorganization',20,'Houston',1);
INSERT INTO PROJECT VALUES ('Newbenefits',30,'Stafford',4);

------------------------------------------------------------------------------------------------------------------------------------------------

--Create table 'Works_On':
CREATE TABLE WORKS_ON(
ESSN NUMBER(10) REFERENCES EMPLOYEE(SSN),
PNO NUMBER(10) REFERENCES PROJECT(PNUMBER),
HOURS NUMBER(10) DEFAULT NULL);

--Insert values into 'Works_On':
INSERT INTO WORKS_ON VALUES (123456789,1,33.0);
INSERT INTO WORKS_ON VALUES(123456789,2,8.0);
INSERT INTO WORKS_ON VALUES(666884444,3,40.0);
INSERT INTO WORKS_ON VALUES(453453453,1,20.0);
INSERT INTO WORKS_ON VALUES(453453453,2,20.0);
INSERT INTO WORKS_ON VALUES(333445555,2,10.0);
INSERT INTO WORKS_ON VALUES(333445555,3,10.0);
INSERT INTO WORKS_ON VALUES(333445555,10,10.0);
INSERT INTO WORKS_ON VALUES(333445555,20,10.0);
INSERT INTO WORKS_ON VALUES(999887777,30,30.0);

------------------------------------------------------------------------------------------------------------------------------------------------

--Create table 'Dependent':
CREATE TABLE DEPENDENT(
ESSN NUMBER(10) REFERENCES EMPLOYEE(SSN),
DEPENDENT_NAME VARCHAR(20),
SEX VARCHAR(1),
BDATE date,
RELATIONSHIP VARCHAR(20));

--Insert values into 'Dependent':
INSERT INTO DEPENDENT VALUES(987654321,'Abner','M','28-FEB-1942','SPOUSE');
INSERT INTO DEPENDENT VALUES(123456789,'Michael','M','4-JAN-1988','SON');
INSERT INTO DEPENDENT VALUES(123456789,'Alice','F','30-DEC-1988','DAUGHTER');
INSERT INTO DEPENDENT VALUES(123456789,'Elizabeth','F','5-MAY-1967','SPOUSE');
INSERT INTO DEPENDENT VALUES(999887777,'Alice','F','5-APR-1986','DAUGHTER');
INSERT INTO DEPENDENT VALUES(666884444,'Theodore','M','25-OCT-1983','SON');
INSERT INTO DEPENDENT VALUES(453453453,'Joy','F','3-MAY-1958','SPOUSE');
INSERT INTO DEPENDENT VALUES(999887777,'Alice','F','5-APR-1986','DAUGHTER');
INSERT INTO DEPENDENT VALUES(666884444,'Theodore','M','25-OCT-1983','SON');
INSERT INTO DEPENDENT VALUES(453453453,'Joy','F','3-MAY-1958','SPOUSE');

------------------------------------------------------------------------------------------------------------------------------------------------

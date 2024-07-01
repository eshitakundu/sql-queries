--Create table Msc from student table with same field and structure, no data.
CREATE TABLE Msc AS (SELECT * FROM Student WHERE 1=2);


--Display structure of MSc
DESC Msc;


--Create table MCA  from student table with same field and structure, no data. 
CREATE TABLE MCA AS (SELECT * FROM Student WHERE 1=2);


--Rename course to department and name to first name.
ALTER TABLE MCA RENAME COLUMN Course TO Department;
ALTER TABLE MCA RENAME COLUMN Name TO First_Name;


--Display structure of MCA
DESC MCA;


--Display student details
SELECT * FROM Student;


--Details of student with roll number 5
SELECT * FROM Student where ROLL = 5;


--Show roll, name, marks of all subjects from student table
SELECT Roll, Name, Math, Physics, Computer FROM Student;


--Insert data in the MCA table from the Student table where course is MCA
INSERT INTO MCA SELECT * FROM Student WHERE Course = 'MCA';


--Display Student and MCA table structures
DESC Student;
DESC MCA;


--Update math marks of student with roll no 7 from 91 to 95 in the student table
UPDATE Student SET Math = 95 WHERE Roll = 7;


--Delete the details of the student with roll no 2 from student table
DELETE FROM Student WHERE Roll = 2;

/*
Miscllaneous
SET LINESIZE __;
SET PAGESIZE __;
*/

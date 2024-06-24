--Create a table “Student”
CREATE TABLE Student(
Roll Number(5),
Name Varchar2(30),
Age Number(5),
Course Varchar2(5),
Math Number(6,2),
Physics Number(6,2),
Computer Number(6,2),
Birthday Date);

--Inserting values
INSERT INTO Student VALUES(1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '15-JUN-1993');
INSERT INTO Student VALUES(
INSERT INTO Student VALUES(
INSERT INTO Student VALUES(

--Alternative approach
INSERT INTO Student VALUES ( &Roll, '&Name', &Age, '&Course', &Math, &Physics, &Computer, '&Birthday');
--insert all the values manually

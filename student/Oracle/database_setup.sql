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
INSERT INTO Student VALUES (1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '15-JUN-1993');
INSERT INTO Student VALUES (2, 'Kunal', 21, 'BCA', 68, 76, 59.5, '16-AUG-1991');
INSERT INTO Student VALUES (3, 'Aditi', 20, 'MSc', 90, 73, 56, '20-SEP-1992');
INSERT INTO Student VALUES (4, 'Sumit', 20, 'MCA', 57.5, 78, 81, '07-DEC-1991');
INSERT INTO Student VALUES (5, 'Anirban', 22, 'MCA', 80, 68, 63, '15-SEP-1994');
INSERT INTO Student VALUES (6, 'Kumkum', 21, 'BCA', 72, 54.5, 60, '08-FEB-1995');
INSERT INTO Student VALUES (7, 'Suman', 21, 'BCA', 91.5, 32, 61, '10-MAR-1994');
INSERT INTO Student VALUES (8, 'Rohit', 22, 'MSc', 85, 76, 92, '19-APR-1992');

--Alternative approach
INSERT INTO Student VALUES ( &Roll, '&Name', &Age, '&Course', &Math, &Physics, &Computer, '&Birthday');
--insert all the values manually

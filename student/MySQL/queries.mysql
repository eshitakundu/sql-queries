-- Create a table "Msc" from the Student table (same structure, no data).
CREATE TABLE students.msc LIKE students.student;

-- Display the structure of the "Msc" table.
DESCRIBE students.msc;
--alternative:
SHOW COLUMNS FROM students.msc;

-- Create a table "MCA" from the Student table (same structure, no data). 
CREATE TABLE students.MCA LIKE students.STUDENT;

-- Rename the "course" column to "department" and the "name" column to "first name."
ALTER TABLE students.mca
CHANGE COLUMN COURSE DEPARTMENT VARCHAR(45),
CHANGE COLUMN `NAME` `FIRST NAME` VARCHAR(30);

-- Display the structure of the "MCA" table.
DESCRIBE students.mca;

-- Display student details.
SELECT * FROM students.student;

-- Retrieve details of the student with roll number 5.
SELECT * FROM students.student WHERE Roll = 5;


-- Show roll number, name, and marks of all subjects from the Student table.
SELECT ROLL, NAME, MATH, PHYSICS, COMPUTER FROM students.student;

-- Insert data into the "MCA" table from the Student table where the course is "MCA."
INSERT INTO students.MCA 
SELECT * FROM students.STUDENT WHERE COURSE = 'MCA';

-- Display the structures of both the "Student" and "MCA" tables.
DESCRIBE students.student;
DESCRIBE students.mca;

-- Update the math marks of the student with roll number 7 from 91 to 95 in the Student table.
UPDATE STUDENTS.STUDENT
SET MATH = 95
WHERE ROLL = 7;

-- Delete the details of the student with roll number 2 from the Student table.
DELETE FROM STUDENTS.STUDENT
WHERE ROLL = 2;

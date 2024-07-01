--Create table schema

CREATE SCHEMA `STUDENTS` ;

--Create a table “Student”

CREATE TABLE `students`.`student` (
  `Roll` INT NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Age` INT NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Math` DECIMAL(6,2) NULL,
  `Physics` DECIMAL(6,2) NULL,
  `Computer` DECIMAL(6,2) NULL,
  `Birthday` DATE NULL,
  PRIMARY KEY (`Roll`));

--Inserting values

INSERT INTO `students`.`student` (Roll, Name, Age, Course, Math, Physics, Computer, Birthday)
VALUES
  (1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '1993-06-15'),
  (2, 'Kunal', 21, 'BCA', 68, 76, 59.5, '1991-08-16'),
  (3, 'Aditi', 20, 'MSc', 90, 73, 56, '1992-09-20'),
  (4, 'Sumit', 20, 'MCA', 57.5, 78, 81, '1991-12-07'),
  (5, 'Anirban', 22, 'MCA', 80, 68, 63, '1994-09-15'),
  (6, 'Kumkum', 21, 'BCA', 72, 54.5, 60, '1995-02-08'),
  (7, 'Suman', 21, 'BCA', 91.5, 32, 61, '1994-03-10'),
  (8, 'Rohit', 22, 'MSc', 85, 76, 92, '1992-04-19');

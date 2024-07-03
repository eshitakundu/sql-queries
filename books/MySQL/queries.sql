-- Retrieve the name of books and cost who has maximum value.

SELECT BOOK_NAME, COST
FROM Books
WHERE COST = (SELECT MAX(COST) FROM Books);

-- Calculate the Minimum cost, Average cost and Total cost value in BOOKS table and Rename the resulting attributes.

SELECT 
MIN(COST) AS Minimum_Cost,
AVG(COST) AS Average_Cost,
SUM(COST) AS Total_Cost
FROM Books;


-- Retrieve the Name and ID of Members who's issued book between 26th January 2011 and 14th April 2011.

SELECT MEMBER_ID, MEMBER_NAME
FROM Member
WHERE MEMBER_ID IN (
    SELECT MEMBER_ID
    FROM Issue
    WHERE ISSUE_DATE BETWEEN '2011-01-26' AND '2011-04-14'
);

-- Retrieve Book Name, Author Name and Category whose Category is not 'OTHERS'.

SELECT BOOK_NAME, AUTHOR_NAME, CATEGORY
FROM Books
WHERE CATEGORY <> 'Others';

-- ALTERNATIVE:
SELECT BOOK_NAME, AUTHOR_NAME, CATEGORY
FROM Books
WHERE NOT (CATEGORY = 'Others');

---------------------------------------------------------------------------------------

-- Retrieve the Book name and Author Name where:

-- 5th letter of the Author name is 't'. 
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE SUBSTR(AUTHOR_NAME, 5, 1) = 't';

-- Author name starts with S'. 
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE AUTHOR_NAME LIKE 'S%';

-- Author name starts with S' and contains at least one letter after that. 
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE AUTHOR_NAME LIKE 'S_%';

-- Author name ends with the letter 'a'.
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE AUTHOR_NAME LIKE '%a';

-- 3rd and 5th letters of the Author name is 'a'. 
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE SUBSTRING(AUTHOR_NAME, 3, 1) = 'a' AND SUBSTRING(AUTHOR_NAME, 5, 1) = 'a';

-- ALTERNATIVE:
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE AUTHOR_NAME LIKE '__a_a%';

-- 2nd last letter of the author name is 'a'.
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE SUBSTR(AUTHOR_NAME, -2, 1) = 'a';

-- Author name starts with D' and ends with 'e'
SELECT BOOK_NAME, AUTHOR_NAME
FROM Books
WHERE AUTHOR_NAME LIKE 'D%e';

---------------------------------------------------------------------------------------

-- List all the Members whose name:

-- Starts with S.
SELECT MEMBER_ID, MEMBER_NAME
FROM Member
WHERE MEMBER_NAME LIKE 'S%';

-- Starts with s or a and contains the letter t in it.
SELECT MEMBER_ID, MEMBER_NAME
FROM Member
WHERE (MEMBER_NAME LIKE 'S%' OR MEMBER_NAME LIKE 'A%') AND MEMBER_NAME LIKE '%t%';

-- List all the books that contain the word 'SQL' in the name of the book.
SELECT BOOK_NO, BOOK_NAME, AUTHOR_NAME, COST, CATEGORY
FROM Books
WHERE UPPER(BOOK_NAME) LIKE '%SQL%';

---------------------------------------------------------------------------------------

-- How many Books are available whose Cost is greater than 350.

SELECT COUNT(*)
FROM Books
WHERE COST > 350;

-- How many different Authors name are available in the BOOKS table.

SELECT COUNT(DISTINCT AUTHOR_NAME) AS DISTINCT_AUTHORS
FROM Books;

---------------------------------------------------------------------------------------

-- Calculate the following numeric functions:

-- What is the absolute value of -167. 
SELECT ABS(-167) as ABSOLUTE_VALUE;

-- Calculate 8^6. 	
SELECT POW(8, 6) AS "8^6"; -- double quotes " " in case numeric, special characters or space containing attribute name

-- Round up to 2 decimal points (134.56789). 
SELECT ROUND(134.56789, 2) as ROUND;

-- What is the square root of 144 
SELECT SQRT(144) as 'SQUARE ROOT';

-- Floor and Ceil value of 13.15. 
SELECT FLOOR(13.15) AS FLOOR, CEIL(13.15) AS CEILING;

---------------------------------------------------------------------------------------

-- Extract Year, Month, Day from System Date.

SELECT EXTRACT(YEAR FROM CURDATE()) AS "Year",
       EXTRACT(MONTH FROM CURDATE()) AS "Month",
       EXTRACT(DAY FROM CURDATE()) AS "Day";

-- ALTERNATIVE:
SELECT YEAR(CURDATE()) AS "Year",
       MONTH(CURDATE()) AS "Month",
       DAY(CURDATE()) AS "Day";


-- What is the greatest value between 4, 5 and 17.
	
SELECT GREATEST(4, 5, 17) as GREATEST;


-- What is the Least value between '4', '5' and '17' and express why resulting value of last two queries are same.

SELECT LEAST('4', '5', '17') as LEAST;

/* 
As '4', '5', and '17' are in quotes, they are treated as strings, not numbers. 
In string comparison, '17' is less than '4' and '5' because '1' is less than '4' and '5' in the ASCII table. 
So, LEAST('4', '5', '17') returns '17'. 
'4' = 52
'5' = 53
'17' = 44.55
*/


-- Extract 4 letters from 3rd position of this word 'INFOSYS'.

SELECT SUBSTRING('INFOSYS', 3, 4);


-- What is the ASCII value of 'a' and 'S'?

SELECT ASCII('a') AS "ASCII of 'a'", ASCII('S') AS "ASCII of 'S'";


-- What is the length of this word 'INFOSYS' and change 'S' with 'T'?
SELECT LENGTH('INFOSYS') AS "Length", 
       REPLACE('INFOSYS', 'S', 'T') AS "Replace";

-- Retrieve the Names and Address of the Members who belong to Kolkata.

SELECT MEMBER_NAME, MEMBER_ADDRESS
FROM Member
WHERE UPPER(MEMBER_ADDRESS) = 'KOLKATA';


-- Retrieve the Name of Books, where Cost prices are between 300 and 500. 

SELECT BOOK_NAME
FROM Books
WHERE COST BETWEEN 300 AND 500;


-- List the Name of the Members whose Membership type is "HALF YEARLY".

SELECT MEMBER_NAME
FROM Member
WHERE UPPER(MEMBERSHIP_TYPE) = 'HALF YEARLY';


-- List the Name of the Members who open their accounts in the year 2011.

SELECT MEMBER_NAME
FROM Member
WHERE YEAR(ACC_OPEN_DATE) = 2011;


-- Retrieve the Penalty Amount of the Members who has taken the book "LET US C". 

SELECT M.MEMBER_NAME, M.PENALTY_AMOUNT
FROM Member M
JOIN Issue I ON M.MEMBER_ID = I.MEMBER_ID
JOIN Books B ON I.BOOK_NO = B.BOOK_NO
WHERE UPPER(B.BOOK_NAME) = 'LET US C';


-- alternative: Subquery
SELECT MEMBER_NAME, PENALTY_AMOUNT
FROM Member
WHERE MEMBER_ID IN (
    SELECT DISTINCT MEMBER_ID
    FROM Issue
    WHERE BOOK_NO IN (
        SELECT BOOK_NO
        FROM Books
        WHERE UPPER(BOOK_NAME) = 'LET US C'
    )
);


 -- Retrieve the no of Max books allowed to a Member who has issued books on January.

SELECT M.MEMBER_NAME, M.MAX_BOOKS_ALLOWED
FROM Member M
JOIN Issue I ON M.MEMBER_ID = I.MEMBER_ID
WHERE MONTH(I.ISSUE_DATE) = 1;


-- Give the Names of the Members who have not issued any books.

SELECT MEMBER_NAME
FROM Member
WHERE MEMBER_ID NOT IN (SELECT MEMBER_ID FROM Issue);


-- Give the Name and Category of the books whose cost is not recorded. 

SELECT BOOK_NAME, CATEGORY
FROM Books
WHERE COST IS NULL;


-- List all the books that are written by Author Loni and has Price less than 600. 

SELECT BOOK_NAME
FROM Books
WHERE AUTHOR_NAME = 'Loni' AND COST < 600;


-- List the Issue details for the Books that are not returned yet. 

SELECT *
FROM Issue
WHERE RETURN_DATE IS NULL;


-- List all the Books that belong to any one of the following categories Science, Database. 

SELECT BOOK_NAME, CATEGORY
FROM Books
WHERE UPPER(CATEGORY) IN('SCIENCE', 'DATABASE');


-- List all the Members in the descending order of Penaltv due on them. 

SELECT MEMBER_NAME, PENALTY_AMOUNT
FROM Member
ORDER BY PENALTY_AMOUNT DESC;


-- List all the Books in ascending order of category and descending order of price. 

SELECT BOOK_NAME, CATEGORY, COST
FROM Books
ORDER BY CATEGORY ASC, COST DESC;


-- List the Entire Book name in INIT CAP and Author Name in UPPER case in the descending order of the Book Name. 
-- (as initcap is not a function in mysql, we can do the following)

SELECT CONCAT( UPPER(SUBSTRING(BOOK_NAME, 1, 1)),LOWER(SUBSTRING(BOOK_NAME, 2)) ) AS BOOK_NAME,
       UPPER(AUTHOR_NAME) AS AUTHOR_NAME
FROM Books
ORDER BY BOOK_NAME DESC;


-- List the data in the book table with category data displayed as D' for Database, 'S' for Science, 'R' for RDBMS and 'O' for all the others. 

SELECT BOOK_NAME, 
       CASE UPPER(CATEGORY) 
           WHEN 'DATABASE' THEN 'D'
           WHEN 'SCIENCE' THEN 'S'
           WHEN 'RDBMS' THEN 'R'
           ELSE 'O'
       END AS CATEGORY
FROM Books;


-- List all the Members that became the Member in the year 2011.

SELECT MEMBER_NAME, ACC_OPEN_DATE
FROM Member
WHERE YEAR(ACC_OPEN_DATE) = 2011;

---------------------------------------------------------------------------------------

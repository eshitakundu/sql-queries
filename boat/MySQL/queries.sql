-- Find the names in upper case and the ages of all sailors.

SELECT UPPER(CONCAT(SNAME,' ',MNAME,' ',SURNAME)) as NAME, AGE 
FROM Sailor;


-- Select all records from sailors in ascending order by name.

SELECT * FROM Sailor ORDER BY SNAME, MNAME, SURNAME ASC;


-- Select all distinct sailors' names.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) as 'DISTINCT NAME' FROM Sailor;


-- Show all distinct sailors' names and ratings who have ratings between 5 and 10.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) as NAME, RATING 
FROM Sailor
WHERE RATING BETWEEN 5 AND 10;


-- Select all records from sailors in ascending order by rating and descending order by age.

SELECT * 
FROM SAILOR
ORDER BY RATING ASC, AGE DESC;


-- Find records for sailor name Horatio and age=35.4.

SELECT *
FROM SAILOR
WHERE SNAME = 'Horatio' AND AGE = 35.4;


-- Select names of sailors who have reserved boat 104.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) as NAME, RATING 
FROM Sailor
WHERE RATING BETWEEN 5 AND 10;


-- Find sid of sailors who have reserved red boat.

SELECT DISTINCT(S.SID)
FROM SAILOR S, RESERVED R, BOAT B
WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOUR = 'red';


-- Select names for rating present.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor
WHERE RATING IS NOT NULL;


-- Select names for rating absent.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor
WHERE RATING IS NULL;


-- Find the color of boats reserved by Lubber.

SELECT S.SNAME, B.COLOUR 
FROM SAILOR S, BOAT B, RESERVED R
WHERE SNAME = 'Lubber' AND S.SID = R.SID AND B.BID = R.BID;


-- Find a sailor name that has reserved at least one boat.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) AS NAME
FROM Sailor S, Reserved R
WHERE S.SID = R.SID;


-- Find the name of sailors whose name begins and ends with B and has at least 3 characters.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor 
WHERE SNAME LIKE 'B%_B';


-- Find names of sailors whose name begins and ends with ‘B’ and has exactly 3 chars.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor 
WHERE SNAME LIKE 'B_B';


-- Find names of sailors who have reserved a red boat or a green boat.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) as NAME
FROM Sailor S, Reserved R, Boat B
WHERE S.SID = R.SID AND B.BID = R.BID AND (B.COLOUR = 'red' OR B.COLOUR = 'green');


-- Find names of sailors who have reserved a red boat but not a green boat.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor S
WHERE S.SID IN (
    SELECT R.SID FROM Reserved R, Boat B
    WHERE R.BID = B.BID AND B.COLOUR = 'red'
)
AND S.SID NOT IN (
    SELECT R.SID FROM Reserved R, Boat B
    WHERE R.BID = B.BID AND B.COLOUR = 'green'
);


-- Find names of sailors who have reserved boat 103.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor S, Reserved R
WHERE S.SID = R.SID AND R.BID = 103;


-- Find names of sailors who have reserved a red boat.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor S, Reserved R, Boat B
WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOUR = 'red';


-- Find names of sailors who have not reserved red boats.

SELECT DISTINCT(CONCAT(SNAME, ' ', MNAME, ' ', SURNAME)) as NAME
FROM Sailor S, Reserved R
WHERE S.SID = R.SID AND S.SID NOT IN (
    SELECT R.SID
    FROM Reserved R, Boat B
    WHERE R.BID = B.BID AND B.COLOUR = 'red'
);


-- Find all records of the sailors for which the rating is greater than the rating of some sailor, where the sailor's name is ‘Horatio’.

SELECT * FROM SAILOR
WHERE RATING > (SELECT max(RATING) FROM SAILOR WHERE SNAME = 'Horatio');


-- Find the average age of sailors with a rating of 10.

SELECT AVG(AGE) as "AVERAGE AGE"
FROM Sailor
WHERE RATING = 10;


-- Find the names of the sailors who are older than the oldest sailor of rating=10.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME
FROM Sailor
WHERE AGE > (SELECT MAX(AGE) FROM Sailor WHERE RATING = 10);


-- Find the age of the youngest sailor for each rating level.

SELECT MIN(AGE) as "YOUNGEST SAILOR", RATING
FROM Sailor
GROUP BY RATING
ORDER BY RATING;


-- Find the name of each sailor who is eligible to vote for each rating level.

SELECT CONCAT(SNAME, ' ', MNAME, ' ', SURNAME) as NAME, RATING
FROM Sailor
WHERE AGE >= 18
ORDER BY RATING;


-- Find the average age of a sailor for each rating level with at least two such sailors.

SELECT AVG(AGE), RATING
FROM Sailor
GROUP BY RATING
HAVING COUNT(*) >= 2;


-- For each red boat count the number of reservations for this boat.

SELECT COUNT(R.BID) as RESERVATIONS, R.BID
FROM RESERVED R, BOAT B
WHERE R.BID = B.BID AND B.COLOUR = 'red'
GROUP BY R.BID;


-- Find the records of the sailor who is getting the 2nd highest rating.

SELECT * 
FROM Sailor 
WHERE RATING = (
    SELECT MAX(RATING) 
    FROM Sailor 
    WHERE RATING < (SELECT MAX(RATING) FROM Sailor)
);

-- Alternative:
WITH RankedRatings AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY RATING DESC) AS rnk
    FROM Sailor
)
SELECT *
FROM RankedRatings
WHERE rnk = 2;


-- Find the names of sailors who got 3rd minimum rating.

SELECT * 
FROM Sailor 
WHERE RATING = (
    SELECT MIN(RATING) 
    FROM Sailor 
    WHERE RATING > (
        SELECT MIN(RATING) 
        FROM Sailor 
        WHERE RATING > (
            SELECT MIN(RATING) 
            FROM Sailor)));

-- Alternative:
WITH RankedRatings AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY RATING DESC) AS rnk
    FROM Sailor
)
SELECT *
FROM RankedRatings
WHERE rnk = 3;

-- Find sailors who have reserved all boats.

SELECT S.SID, S.SNAME
FROM Sailor S, Reserved R, Boat B
WHERE S.SID = R.SID AND R.BID = B.BID
GROUP BY S.SID, S.SNAME
HAVING COUNT(DISTINCT R.BID) = (SELECT COUNT(*) FROM Boat);


-- Find sailors who have reserved more than 2 boats.

SELECT S.SID, S.SNAME
FROM Sailor S
WHERE (SELECT COUNT(DISTINCT R.BID) FROM Reserved R WHERE S.SID = R.SID) > 2;

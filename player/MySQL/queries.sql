-- Find the ground of the matches batted by a player whose Fname is starting from 'S'.

SELECT P.FNAME, M.GROUND
FROM PLAYERS.MATCH M
JOIN PLAYERS.BATTING B ON M.MATCH_ID = B.MATCH_ID
JOIN PLAYERS.PLAYER P ON B.PLAYER_ID = P.PLAYER_ID
WHERE P.FNAME LIKE 'S%';

-- Find Id of player that have bowled in the match 2576 but not have batted.

SELECT PLAYER_ID
FROM PLAYERS.BOWLING
WHERE MATCH_ID = 2576
AND PLAYER_ID NOT IN (
    SELECT PLAYER_ID
    FROM PLAYERS.BATTING
    WHERE MATCH_ID = 2576
);

-- Find the batting average of each Indian player along with the Player_Id.

SELECT AVG(B.NRUN_SC) as AVERAGE, B.PLAYER_ID
FROM PLAYERS.BATTING B
JOIN PLAYERS.PLAYER P ON B.PLAYER_ID = P.PLAYER_ID
WHERE P.COUNTRY = 'India'
GROUP BY B.PLAYER_ID;

-- Find the name of that player who has bowled the highest number of overs and also find the ground where he has bowled.

SELECT CONCAT(P.FNAME, ' ', P.LNAME) as NAME, M.GROUND
FROM PLAYERS.PLAYER P
JOIN PLAYERS.BOWLING B ON P.PLAYER_ID = B.PLAYER_ID
JOIN PLAYERS.MATCH M ON B.MATCH_ID = M.MATCH_ID
WHERE B.NOVERS = (SELECT MAX(NOVERS) FROM PLAYERS.BOWLING);

-- Find the total run scored by a player who played the First Test in 1991.

SELECT SUM(B.NRUN_SC) as 'Total Run'
FROM PLAYERS.BATTING B
JOIN PLAYERS.PLAYER P ON P.PLAYER_ID = B.PLAYER_ID 
WHERE P.FTEST = 1991;

-- Find the name and the number of wickets taken by the youngest player in the database.

SELECT CONCAT(P.FNAME, ' ', P.LNAME) AS NAME, SUM(B.NWICKETS) AS "NO. OF WICKETS"
FROM PLAYERS.PLAYER P
JOIN PLAYERS.BOWLING B ON P.PLAYER_ID = B.PLAYER_ID
WHERE P.YBORN = (SELECT MIN(YBORN) FROM PLAYERS.PLAYER)
GROUP BY NAME;

-- Find the names of the players who batted in only one match.

SELECT CONCAT(P.FNAME, ' ', P.LNAME) AS NAME
FROM PLAYERS.PLAYER P
JOIN PLAYERS.BATTING B ON P.PLAYER_ID = B.PLAYER_ID
GROUP BY P.PLAYER_ID, NAME
HAVING COUNT(B.PLAYER_ID) = 1;

-- Find the name of the player who has taken the highest wickets in a particular match and also find the ground where the player has taken the wickets.

SELECT CONCAT(P.FNAME, ' ', P.LNAME) AS NAME, M.GROUND
FROM PLAYERS.PLAYER P
JOIN PLAYERS.BOWLING B ON P.PLAYER_ID = B.PLAYER_ID
JOIN PLAYERS.MATCH M ON B.MATCH_ID = M.MATCH_ID
WHERE B.NWICKETS = (SELECT MAX(NWICKETS) FROM PLAYERS.BOWLING);

-- Find the ground where Sachin Tendulkar has scored his highest run.

SELECT M.GROUND
FROM PLAYERS.MATCH M
JOIN PLAYERS.BATTING B ON M.MATCH_ID = B.MATCH_ID
JOIN PLAYERS.PLAYER P ON B.PLAYER_ID = P.PLAYER_ID
WHERE P.FNAME = 'Sachin'
AND B.NRUN_SC = (SELECT MAX(NRUN_SC) FROM PLAYERS.BATTING B
                 JOIN PLAYERS.PLAYER P ON B.PLAYER_ID = P.PLAYER_ID
                 WHERE P.FNAME = 'Sachin');

-- Find out the name of a Srilankan bowler who has delivered at least 2 maiden overs.

SELECT DISTINCT(CONCAT(P.FNAME, ' ', P.LNAME)) as NAME
FROM PLAYERS.PLAYER P
JOIN PLAYERS.BOWLING B ON P.PLAYER_ID = B.PLAYER_ID
WHERE P.COUNTRY = 'Srilanka' AND B.MAIDENS >= 2;

-- Find the Number of wickets of that player whose Birth place is in Mattumagala.

SELECT SUM(B.NWICKETS) as Wickets
FROM PLAYERS.BOWLING B
JOIN PLAYERS.PLAYER P ON B.PLAYER_ID = P.PLAYER_ID
WHERE P.BPLACE = 'Mattumagala';

-- Find the names of the players who played in more than one matches.

SELECT CONCAT(P.FNAME, ' ', P.LNAME) AS NAME
FROM PLAYERS.PLAYER P
WHERE P.PLAYER_ID IN (
    SELECT PLAYER_ID
    FROM PLAYERS.BATTING 
    GROUP BY PLAYER_ID
    HAVING COUNT(DISTINCT MATCH_ID) > 1
)
OR P.PLAYER_ID IN (
    SELECT PLAYER_ID
    FROM PLAYERS.BOWLING 
    GROUP BY PLAYER_ID
    HAVING COUNT(DISTINCT MATCH_ID) > 1
);

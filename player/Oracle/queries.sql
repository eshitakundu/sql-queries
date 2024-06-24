-- Find the ground of the matches batted by a player whose Fname is starting from 'S'.

SELECT P.FNAME, M.GROUND
FROM MATCH M, PLAYER P, BATTING B
WHERE M.MATCH_ID = B.MATCH_ID AND B.PLAYER_ID = P.PLAYER_ID AND P.FNAME LIKE 'S%';


-- Find Id of player that have bowled in the match 2576 but not have batted.

(SELECT PLAYER_ID
FROM BOWLING
WHERE MATCH_ID = 2576)
MINUS
(SELECT PLAYER_ID
FROM BATTING
WHERE MATCH_ID = 2576);


-- Find the batting average of each Indian player along with the Player_Id.

SELECT AVG(NRUN_SC) as AVERAGE, B.PLAYER_ID
FROM BATTING B, PLAYER P
WHERE B.PLAYER_ID = P.PLAYER_ID AND COUNTRY = 'India'
GROUP BY B.PLAYER_ID;


-- Find the name of that player who has bowled the highest number of overs and also find the ground where he has bowled.

SELECT (P.FNAME||' '||P.LNAME) as NAME, M.GROUND
FROM PLAYER P, MATCH M, BOWLING B
WHERE P.PLAYER_ID = B.PLAYER_ID AND B.MATCH_ID = M.MATCH_ID AND B.NOVERS = (SELECT MAX(NOVERS) FROM BOWLING);


-- Find the total run scored by a player who played the First Test in 1991.

SELECT SUM(B.NRUN_SC) as “Total Run”
FROM BATTING B, PLAYER P
WHERE P.PLAYER_ID = B.PLAYER_ID AND P.FTEST = 1991;


-- Find the name and the number of wickets taken by the youngest player in the database.

SELECT (P.FNAME || ' ' || P.LNAME) AS NAME, SUM(B.NWICKETS) AS "NO. OF WICKETS"
FROM PLAYER P, BOWLING B
WHERE P.PLAYER_ID = B.PLAYER_ID AND P.YBORN = (SELECT MIN(YBORN) FROM PLAYER)
GROUP BY (P.FNAME || ' ' || P.LNAME);


-- Find the names of the players who batted in only one match.

SELECT (P.FNAME || ' ' || P.LNAME) AS NAME
FROM PLAYER P, BATTING B
WHERE P.PLAYER_ID = B.PLAYER_ID
GROUP BY P.PLAYER_ID, (P.FNAME || ' ' || P.LNAME)
HAVING COUNT(B.PLAYER_ID) = 1;


-- Find the name of the player who has taken the highest wickets in a particular match and also find the ground where the player has taken the wickets.

SELECT (P.FNAME || ' ' || P.LNAME) AS NAME, M.GROUND
FROM PLAYER P, BOWLING B, MATCH M
WHERE P.PLAYER_ID = B.PLAYER_ID AND B.MATCH_ID = M.MATCH_ID
AND B.NWICKETS = (
    SELECT MAX(NWICKETS)
    FROM BOWLING
);


-- Find the ground where Sachin Tendulkar has scored his highest run.

SELECT M.GROUND
FROM MATCH M, PLAYER P, BATTING B
WHERE P.PLAYER_ID = B.PLAYER_ID AND B.MATCH_ID = M.MATCH_ID AND P.FNAME = 'Sachin'
AND NRUN_SC = (SELECT MAX(NRUN_SC) FROM BATTING B, PLAYER P WHERE B.PLAYER_ID = P.PLAYER_ID AND FNAME = 'Sachin');


-- Find out the name of a Srilankan bowler who has delivered at least 2 maiden overs.

SELECT DISTINCT(P.FNAME || ' ' || P.LNAME) as NAME
FROM PLAYER P, BOWLING B
WHERE COUNTRY = 'Srilanka' AND B.MAIDENS >= 2;


-- Find the Number of wickets of that player whose Birth place is in Mattumagala.

SELECT SUM(B.NWICKETS) as Wickets
FROM BOWLING B, PLAYER P
WHERE P.PLAYER_ID = B.PLAYER_ID AND BPLACE = 'Mattumagala';


-- Find the names of the players who played in more than one matches.

SELECT (P.FNAME || ' ' || P.LNAME) AS NAME
FROM PLAYER P
WHERE P.PLAYER_ID IN (
    SELECT PLAYER_ID
    FROM BATTING 
    GROUP BY PLAYER_ID
    HAVING COUNT(DISTINCT MATCH_ID) > 1
)
OR P.PLAYER_ID IN (
    SELECT PLAYER_ID
    FROM BOWLING 
    GROUP BY PLAYER_ID
    HAVING COUNT(DISTINCT MATCH_ID) > 1
);

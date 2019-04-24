
-- SQL Basic Queries

-- Select all from a database
SELECT *
FROM Birdstrikes

-- Select top 10 rows
SELECT TOP 10 * 
FROM Birdstrikes;

-- Select column
SELECT "airline"
FROM Birdstrikes

-- Select multiple columns
SELECT "airline", "state"
FROM Birdstrikes

-- Select distinct values
SELECT DISTINCT "airline"
FROM Birdstrikes

-- Select distinct pairs of values
SELECT DISTINCT "airline", "state"
FROM Birdstrikes

-- Select column and calculate
SELECT cost/1000
FROM Birdstrikes

-- Select column and round
SELECT ROUND(cost,0,0)
FROM Birdstrikes

-- Filter for column value
SELECT *
FROM Birdstrikes
WHERE state='Colorado';

-- Filter for value
SELECT *
FROM Birdstrikes
WHERE cost >= 100000

-- Filter for several attributes with AND
SELECT *
FROM Birdstrikes
WHERE state='Colorado' AND cost >= 100000

-- Filter for several attributes with OR
SELECT *
FROM Birdstrikes
WHERE (state='Colorado') OR (cost >= 100000)

-- Filter for several attributes and multiple categories
SELECT *
FROM Birdstrikes
WHERE (cost >= 100000) AND (state IN ('Colorado', 'Florida', 'Virginia'));

-- Order by ascending
SELECT *
FROM Birdstrikes
ORDER BY 'state' ASC

-- Order by descending
SELECT *
FROM Birdstrikes
ORDER BY 'state' DESC

-- Order by ascending and descending by columnn
SELECT *
FROM Birdstrikes
ORDER BY 'state' ASC, 'airline' DESC

-- Create a wrapper around a view
CREATE VIEW vw_Birdstrikes

AS
SELECT *
FROM Birdstrikes
WHERE (cost >= 100000) AND (state IN ('Colorado', 'Florida', 'Virginia'));

SELECT cost, state
FROM vw_Birdstrikes;


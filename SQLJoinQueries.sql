-- Examples from Joey Blue's tutorial from https://www.youtube.com/watch?v=2HVMiPPuPIM

-- Create schema
CREATE SCHEMA Joins

-- Create table 1
CREATE TABLE Joins.Customer -- Joins is the schema, Customer is the table
(CustomerId INTEGER IDENTITY PRIMARY KEY, -- First column
CityId DECIMAL NULL, -- Allows the column to be null
CustomerName VARCHAR(20)); -- Any character up to 20

SET IDENTITY_INSERT Joins.Customer ON
INSERT INTO Joins.Customer (CustomerId, CityId, CustomerName)
VALUES (1, 1, 'Bob Smith');
SET IDENTITY_INSERT Joins.Customer OFF

SET IDENTITY_INSERT Joins.Customer ON
INSERT INTO Joins.Customer (CustomerId, CityId, CustomerName)
VALUES (2, 1, 'Sally Smith');
SET IDENTITY_INSERT Joins.Customer OFF

SET IDENTITY_INSERT Joins.Customer ON
INSERT INTO Joins.Customer (CustomerId, CityId, CustomerName)
VALUES (3, 2, 'Tom Smith');
SET IDENTITY_INSERT Joins.Customer OFF

SET IDENTITY_INSERT Joins.Customer ON
INSERT INTO Joins.Customer (CustomerId, CityId, CustomerName)
VALUES (4, NULL, 'Mary Smith');
SET IDENTITY_INSERT Joins.Customer OFF

SELECT * FROM Joins.Customer

-- Create table 2
CREATE TABLE Joins.City -- Joins is the schema, City is the table
(CityId DECIMAL NULL, -- Allows the column to be null
CityName VARCHAR(20)); -- Any character up to 20

INSERT INTO Joins.City (CityId, CityName)
VALUES (1, 'Kansas City');

INSERT INTO Joins.City (CityId, CityName)
VALUES (2, 'New York');

INSERT INTO Joins.City (CityId, CityName)
VALUES (3, 'Houston');

SELECT * FROM Joins.City

-- Show both tables
SELECT * FROM Joins.Customer;
SELECT * FROM Joins.City;

-- Inner join: intersection of 2 Venn diagrams
SELECT * FROM Joins.Customer INNER JOIN Joins.City ON Customer.CityId=City.CityId -- Intersection on CityId

-- Left Join: Left Venn diagram + intersection of 2 Venn diagrams
SELECT * FROM Joins.Customer LEFT JOIN Joins.City ON Customer.CityId=City.CityId -- Left table will be the table on the left of the clause
SELECT * FROM Joins.Customer LEFT OUTER JOIN Joins.City ON Customer.CityId=City.CityId -- The full syntax includes the word outer (outside of the intersection)

-- Right join: Right Venn diagram + intersection of 2 Venn diagrams
SELECT * FROM Joins.Customer RIGHT JOIN Joins.City ON Customer.CityId=City.CityId -- Right table will be the table on the right of the clause

-- Full outer join: Intersection + left and right of the Venn diagram
SELECT * FROM Joins.Customer FULL JOIN Joins.City ON Customer.CityId=City.CityId
SELECT * FROM Joins.Customer FULL OUTER JOIN Joins.City ON Customer.CityId=City.CityId -- The full syntax includes the word outer

-- Aliasing tables with AS
SELECT * 
FROM Joins.Customer AS cs 
FULL JOIN Joins.City AS cy 
ON cs.CityId=cy.CityId

-- Specifying columns
SELECT cs.*, cy.CityName -- all columns from Customer and only CityName from City
FROM Joins.Customer AS cs
LEFT JOIN Joins.City cy ON cs.CityId=cy.CityId

-- Applying filter for specific city
SELECT cs.*, cy.CityName
FROM Joins.Customer AS cs
LEFT JOIN Joins.City cy ON cs.CityId=cy.CityId
WHERE cy.CityName='Kansas City'

-- Applying filter for specific city beofre the join resulting in incomplete table
SELECT cs.*, cy.CityName
FROM Joins.Customer AS cs
LEFT JOIN Joins.City cy ON cs.CityId=cy.CityId -- Left outer join on customers, so have all of our customers...
AND cy.CityName='Kansas City' -- ...but we only joined on specific city names filtering the city table beofre the join and will show NULL for customers where we have a city


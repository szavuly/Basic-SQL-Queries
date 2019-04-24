-- Create schema
CREATE SCHEMA Sales

-- Create table
CREATE TABLE Sales.Product -- Sales is the schema, Product is the table
(ProductID INTEGER IDENTITY PRIMARY KEY, -- First column
Name VARCHAR(20), -- Any character up to 20
Price DECIMAL NULL); -- Allows the column to be null

-- Alter table
ALTER TABLE Sales.Product
ADD Supplier INTEGER NOT NULL -- Add column, null is not allowed
CONSTRAINT def_supplier DEFAULT 1; -- If we don't know the value, the default value will be 1

-- Look at the table created
SELECT * 
FROM Sales.Product

-- Insert data
INSERT INTO Sales.Product
VALUES ('Widget', 12.99, 1); -- Data in the order of the columns

-- Insert data specifying the columns
INSERT INTO Sales.Product (Name, Price, Supplier)
VALUES ('Thingybob', 3.75, 2);

-- Insert incomplete data and populate with null and default we specified
INSERT INTO Sales.Product (Name)
VALUES ('Knicknack');

-- Retrieve data differently
SELECT Name AS Product, -- Retrieve Name column with another name
	Price * 0.9 AS SalePrice -- Retrieve price with another column name at 10% off
FROM Sales.Product

-- Drop table
DROP TABLE Sales.Product; -- Deletes the table, not the data
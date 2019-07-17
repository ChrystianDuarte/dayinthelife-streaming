-- Create a new database called 'InternationalDB'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'InternationalDB'
)
CREATE DATABASE InternationalDB
GO
-- Connect to the 'InternationalDB' database to run this snippet
USE InternationalDB
GO
-- Create a new table called 'Orders' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
DROP TABLE dbo.Orders
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Orders
(
    OrderId UNIQUEIDENTIFIER NOT NULL, -- primary key column
    OrderType [NVARCHAR](1) NOT NULL,
    OrderItemName [NVARCHAR](50) NOT NULL,
    Quantity INT NOT NULL,
    Price [NVARCHAR](50) NOT NULL,
    ShipmentAddress [NVARCHAR](100) NOT NULL,
    ZipCode [NVARCHAR](10) NOT NULL
    -- specify more columns here
);
GO
-- Create a new stored procedure called 'SpInsertOrder' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SpInsertOrder'
)
DROP PROCEDURE dbo.SpInsertOrder
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.SpInsertOrder
    @id UNIQUEIDENTIFIER,
    @type NVARCHAR(1),
    @item NVARCHAR(50),
    @quantity INT,
    @price NVARCHAR(50),
    @shipaddress NVARCHAR(100),
    @zipcode NVARCHAR(10)
AS
    INSERT INTO Orders
    ( -- columns to insert data into
     [OrderId], [OrderType], [OrderItemName], [Quantity], [Price], [ShipmentAddress], [ZipCode]
    )
    VALUES
    ( -- first row: values for the columns in the list above
     @id, @type, @item, @quantity, @price, @shipaddress, @zipcode
    )
    GO
GO
-- example to execute the stored procedure we just created
--EXECUTE dbo.SpInsertOrder @id = 'af504b24-c8cc-75bc-dc3d-ae2118a2d3ed', @type = 'E', @item = 'Bubble Gum', @quantity = 100, @price = '3.99', @shipaddress = '123  evergreen', @zipcode = '12345'
--GO
-- Query the total count of employees
SELECT COUNT(*) as OrdersCount FROM dbo.Orders;
-- Query all employee information
SELECT e.OrderId, e.OrderType, e.OrderItemName, e.Quantity, e.Price, e.ShipmentAddress, e.ZipCode 
FROM dbo.Orders as e
GO
CREATE DATABASE retail_sales_db;

USE retail_sales_db;
CREATE TABLE retail_sales (
  TransactionID INT PRIMARY KEY,
  TransactionTime DATETIME,
  ItemCode VARCHAR(20),
  ItemDescription VARCHAR(255),
  NumberOfItemsPurchased INT,
  CostPerItem DECIMAL(10,2),
  Country VARCHAR(100)
);

DROP TABLE retail_sales;


CREATE TABLE retail_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100));

retail_salesALTER TABLE retail_sales
MODIFY CustomerID INT NULL;

DROP TABLE retail_sales;

CREATE TABLE retail_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100)
);

SELECT COUNT(*) FROM retail_sales;

SELECT * FROM retail_sales LIMIT 10;

SELECT COUNT(*) FROM `online_retail.csv`;

SELECT * FROM `online_retail.csv` LIMIT 10;

SELECT COUNT(*) AS Total_Records
FROM `online_retail.csv`;

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM `online_retail.csv`;

SELECT Country, COUNT(*) AS Orders
FROM `online_retail.csv`
GROUP BY Country
ORDER BY Orders DESC
LIMIT 10;

SELECT Description,
SUM(Quantity) AS Total_Sold
FROM `online_retail.csv`
GROUP BY Description
ORDER BY Total_Sold DESC
LIMIT 10;


SELECT Description,
SUM(Quantity * UnitPrice) AS Revenue
FROM `online_retail.csv`
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

SELECT Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM `online_retail.csv`
GROUP BY Country
ORDER BY Revenue DESC;

SELECT
DATE_FORMAT(InvoiceDate,'%Y-%m') AS Month,
SUM(Quantity * UnitPrice) AS Revenue
FROM `online_retail.csv`
GROUP BY Month
ORDER BY Month;

SELECT CustomerID,
SUM(Quantity * UnitPrice) AS TotalSpent
FROM `online_retail.csv`
WHERE CustomerID <> ''
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

SELECT
AVG(Quantity * UnitPrice) AS Average_Order_Value
FROM `online_retail.csv`;

SELECT Description,
MAX(UnitPrice) AS HighestPrice
FROM `online_retail.csv`
GROUP BY Description
ORDER BY HighestPrice DESC
LIMIT 10;
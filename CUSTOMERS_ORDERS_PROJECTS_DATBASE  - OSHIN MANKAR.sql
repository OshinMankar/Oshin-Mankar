CREATE DATABASE CUSTOMERS_ORDERS_PROJECTS;

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Products;

/*TASK 1*/

SELECT * FROM Customers; -----------------------1

SELECT NAME, Email FROM Customers
WHERE NAME LIKE 'J%'; --------------------------------2

SELECT ORDERID, PRODUCTNAME, QUANTITY FROM Orders; -----------------------------------3

SELECT SUM(QUANTITY) AS TOTAL_QUANTITY
FROM Orders;------------------------------4

SELECT NAME FROM Customers C
JOIN Orders O ON C.CustomerID = O.CUSTOMERID
WHERE OrderID IS NOT NULL; ----------------------------5

SELECT PRODUCTNAME FROM Products
WHERE PRICE > 10; -------------------6

SELECT NAME, ORDERDATE FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE OrderDate >= '2023/07/05'; ----------------------------7

SELECT AVG(PRICE) AS AVG_PRICE FROM Products; -----------------------8

SELECT NAME, QUANTITY FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID; -----------------------------9

SELECT * FROM Products P
LEFT JOIN Orders O ON P.ProductName = O.ProductName
WHERE O.ORDERID IS NULL; ------------------------------10


SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Products;

/*TASK 2*/

SELECT TOP 5 NAME FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY Quantity DESC; -------------------------------1

SELECT ProductName, AVG(PRICE) AS AVG_PRICE FROM Products
GROUP BY ProductName; -------------------------2

SELECT NAME FROM Customers C
JOIN Orders O ON C.CustomerID = O.CUSTOMERID
WHERE OrderID IS NOT NULL; --------------------------3

SELECT ORDERID, PRODUCTNAME, QUANTITY FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE NAME LIKE 'M%'; --------------------------------4

SELECT SUM(O.QUANTITY * P.PRICE) FROM Orders O
JOIN Products P ON O.ProductName = P.ProductName; -------------------------------5

SELECT c.name, SUM(o.quantity * P.price) AS total_revenue
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN PRODUCTS P ON o.ProductName = P.ProductName
GROUP BY c.name; ---------------------------------6

SELECT NAME FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN Products P ON O.ProductName = P.ProductName
GROUP BY NAME
HAVING COUNT(DISTINCT ProductID) = (SELECT COUNT(*)FROM Products); -------------------------------7

SELECT o1.customerid, c.name
FROM orders o1
JOIN orders o2 ON o1.CustomerID = o2.customerid
JOIN customers c ON o1.customerid = c.customerid
WHERE DATEDIFF (o2.orderdate, o1.orderdate, GETDATE()) = 1
GROUP BY o1.customerid, c.name; ------------------------------8

SELECT TOP 3 productid, AVG(quantity) AS avg_quantity_ordered
FROM Products P JOIN Orders O ON P.ProductName = O.ProductName
GROUP BY productid
ORDER BY avg_quantity_ordered DESC; -------------------------------9

SELECT 
    (COUNT(CASE WHEN quantity > avg_quantity THEN 1 END) * 100.0) / COUNT(*) AS percentage_orders_above_avg
FROM 
    Orders,
    (SELECT AVG(quantity) AS avg_quantity FROM Orders) AS avg_table;

	
SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Products;

/*TASK 3*/

SELECT c.customerid
FROM Customers c
JOIN Orders o ON c.customerid = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.customerid
HAVING COUNT(DISTINCT o.ProductName) = (SELECT COUNT(*) FROM Products); ------------------------------------------A

SELECT P.ProductName FROM Products P
JOIN Orders o ON o.ProductName = p.ProductName
JOIN Customers C ON o.CUSTOMERID = C.CustomerID
GROUP BY P.ProductName
HAVING COUNT(DISTINCT C.CustomerID) = (SELECT COUNT(*) FROM Customers); ------------------------------------------B

SELECT FORMAT(O.ORDERDATE, 'yyyy-MM') AS MONTH, SUM(O.QUANTITY * P.PRICE) AS TOTAL_REVENUE FROM Orders O
JOIN Products P ON O.ProductName = P.ProductName
GROUP BY FORMAT(O.ORDERDATE, 'yyyy-MM')
ORDER BY MONTH; --------------------------------C

SELECT ProductName
FROM Orders
GROUP BY ProductName
HAVING 
    COUNT(DISTINCT customerid) > (
        SELECT COUNT(*) FROM Customers
    ) / 2; ---------------------------------------D

SELECT TOP 5 C.CustomerID , SUM(O.QUANTITY * P.PRICE) AS TOTAL FROM CUSTOMERS C
JOIN Orders O ON O.CustomerID = C.CustomerID
JOIN Products P ON P.ProductName = O.ProductName
GROUP BY C.CustomerID
ORDER BY TOTAL DESC; -----------------------------------E

SELECT TOP 3 CUSTOMERID, ORDERID, ORDERDATE FROM Orders
ORDER BY ROW_NUMBER() OVER (PARTITION BY CUSTOMERID ORDER BY ORDERDATE DESC); -----------------------------------F

SELECT C.CustomerID , c.name, SUM(O.QUANTITY * P.PRICE) AS TOTAL FROM CUSTOMERS C
JOIN Orders O ON O.CustomerID = C.CustomerID
JOIN Products P ON P.ProductName = O.ProductName
WHERE o.OrderDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY C.CustomerID, c.Name
order by TOTAL; -----------------------------------------g

SELECT C.CustomerID , c.name, SUM(O.QUANTITY * P.PRICE) AS TOTAL FROM CUSTOMERS C
JOIN Orders O ON O.CustomerID = C.CustomerID
JOIN Products P ON P.ProductName = O.ProductName
group by c.CustomerID, c.Name
having count(distinct p.productid) >= 2; -----------------------------------H

SELECT C.CustomerID , c.name, AVG(O.QUANTITY * P.PRICE) AS AVG_REV FROM CUSTOMERS C
JOIN Orders O ON O.CustomerID = C.CustomerID
JOIN Products P ON P.ProductName = O.ProductName
group by c.CustomerID, c.Name; ------------------------------------I

DECLARE @Year INT = 2023;
;WITH MonthlyOrders AS ( SELECT c.CustomerID, c.Name, MONTH(o.OrderDate) AS OrderMonth
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE 
        YEAR(o.OrderDate) = @Year
    GROUP BY c.CustomerID, c.NamE, MONTH(o.OrderDate)),
CustomerMonthlyOrderCount AS (SELECT CustomerID, Name, COUNT(DISTINCT OrderMonth) AS MonthsWithOrders
    FROM MonthlyOrders
    GROUP BY CustomerID, Name)
SELECT CustomerID, NAME
FROM CustomerMonthlyOrderCount
WHERE MonthsWithOrders = 12; ------------------------------------J

SELECT ProductName
FROM Orders
WHERE ProductName = 'PRODUCT A'
GROUP BY ProductName
HAVING 
    COUNT(DISTINCT customerid) > (
        SELECT COUNT(*) FROM Customers
    ) / 2; -----------------------------------K

SELECT P.ProductName, COUNT(P.PRODUCTID) AS ORDERCOUNT FROM PRODUCTS P
JOIN Orders O ON O. ProductName = P.ProductName
GROUP BY P.ProductName
HAVING COUNT(O.QUANTITY) >= 2; ------------------------------------------L



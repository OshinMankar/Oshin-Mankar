CREATE DATABASE BRAND
CREATE TABLE ITEM_table
(
item_id INT,
item_description VARCHAR(100),
vendor_nos int,
vendor_name varchar(50),
bottle_size int,
bottle_price MONEY,
);

SELECT * FROM ITEM_table

CREATE DATABASE PRODUCTS
CREATE TABLE PRODUCT_TABLE
(
product_id INT,
country VARCHAR(100),
product VARCHAR(100),
Units_sold int,
Manufacturing_price MONEY,
Sale_Price MONEY,
Gross_sales MONEY,
Sales MONEY,
COGS MONEY,
Profit MONEY,
Date Date,
Month_Number INT,
Month_Name CHAR(50),
Year INT,
);

SELECT * FROM PRODUCT_TABLE

INSERT INTO ITEM_table (item_id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
values (1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
       (2, 'Daristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
	   (3, 'Hiram Walker Peach Brandy',	370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
	   (4,	'Oak Cross Whisky',	305,	'Mhw Ltd',	750,	$25.33),
	   (5,	'Uv Red(cherry) Vodka',	380,	'Phillips Beverage Company',	200,	1.97), 
       (6,	'Heaven Hill Old Style White Label',	259,	'Heaven Hill Distilleries Inc.',	750,	6.37),
	   (7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, $5.07),
	   (8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61)
	   ;


INSERT INTO PRODUCT_TABLE (product_id,country ,product ,Units_sold , Manufacturing_price, Sale_Price, Gross_sales, Sales , COGS , Profit , Date, Month_Number, Month_Name, Year)
values (1,	'Canada',	'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00,  16185.00, 16185.00 , '01-01-2014', 1, 'January', 2014),
(2,	'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '01-01-2014', 1, 'January', 	2015),
(3,	'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '01-06-2014',	6, 'June', 2016),
(4,	'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '01-06-2014', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '01-06-2014', 6, 'June', 2018),
(6,	'Germany',	'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '01-12-2014',	12,	'December', 2019),
(7,	'Germany',	 'Montana',	921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '01-03-2014',	3,	'March', 2020),
(8,	'Canada',	'Montana', 	2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '01-06-2014',	6,	'June', 2021);

DELETE FROM PRODUCT_TABLE
WHERE Units_sold IN (1618.5, 888, 2470);

DROP TABLE PRODUCT_TABLE;

CREATE TABLE PRODUCT_TABLE
(
product_id INT primary key,
country VARCHAR(100),
product VARCHAR(100),
Units_sold int,
Manufacturing_price MONEY,
Sale_Price MONEY,
Gross_sales MONEY,
Sales MONEY,
COGS MONEY,
Profit MONEY,
Date Date,
Month_Number INT,
Month_Name CHAR(50),
Year INT,
);

INSERT INTO PRODUCT_TABLE (product_id,country ,product ,Units_sold , Manufacturing_price, Sale_Price, Gross_sales, Sales , COGS , Profit , Date, Month_Number, Month_Name, Year)
values (1,	'Canada',	'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00,  16185.00, 16185.00 , '01-01-2014', 1, 'January', 2014),
(2,	'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '01-01-2014', 1, 'January', 	2015),
(3,	'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '01-06-2014',	6, 'June', 2016),
(4,	'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '01-06-2014', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '01-06-2014', 6, 'June', 2018),
(6,	'Germany',	'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '01-12-2014',	12,	'December', 2019),
(7,	'Germany',	 'Montana',	921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '01-03-2014',	3,	'March', 2020),
(8,	'Canada',	'Montana', 	2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '01-06-2014',	6,	'June', 2021);

/* BIG TABLE */

SELECT * FROM PRODUCT_TABLE

SELECT SUM(UNITS_SOLD * SALE_PRICE) AS TOTALSALEPRICE FROM PRODUCT_TABLE;
SELECT SUM(UNITS_SOLD * GROSS_SALES) AS TOTALGROSSSALE FROM PRODUCT_TABLE; ----------- 1

SELECT TOP(1) Year
FROM PRODUCT_TABLE
GROUP BY Year
ORDER BY SUM(Gross_sales) DESC; ----------- 2

SELECT PRODUCT FROM PRODUCT_TABLE
WHERE SALES = 37050.00; -------------- 3


SELECT country FROM PRODUCT_TABLE
WHERE PROFIT BETWEEN 4605.00 AND 22662; -------------- 4

SELECT product_id FROM PRODUCT_TABLE
WHERE Sales = 24700.00; -------------- 5

/* SMALL TABLE */

SELECT * FROM ITEM_table

SELECT item_description FROM ITEM_table
WHERE bottle_size = 750; -------------- 1

SELECT vendor_name FROM ITEM_table
WHERE vendor_nos IN (305, 380, 391); -------------- 2

SELECT SUM(BOTTLE_PRICE) AS TOTAL_BOTTLE_PRICE FROM ITEM_table; --------------- 3

ALTER TABLE ITEM_table
ALTER COLUMN Item_Id INT NOT NULL

ALTER TABLE ITEM_table
ADD PRIMARY KEY (Item_Id); -------------- 4

SELECT item_id FROM ITEM_table
WHERE bottle_price = 5.07; ---------------- 5

/* ADVANCE QUESTION */

SELECT * FROM ITEM_table
JOIN
PRODUCT_TABLE
ON
ITEM_table.bottle_price=PRODUCT_TABLE.Sale_Price; ------ 1

SELECT * FROM ITEM_table
FULL OUTER JOIN
PRODUCT_TABLE
ON
ITEM_table.bottle_price=PRODUCT_TABLE.Sale_Price; ------- 1

SELECT * FROM ITEM_table
LEFT JOIN
PRODUCT_TABLE
ON
ITEM_table.bottle_price=PRODUCT_TABLE.Sale_Price; ---------- 1

SELECT * FROM ITEM_table
RIGHT JOIN
PRODUCT_TABLE
ON
ITEM_table.bottle_price=PRODUCT_TABLE.Sale_Price; ------- 2

SELECT * FROM ITEM_table
CROSS JOIN
PRODUCT_TABLE; -------- 2

SELECT i.item_description, p.Product
FROM ITEM_table i
JOIN PRODUCT_TABLE p ON i.Item_Id = p.product_id
WHERE p.Gross_Sales = 13320.00; --------------- 3

select item_description
, Charindex(' ', item_description) as [Space_Position]
, len(item_description) as [Name_Length]
, left(item_description,(Charindex(' ', item_description)-1)) as [Item_desc1]
, substring(item_description,(Charindex(' ', item_description)+1), (len(item_description) -Charindex(' ', item_description))) as [Item_desc2]
from ITEM_table -------------- 4
-------------------------------------------------

USE master;
GO
DROP DATABASE BRAND
; 



USE master;
GO
DROP DATABASE PRODUCTS;-----------------------------
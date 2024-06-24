create database Order_Stores_Data; ---------1

create table Orders_Table
( OrderDate Date,
Region varchar (20),
Rep varchar(50),
Order_Item varchar(20),
Units int,
UnitCost money,
Total_Price money,
Order_Id int)
;

create table Stores_Table
(Store_id int,
Storetype char(50),
assortment int,
competition_distance int,
Month int,
year int,
promo_interval varchar(30))
; ---------- 2


insert into Orders_Table values ('1-6-21', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
('1-23-21',	'Central',	'Kivell',	'Eraser',	50,	 19.99, 	 999.50, 	2),
('2-9-21',	'Central',	'Ganesh', ' ',	36,	 4.99, 	 179.64, 	3),
('2-26-21',	'Central',	'Payal', ' ',	27,	 19.99, 	 539.73, 	4),
('3-15-21',	'West',	'Sorvino',	 ' ',	56,	 2.99, 	 167.44, 	5),
('4-1-21',	'East',	'Hitesh',	'Pencil',	60, 4.99,  299.40, 	6),
('4-18-21',	'Central',	'Akshita',	' ', 75,	1.99, 	 149.25, 	7),
('5-5-21',	'Central',	'Ruchika',	'Books',	90,	 4.99, 	 449.10, 	8),
('5-22-21',	'West',	'Surbhi', ' ', 32,	1.99, 	63.68, 	9),
('6-8-21',	'East',	'Jones', 'Suitcase',	60,	 8.99, 	 539.40, 	10)
;

insert into Stores_Table values (1,	'c',	37,	1270,	9,	2008,	'Jan'),
(2,	'a',	20,	570,	11,	2007,	'Feb'),
(3,	'a',	12,	14130,	12,	2006,	'Mar'),
(4,	'c',	13,	620,	9,	2009, '	'),
(5,	'a',	32,	29910,	4,	2015,	'May'),
(6,	'a',	43,	310,	12,	2013,	'June'),
(7,	'a',	14,	24000,	4,	2013,	' '),
(8,	'a',	27,	7520,	10,	2014,	'Aug'),
(9,	'a',	23,	2030,	8,	2000, ' '),	
(10,	'a',	36,	3160,	9,	2009,	'Oct')
; -------------------------------------- 3


select * from Orders_Table;
select * from Stores_Table;


ALTER TABLE Orders_Table
ALTER COLUMN Order_Id INT NOT NULL

ALTER TABLE Orders_Table
ADD PRIMARY KEY (Order_Id); -------------------------------- 4

ALTER TABLE Stores_Table
ADD Store_names varchar(50); 

UPDATE Stores_Table
SET Store_names = 'Car';

UPDATE Stores_Table
SET Store_names = 'Scraps'
where Store_id = 10; ------------------------------------- 5

select * from Orders_Table;
UPDATE Orders_Table
SET Order_Item = 'Box'
where Rep = 'Surbhi'; ------------------------------------------- 6

select * from Stores_Table;
UPDATE Stores_Table
SET promo_interval = 'Sept'
where Store_id = 9;---------------------------------------------- 7

select * from Stores_Table;
EXEC sp_rename 'Stores_table.Promo_Interval', 'Store_Nos', 'COLUMN'; ------------------------- 8

select * from Orders_Table;
EXEC sp_rename 'Orders_Table.Order_item', 'Item_name', 'COLUMN';
EXEC sp_rename 'Orders_Table.Rep', 'Customers_name', 'COLUMN'; ----------------------------------- 9

select * from Orders_Table
order by UnitCost desc;
select * from Orders_Table
order by Total_Price;  -------------------------------------------------------- 10

EXEC sp_rename 'Orders_Table.Customers_name', 'Cus_name', 'COLUMN';
select Region, COUNT(DISTINCT Cus_Name) AS Num_Customers
from Orders_Table
Group by Region; ------------------------------------ 11

SELECT SUM(Total_Price) FROM Orders_Table;
SELECT SUM(UnitCost) FROM Orders_Table; ------------------ 12

CREATE VIEW Order_Stores_Table AS
SELECT Orders_Table.OrderDate, Orders_Table.UnitCost, Stores_Table.Storetype, Stores_Table.year
FROM Orders_Table
JOIN Stores_Table ON Orders_Table.Order_Id = Stores_Table.Store_id;

select * from Order_Stores_Table; --------------------------------------------------- 1


select * from Orders_Table;
select * from Stores_Table;

select item_name, region from orders_table
where order_id in (4,5,6,9)
; --------------------------------------- 14

select year from Stores_Table
where competition_distance in (29910  , 310 , 3160); --------------------------------------- 15


select item_name from Orders_Table
where Total_Price between 200 and 400; --------------------------------------- 16

EXEC sp_rename 'stores_table.competition_distance', 'CD', 'COLUMN';
SELECT SUM(CD) FROM Stores_Table; --------------------------------- 17


SELECT count(CD) FROM Stores_Table;
SELECT count(Storetype) FROM Stores_Table; -------------------------------------- 18

select * from Orders_Table
cross join
Stores_Table -------------------------------------------------- 19

USE master;
GO
DROP DATABASE Order_Stores_Data; --------------------------------------------- 20
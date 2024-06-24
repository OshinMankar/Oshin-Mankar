create database employees;

create table employeedetails
(EmpId int,
Fullname varchar(50),
Manager_Id int,
Date_of_joining date,
City varchar(50))
;

select * from employeedetails;

insert into employeedetails values
(121, 'John Snow', 321, '01-31-2019', 'Toronto'),
(321, 'Walter White', 986, '01-30-2020', 'California'),
(421, 'Kuldeep Rana', 876, '11-27-2021', 'New Delhi');

create table employeesalary
(EmpId int,
Project varchar(50),
Salary int,
Variable int)
;


select * from employeesalary;

insert into employeesalary values
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0);

SELECT A.*
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.EmpId IS NULL; --------------------------------- 1

select * from employeesalary;

select * from employeedetails;

/* Assignment 1*/


SELECT A.*
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.Project IS NULL;  --------------------------------------- 2

SELECT * FROM employeedetails
WHERE YEAR(Date_of_joining) = 2020; ------------------------------------3

SELECT A.*
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.Salary IS NOT NULL; ----------------------------- 4

SELECT PROJECT, COUNT(EMPiD) AS EMPLOYEE_COUNT
FROM employeesalary
GROUP BY Project; ------------------------------------------------- 5

SELECT A.Fullname, B.Salary
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId; ------------------------------- 6

SELECT FULLNAME FROM employeedetails
WHERE Manager_Id IS NOT NULL; -------------------------------- 7


SELECT *
FROM employeedetails
GROUP BY EmpId, Fullname, Manager_Id, Date_of_joining, City
HAVING COUNT(*)>1; ------------------------------------------ 8

WITH OddRows AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum
    FROM employeedetails
)
SELECT EmpId, Fullname, Manager_Id, Date_of_joining, City
FROM OddRows
WHERE RowNum % 2 <> 0; ------------------------------------------------9

select * from employeesalary;

select * from employeedetails;

SELECT salary
FROM employeesalary
ORDER BY salary DESC
OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY; --------------------------------- 10

/* assignment 2*/

SELECT EMPID, FULLNAME FROM employeedetails
WHERE Manager_Id IN (986); ---------------------------- 1


SELECT PROJECT FROM employeesalary; -------------------------- 2


SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM employeesalary
JOIN employeedetails
ON employeesalary.EmpId = employeedetails.EmpId
WHERE Project = 'P1'; ------------------------------- 3


SELECT MAX(SALARY) AS max_SALARY
FROM employeesalary;

SELECT MIN(SALARY) AS MIN_SALARY
FROM employeesalary;

SELECT AVG(SALARY) AS AVG_SALARY
FROM employeesalary; --------------------------------- 4

SELECT EmpId 
FROM employeesalary WHERE Salary BETWEEN 9000 AND 15000; ------------------------------ 5

SELECT FULLNAME
FROM employeedetails
WHERE CITY IN ('TORONTO') AND Manager_Id IN (321); ------------------------------------- 6


SELECT FULLNAME
FROM employeedetails
WHERE CITY IN ('CALIFORNIA') OR Manager_Id IN (321); ----------------------------------- 7


SELECT *
FROM employeedetails
JOIN employeesalary
ON employeesalary.EmpId = employeedetails.EmpId
WHERE Project <>'P1'; ---------------------------------------- 8

SELECT *,SALARY + VARIABLE
AS TOTAL_SALARY
FROM EMPLOYEESALARY; ----------------------------- 9


SELECT Fullname
FROM employeedetails
WHERE Fullname LIKE '__HN%' ; ------------------------------10

/* ASIGNMENT 3 */


SELECT EmpId
FROM employeedetails 
UNION
SELECT EmpId
FROM employeesalary; ------------------------------------- 1


SELECT EmpId
FROM employeedetails 
INTERSECT
SELECT EmpId
FROM employeesalary; --------------------2


SELECT EmpId
FROM employeedetails 
EXCEPT
SELECT EmpId
FROM employeesalary; ------------3


SELECT EmpId
FROM employeedetails 
UNION ALL
SELECT EmpId
FROM employeesalary; -------------------4

SELECT employeedetails.EmpId
from employeedetails
left join employeesalary on employeedetails.EmpId = employeesalary.EmpId
where employeesalary.EmpId is null; --------------------------------------- 5

SELECT REPLACE(FullName, ' ', '-') AS FullNameWithHyphen
FROM EmployeeDetails; ----------------6

SELECT FULLNAME,
CHARINDEX ('H', FULLNAME) AS [CHAR_POSITION]
FROM employeedetails; ------------------------------ 7

SELECT EmpId, Manager_Id
FROM employeedetails; --------------------------------- 8

SELECT SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM EmployeeDetails; ---------------------------------- 9

SELECT 
    UPPER(Fullname) AS UppercaseName,
    LOWER(City) AS LowercaseCity
FROM 
    EmployeeDetails; -------------------- 10

	/* ASSIGNMENT 4*/

	
select * from employeesalary;

select * from employeedetails;


SELECT 
    (LEN(FullName) - LEN(REPLACE(FullName, 'n', ''))) AS OccurrencesOfN
FROM 
    EmployeeDetails; ----------------------- 1

UPDATE employeedetails
SET FullName = LTRIM(RTRIM(FullName)); ----------------2

SELECT A.*
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.Project IS NULL; ------------------------------------3

SELECT A.Fullname
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.Salary between 5000 and 10000; ----------------------------- 4

SELECT GETDATE() AS CurrentDateTime; ----------------------------------------5

SELECT * FROM employeedetails
WHERE YEAR(DATE_OF_JOINING) = 2020; ------------------------------------------- 6


SELECT A.*
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
WHERE B.Salary IS NOT NULL; ----------------------------------- 7

SELECT COUNT(*) AS PROJECT_COUNT
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId
GROUP BY Project
ORDER BY PROJECT_COUNT; ----------------------------------- 8

SELECT A.Fullname, B.Salary
FROM employeedetails A
LEFT JOIN employeesalary B ON A.EmpId = B.EmpId; -------------------------------------------9

SELECT 
    A.COL1,
    A.COL2,
    B.COL1,
    C.COL1
FROM 
    TABLE1 A
JOIN 
    TABLE2 B ON A.COL1 = B.COL1
JOIN 
    TABLE3 C ON A.COL2 = C.COL1; ------------------------------------------ 10  

/*ADVANCED ASSIGNMENT*/

CREATE TABLE EMPLOYEE_INFO_TABLE 
(EMPID INT,
EMP_F_NAME VARCHAR (50),
EMP_L_NAME VARCHAR (50),
DEPARTMENT VARCHAR(50),
PROJECT VARCHAR(10),
ADDRESS VARCHAR(50),
DOB DATE,
GENDER CHAR(10)
);

INSERT INTO EMPLOYEE_INFO_TABLE VALUES(1, 'SANJAY', 'MEHRA', 'HR', 'P1','HYDERABAD(HYD)', '12/01/1976', 'M'),
(2, 'ANANYA', 'MISHRA', 'ADMIN', 'P2', 'DELHI(DEL)', '05/02/1968', 'F'),
(3, 'ROHAN', 'DIWAN', 'ACCOUNT', 'P33', 'MUMBAI(BOM)', '01/01/1980', 'M'),
(4, 'SONIA', 'KULKARNI', 'HR', 'P1','HYDERABAD(HYD)', '05/02/1992', 'F'),
(5, 'ANKIT', 'KAPOOR', 'ADMIN', 'P2', 'DELHI(DEL)', '07/03/1994', 'M')
;

CREATE TABLE EMPLOYEE_POSITION_TABLE
(EMPID INT,
EMP_POSITION VARCHAR(50),
DATE_OF_JOINING DATE,
SALARY INT)
;

INSERT INTO EMPLOYEE_POSITION_TABLE VALUES(1, 'MANAGER', '05/01/2022', 500000),
(2, 'EXECUTIVE', '05/02/2022', 75000),
(3, 'MANAGER', '05/01/2022', 90000),
(2, 'LEAD', '05/02/2022', 85000),
(1, 'EXECUTIVE', '05/01/2022', 300000)
;

SELECT * FROM EMPLOYEE_INFO_TABLE;
SELECT * FROM EMPLOYEE_POSITION_TABLE;


UPDATE EMPLOYEE_INFO_TABLE
SET PROJECT = 'P3'
WHERE EMPID = '3';

SELECT UPPER(EMP_F_NAME) AS EMPNAME
FROM EMPLOYEE_INFO_TABLE; ----------------------------------------- 1

SELECT COUNT(DEPARTMENT) AS DEPARTMENT_COUNT
FROM EMPLOYEE_INFO_TABLE
WHERE DEPARTMENT = 'HR'; ---------------------------------------------------- 2

SELECT GETDATE() AS CurrentDateTime; -----------------------------3

SELECT 
    LEFT(EMP_L_NAME, 4) AS FirstFourCharacters
FROM 
    EMPLOYEE_INFO_TABLE; ----------------------------------- 4

SELECT SUBSTRING(ADDRESS, 1, CHARINDEX('(', ADDRESS)-1)
AS CITY
FROM EMPLOYEE_INFO_TABLE; ------------------------- 5

SELECT *
INTO NW_EMPLOYEE_INFO_TABLE
FROM EMPLOYEE_INFO_TABLE; ---------------------------------- 6

SELECT B.*
FROM EMPLOYEE_POSITION_TABLE A
JOIN EMPLOYEE_INFO_TABLE B ON A.EMPID = B.EMPID
WHERE SALARY BETWEEN 50000 AND 100000; ------------------------------- 7

SELECT EMP_F_NAME FROM EMPLOYEE_INFO_TABLE
WHERE EMP_F_NAME LIKE 'S%'; -----------------------------------8

SELECT TOP 4 * FROM EMPLOYEE_INFO_TABLE; ----------------------------------------9

SELECT CONCAT(Emp_F_name, ' ', Emp_L_name) AS FullName
FROM EMPLOYEE_INFO_TABLE; ----------------------------------------10

SELECT GENDER, COUNT(*) AS COUNT_OF_EMPLOYEES FROM EMPLOYEE_INFO_TABLE
WHERE DOB BETWEEN '1970/05/02' AND '1975/12/31'
GROUP BY GENDER; ------------------------------- 11

SELECT * FROM EMPLOYEE_INFO_TABLE
ORDER BY EMP_L_NAME DESC, DEPARTMENT ASC; ----------------------------12

SELECT EMP_F_NAME FROM EMPLOYEE_INFO_TABLE
WHERE EMP_F_NAME LIKE '____A'; ----------------------- 13

SELECT * FROM EMPLOYEE_INFO_TABLE
WHERE EMP_F_NAME NOT IN ('SANJAY' , 'SONIA'); ----------------------------- 14

SELECT * FROM EMPLOYEE_INFO_TABLE
WHERE ADDRESS IN ('DELHI(DEL)'); ------------------------------ 15

SELECT A.* FROM 
EMPLOYEE_POSITION_TABLE A 
JOIN EMPLOYEE_INFO_TABLE B ON A.EMPID = B.EMPID
WHERE EMP_POSITION IN ('MANAGER'); -------------------------------- 16

SELECT DEPARTMENT, COUNT(*) AS DEPARTMENT_WISE_COUNT FROM EMPLOYEE_INFO_TABLE
GROUP BY DEPARTMENT; ---------------------------------------------------- 17

WITH NumberedRows AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EMPID) AS RowNum
    FROM EMPLOYEE_INFO_TABLE
)
SELECT * FROM NumberedRows
WHERE RowNum % 2 = 0; ------------------------- EVEN ROWS

WITH NumberedRows AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EMPID) AS RowNum
    FROM EMPLOYEE_INFO_TABLE
)
SELECT * FROM NumberedRows
WHERE RowNum % 2 = 1; -------------------------- ODD ROWS -------- 18

SELECT A.*, B.* FROM EMPLOYEE_INFO_TABLE A
JOIN EMPLOYEE_POSITION_TABLE B ON A.EMPID = B.EMPID
WHERE DATE_OF_JOINING IS NOT NULL; ---------------------------------- 19

SELECT TOP 2 MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY FROM EMPLOYEE_POSITION_TABLE
GROUP BY EMPID; ------------------------------- 20

SELECT SALARY FROM EMPLOYEE_POSITION_TABLE
ORDER BY SALARY DESC
OFFSET N-1 ROWS FETCH NEXT 1 ROW ONLY; ----------------------------------------21

SELECT * FROM EMPLOYEE_POSITION_TABLE
GROUP BY EMPID, EMP_POSITION, DATE_OF_JOINING, SALARY
HAVING COUNT(*)>1; -------------------------------- 22

SELECT * FROM EMPLOYEE_INFO_TABLE
WHERE DEPARTMENT IN ('HR'); -----------------------------------23

SELECT TOP 3 *
FROM EMPLOYEE_INFO_TABLE
ORDER BY EmpID DESC; ------------------------------------- 24

SELECT SALARY FROM EMPLOYEE_POSITION_TABLE
ORDER BY SALARY DESC
OFFSET 3-1 ROWS FETCH NEXT 1 ROW ONLY; ------------------------------------25

SELECT * FROM(
SELECT TOP 1 *
FROM EMPLOYEE_INFO_TABLE
ORDER BY EMPID ASC) AS FIRST_RECORD
UNION ALL
SELECT * FROM
(SELECT TOP 1 *
FROM EMPLOYEE_INFO_TABLE
ORDER BY EMPID DESC) AS LAST_RECORD; ------------------------------------- 26 (UNION DOESN'T SUPPORT WITH ORDER BYB DIRECTLY)

ALTER TABLE EMPLOYEE_POSITION_TABLE ADD EMAIL VARCHAR(50) CONSTRAINT CK_ValidEmail CHECK (
    Email LIKE '%@%' AND
    Email LIKE '%.%' AND
    Email NOT LIKE '%@%.%' AND
    Email NOT LIKE '%..%'
); ----------------------------- 27

SELECT DEPARTMENT, COUNT(*) AS DEPARTMENT_WISE_COUNT
FROM EMPLOYEE_INFO_TABLE
GROUP BY DEPARTMENT 
HAVING COUNT(*)<2; ------------------------------------------------ 28

SELECT EMP_POSITION, SALARY
FROM EMPLOYEE_POSITION_TABLE; ------------------------------------------29

SELECT *
FROM EMPLOYEE_INFO_TABLE
TABLESAMPLE (50 PERCENT); --------------------------------------------30























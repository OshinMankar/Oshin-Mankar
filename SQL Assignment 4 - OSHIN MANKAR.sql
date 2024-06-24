CREATE DATABASE STUDENT;

CREATE TABLE STUDENTS(
STUDENTID INT PRIMARY KEY,
NAME VARCHAR(50),
SURNAME VARCHAR(50),
BIRTHDATE DATE,
GENDER VARCHAR(50),
CLASS INT,
POINT INT);

INSERT INTO STUDENTS (STUDENTID, NAME, SURNAME, BIRTHDATE, GENDER, CLASS, POINT) VALUES
(1, 'John', 'Doe', '2003-04-15', 'M', '10Math', 85),
(2, 'Jane', 'Smith', '2004-03-22', 'F', '10Sci', 92),
(3, 'Alice', 'Johnson', '2005-06-10', 'F', '9Math', 88),
(4, 'Robert', 'Brown', '2003-11-05', 'M', '10Bio', 75),
(5, 'Emma', 'Davis', '2004-01-18', 'F', '10Math', 89),
(6, 'Sophia', 'Miller', '2005-12-30', 'F', '9His', 90),
(7, 'William', 'Wilson', '2003-07-09', 'M', '9Math', 82),
(8, 'Olivia', 'Moore', '2004-02-11', 'F', '10Sci', 95),
(9, 'James', 'Taylor', '2005-09-23', 'M', '10Math', 78),
(10, 'Ava', 'Anderson', '2003-05-04', 'F', '10Bio', 85),
(11, 'Michael', 'Thomas', '2004-08-19', 'M', '9Math', 81),
(12, 'Isabella', 'Jackson', '2005-03-01', 'F', '10Sci', 87),
(13, 'Mason', 'White', '2003-10-21', 'M', '10Math', 76),
(14, 'Mia', 'Harris', '2004-12-25', 'F', '9His', 92),
(15, 'Alexander', 'Martin', '2005-11-15', 'M', '10Bio', 80),
(16, 'Charlotte', 'Thompson', '2003-06-30', 'F', '10Sci', 93),
(17, 'Benjamin', 'Garcia', '2004-04-27', 'M', '9Math', 83),
(18, 'Amelia', 'Martinez', '2005-07-14', 'F', '10Math', 91),
(19, 'Elijah', 'Robinson', '2003-09-06', 'M', '10Bio', 77),
(20, 'Lucas', 'Clark', '2004-10-31', 'M', '9His', 84);

SELECT * FROM STUDENTS; ----------------------------------1

SELECT NAME, SURNAME, CLASS FROM STUDENTS; ----------------------------------------2

SELECT * FROM STUDENTS WHERE GENDER = 'F'; -------------------------------------3

SELECT DISTINCT CLASS FROM STUDENTS; -------------------------------------------4

SELECT * FROM STUDENTS WHERE GENDER = 'F' AND CLASS = '10Math';---------------------------------------5

SELECT NAME, SURNAME, CLASS FROM STUDENTS WHERE CLASS IN ('10Math', '10Sci'); --------------------------------6 

SELECT NAME, SURNAME, STUDENTID AS SchoolNumber FROM STUDENTS; ---------------------------------------7

SELECT CONCAT(NAME, ' ', SURNAME) AS FullName FROM STUDENTS; -------------------------------8

SELECT * FROM STUDENTS WHERE NAME LIKE 'A%'; ---------------------------------9

SELECT BookName, PageCount FROM BOOK WHERE PageCount BETWEEN 50 AND 200; -------------------------------------10

SELECT * FROM STUDENTS WHERE NAME IN ('Emma', 'Sophia', 'Robert'); ------------------------------11

SELECT * FROM STUDENTS WHERE NAME LIKE 'A%' OR NAME LIKE 'D%' OR NAME LIKE 'K%'; --------------------------------12

SELECT NAME, SURNAME, CLASS, GENDER 
FROM STUDENTS 
WHERE (GENDER = 'M' AND CLASS = '9Math') OR (GENDER = 'F' AND CLASS = '9His'); -----------------------13

SELECT * FROM STUDENTS WHERE GENDER = 'M' AND CLASS IN ('10Math', '10Bio'); -----------------------------------14

SELECT * FROM STUDENTS WHERE YEAR(BIRTHDATE) = 2003; ---------------------------15













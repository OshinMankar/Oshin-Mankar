create database SPPU;

create table College_Table(
		College_ID int primary key,
		College_Name varchar(50),
		College_Area varchar (50));

CREATE TABLE Department_Table(
		Dept_ID INT PRIMARY KEY,
		Dept_Name VARCHAR (50),
		Dept_Facility VARCHAR (50));

CREATE TABLE Professor_Table(
		Professor_ID INT PRIMARY KEY,
		Professor_Name VARCHAR(50),
		Professor_Subject VARCHAR(50));

CREATE TABLE Student_Table(
		Student_ID INT PRIMARY KEY,
		Student_Name VARCHAR(50),
		Student_Stream VARCHAR(50));

SELECT*FROM College_Table;
SELECT*FROM Department_Table;
SELECT*FROM Professor_Table;
SELECT*FROM Student_Table;

ALTER TABLE Department_Table
ADD CONSTRAINT id
FOREIGN KEY (Dept_ID)
REFERENCES College_Table (College_ID);

ALTER TABLE Student_Table
ADD CONSTRAINT id2
FOREIGN KEY (Student_ID)
REFERENCES Professor_Table (Professor_ID);

INSERT INTO College_Table (College_ID, College_Name, College_Area) VALUES
(1, 'Fergusson College', 'Deccan Gymkhana'),
(2, 'SP College', 'Tilak Road'),
(3, 'MIT College', 'Kothrud'),
(4, 'BMCC', 'Shivaji Nagar'),
(5, 'Modern College', 'Shivaji Nagar'),
(6, 'Garware College', 'Karve Road'),
(7, 'COEP', 'Shivaji Nagar'),
(8, 'VIT', 'Bibwewadi'),
(9, 'D.Y. Patil College', 'Akurdi'),
(10, 'Sinhgad College', 'Vadgaon Budruk');


INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility) VALUES
(1, 'Computer Science', 'Laboratories, Library'),
(2, 'Mechanical Engineering', 'Workshops, Labs'),
(3, 'Electrical Engineering', 'Labs, Research Center'),
(4, 'Civil Engineering', 'Field Work, Labs'),
(5, 'Electronics', 'Labs, Innovation Center'),
(6, 'Physics', 'Labs, Research Labs'),
(7, 'Chemistry', 'Labs, Research Labs'),
(8, 'Mathematics', 'Library, Labs'),
(9, 'Biology', 'Labs, Research Center'),
(10, 'Commerce', 'Library, Seminar Hall');

INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject) VALUES
(1, 'Dr. Rajesh Sharma', 'Computer Science'),
(2, 'Dr. Suresh Patil', 'Mechanical Engineering'),
(3, 'Dr. Anjali Desai', 'Electrical Engineering'),
(4, 'Dr. Meera Joshi', 'Civil Engineering'),
(5, 'Dr. Ravi Kumar', 'Electronics'),
(6, 'Dr. Pooja Jain', 'Physics'),
(7, 'Dr. Anil Mehta', 'Chemistry'),
(8, 'Dr. Sunita Rao', 'Mathematics'),
(9, 'Dr. Rakesh Gupta', 'Biology'),
(10, 'Dr. Vinod Kulkarni', 'Commerce');

INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream) VALUES
(1, 'Amit Patil', 'Computer Science'),
(2, 'Sneha Kulkarni', 'Mechanical Engineering'),
(3, 'Rahul Joshi', 'Electrical Engineering'),
(4, 'Priya Deshmukh', 'Civil Engineering'),
(5, 'Vishal Shinde', 'Electronics'),
(6, 'Pooja Pawar', 'Physics'),
(7, 'Rohit Gawande', 'Chemistry'),
(8, 'Neha More', 'Mathematics'),
(9, 'Kiran Sawant', 'Biology'),
(10, 'Rajesh Jadhav', 'Commerce');


SELECT*FROM College_Table;
SELECT*FROM Department_Table;
SELECT*FROM Professor_Table;
SELECT*FROM Student_Table;

/*TASK 2*/

SELECT COLLEGE_ID, COLLEGE_NAME FROM College_Table; -------------------------------------------1

SELECT TOP 5 * FROM Student_Table; --------------------------------------2

SELECT PROFESSOR_NAME FROM Professor_Table
WHERE Professor_ID IN (5); -------------------------------------------3

SELECT UPPER(PROFESSOR_NAME) AS UPPERCASE_NAME
FROM Professor_Table; --------------------------------------4

SELECT STUDENT_NAME FROM Student_Table
WHERE Student_Name LIKE 'A%';---------------------------------------5

SELECT COLLEGE_NAME FROM College_Table
WHERE College_Name LIKE '%A';-------------------------------6

ALTER TABLE PROFESSOR_TABLE
ADD SALARY INT; -------------------------------------7

UPDATE Professor_Table
SET SALARY = 2700000
WHERE Professor_ID = 10;

ALTER TABLE STUDENT_TABLE
ADD CONTACT INT; ----------------------------------- 8

SELECT SUM(SALARY) AS TOTAL_SALARY FROM Professor_Table; -----------------------------------------------9

ALTER TABLE STUDENT_TABLE
ALTER COLUMN STUDENT_NAME VARCHAR(20); ----------------------------------- 10

/*TASK 3*/

SELECT TOP 5 * FROM Student_Table, Professor_Table; ----------------------------------1

SELECT * 
FROM College_Table A
INNER JOIN
Department_Table B ON A.College_ID = B.Dept_ID
INNER JOIN
Professor_Table C ON B.Dept_ID = C.Professor_ID
INNER JOIN
Student_Table D ON C.Professor_ID = D.Student_ID; ------------------------------------------2

SELECT
    d.Dept_ID,
    d.Dept_Name,
    p.professor_id,
    p.professor_name
FROM
    Department_Table d
FULL OUTER JOIN
    Professor_Table p ON d.Dept_ID = p.Professor_ID
WHERE
    p.professor_id IS NULL; ------------------------3

CREATE VIEW COLLEGE_NM
AS 
SELECT * FROM COLLEGE_TABLE
WHERE COLLEGE_NAME LIKE 'C%'
;

SELECT*FROM COLLEGE_NM; -------------------------------------4        

CREATE PROCEDURE SPGETPROFESSOR_TABLE @CUSTOMER_ID INT
AS
BEGIN
SELECT PROFESSOR_ID FROM Professor_Table
WHERE Professor_ID = @CUSTOMER_ID
END; --------------------------5

EXEC SP_RENAME 'College_Table', 'COLLEGE_TABLES_DATA'; ----------------------------6
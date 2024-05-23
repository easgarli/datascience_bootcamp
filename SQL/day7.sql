CREATE TABLE workers2
(
id CHAR (9),
name VARCHAR (50),
state VARCHAR (50), 
salary SMALLINT, 
company VARCHAR (20),
number_of_employees numeric(6)
);
INSERT INTO workers2 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM',15000); 
INSERT INTO workers2 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE',34900); 
INSERT INTO workers2 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM',903400); 
INSERT INTO workers2 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE',259000); 
INSERT INTO workers2 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT',90100); 
INSERT INTO workers2 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE',56900); 
INSERT INTO workers2 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM',45690);
SELECT * FROM workers2;

--1)Used to combine the result of 2 queries
--2) UNION Operator returns unique records every time, removes duplicate records if there are any 
--3) By using "UNION Operator" we can place different fields in a single field as in the example below.

--INTERSECT Operator 
SELECT * FROM workers2
--It returns the common data of two query results, without repetation

--Find all common employee names whose salary is greater than 1000 and less than 2000 
--1.way  --AND
SELECT name,salary FROM workers2 WHERE Salary>1000 AND Salary <2000 

--2.way --BETWEEN
SELECT name,salary FROM workers2 WHERE Salary BETWEEN 1000 AND 2000 

--3.way --INTERSECT
SELECT name,salary FROM workers2 WHERE Salary >1000 
INTERSECT
SELECT name,salary FROM workers2 WHERE Salary <2000

--exmpl
--Find all common employee names whose salary is greater than
-- 2000 and company name is IBM, APPLE or GOOGLE 
SELECT name, company from workers2 where salary > 2000 
INTERSECT
SELECT name, company from workers2 where company in ('IBM','APPLE', 'GOOGLE')


-- EXCEPT Operator
-- It is used to extract one query result from another one
-- It returns unique records

--example
-- find the employee names whose salary is less than 3000 and not working in GOOGLE

SELECT name, salary, company from workers2 WHERE salary > 3000
	EXCEPT
SELECT name, salary, company from workers2 WHERE company = 'GOOGLE'
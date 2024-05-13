CREATE TABLE Employees3 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES 
(1, 'Sales', 'New York'),
(2, 'HR', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'IT', 'San Francisco'),
(5, 'Marketing', 'New York');
INSERT INTO Employees3 (EmployeeID, Name, DepartmentID, Position, Salary)
VALUES 
(101, 'John Smith', 1, 'Sales Manager', 75000),
(102, 'Jane Doe', 1, 'Sales Representative', 60000),
(103, 'Michael Johnson', 2, 'HR Manager', 70000),
(104, 'Emily Brown', 2, 'HR Assistant', 45000),
(105, 'Robert Lee', 3, 'Financial Analyst', 65000),
(106, 'Emma Garcia', 3, 'Financial Analyst', 65000),
(107, 'William Martinez', 4, 'IT Manager', 80000),
(108, 'Olivia Clark', 4, 'Software Engineer', 70000),
(109, 'James Taylor', 4, 'Database Administrator', 75000),
(110, 'Sophia Hernandez', 5, 'Marketing Manager', 72000),
(111, 'Daniel Scott', 5, 'Marketing Specialist', 58000),
(112, 'Isabella Young', 5, 'Marketing Specialist', 58000);
SELECT * FROM departments;
SELECT * FROM employees3;


SELECT name, position FROM employees3;


UPDATE employees3
SET salary=65000 WHERE employeeid=101;

DELETE FROM employees3 WHERE employeeid = 101;

SELECT name, salary FROM employees3 WHERE salary > (select AVG(salary) from employees3);

SELECT SUM(salary) from employees3 
	where departmentid in 
	(SELECT departmentid from departments 
	where departmentname='Sales');


-- Retrieve the names of employees who work in the department 
--located in 'New York'.

SELECT Name ,(SELECT Location FROM Departments 
	WHERE Location='New York' 
	AND Employees3.DepartmentId=Departments.DepartmentId) 
	FROM Employees3 WHERE DepartmentId IN 
	(SELECT DepartmentId FROM Departments WHERE Location='New York');

SELECT departmentname, location, 
	(SELECT ROUND(MAX(salary),0) FROM employees3
	WHERE employees3.departmentid = departments.departmentid) 
from departments;

CREATE VIEW EmployeeInfo AS
Select name, position, salary
from employees3;


SELECT * from EmployeeInfo;

SELECT name, position from employees3 WHERE position = 
	(SELECT position from employees3 where name='Emma Garcia');


Select departmentname from departments 
	where (select sum(salary) from employees3 
	where employees3.departmentid = departments.departmentid)>200000;

UPDATE employees3 SET
salary = 1.1*salary WHERE departmentid in
(SELECT departmentid from departments
	where departmentname= 'IT');
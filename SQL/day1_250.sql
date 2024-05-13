-- This is how we comment out in sql.


-- DDl -Data Definition LANGUAGE
-- You can use a  new DB using the following code:
CREATE database b250Practice;

-- You can delete the DB using the following code

-- how to create a TABLE
-- create a table named as students
-- define the fields
-- put comma between the field names
-- specify the date types

CREATE TABLE students(
	student_no char(7),
	student_name varchar(25),
	student_surname varchar(25),
	note_avg real,
	registration_date date
);

SELECT * FROM students;
--- postgresql date format is yyyy-mm-dd

INSERT INTO students VALUES('1245789', 'Chris', 'Brown', 90.50, '2023-04-20');
INSERT INTO students VALUES('1234567', 'Leon', 'Black', 44.90, '2010-10-05');
INSERT INTO students VALUES('1245789', 'Chris', 'Brown', 90.50, '2023-04-20');
INSERT INTO students VALUES('1234567', 'Leon', 'Black', 44.90, '2010-10-05');

INSERT INTO students VALUES('1234567', 'Leon2', 44.90, 900);
-- data places get mixed with below code
-- insert data partially
INSERT INTO students(student_name,student_surname) VALUES ('Jane','Blue');

-- now() provides the current date
INSERT INTO students VALUES ('3758368','Brad2','Pitt', 89.78, now());
-- ERROR 
INSERT INTO students VALUES ('375836899999999','Brad','Pitt', 89.78, now());

INSERT INTO students VALUES ('3759','Brad3','Pitt', 89.78, now());







---- two ways to create a TABLE
-- first froom scratch
-- second, get the specified fileds from another table using COPY
-- and the you can create a table 
CREATE TABLE studnet_marks
AS
SELECT student_name, student_surname, note_avg FROM students;

SELECT * From studnet_marks;


-- CONSTRAINTS
-- UNIQUE

-- create a customers TABLE

CREATE TABLE customers(
	customer_no char(5) UNIQUE,
	first_name varchar(25) NOT NULL,
	last_name varchar(25)  NOT Null,
	salary real,
	hiring_date date
	
);

SELECT * from customers;

INSERT INTO customers VALUES('12345','elnur','asg',120000,'2020-12-12');

insert into customers values ('65315','f','k',9000.50,'2021-04-20');
insert into customers values ('24789','m','k',44887.90,'2010-10-05');
insert into customers values ('45876','C','b',97880.50,'2021-04-20');
insert into customers values ('15757','L','a',45474.90,'2010-10-05');

INSERT INTO customers VALUES('1234','Enes','Tekin',40000, '2023-04-20');

-- ERROR! not possible. since we used not null contstrain for first and last NAMES
-- they cannot be left empty


INSERT INTO customers (customer_no, salary, hiring_date)
	VALUES('12374',40000, '2023-04-20');

-- it is not possible to insert the same customer no. because of unqiue contraint

INSERT INTO customers VALUES('8934','Enes1','Tekin',40000, '2023-04-20');

INSERT INTO customers (first_name, last_name) VALUES ('Jane','Blue');

-- PRIMARY KEY
-- does not accept null values and duplicate values

-- first way to assign PK
CREATE TABLE students2(
	student_no char(5) PRIMARY KEY,
	name varchar(20),
	lastname varchar(30),
	not_avg real,
	dob date
);

SELECT * FROM students2;

--second way to create PK
CREATE TABLE students3(
	student_no char(5),
	name varchar(20),
	lastname varchar(30),
	not_avg real,
	dob date,
	CONSTRAINT stdx PRIMARY KEY (student_no)
);

SELECT * FROM students3;

INSERT INTO students3 VALUES('12345','Jane','Blue',90.90,'1800-10-10');

--ERROR! PK should be UNIQUE
INSERT INTO students3 VALUES('12345','Jessica','Poland',10.34,'1890-10-10');

--ERROR! PK cannot be NULL
INSERT INTO students3 (name, lastname) 
	VALUES('Jack','Sparrow');

-- FOREIGN KEY
-- we use it to connect two tables 
-- foreign key accepts duplicates, null is also accepted
-- in a table we can have multile foreign keys

--EXAMPLE 
--Create a table name as suppliers , 
--Create supplier_id, supplier_name, contact_name fields, 

--Create one more table name as products, 
--Create supplier_id and product_id fields, 
--Make supplier_id field Foreign Key

CREATE TABLE suppliers(
	supplier_id char(5) PRIMARY KEY,
	supplier_name varchar(30),
	contact_name varchar(30)
);
SELECT * FROM suppliers;

-- first way of assigning foreign key 
CREATE TABLE products(
	supplier_id char(5),
	product_id char(30),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

select * from products;

-- second way creating foregn key
CREATE TABLE products2(
	suplr_id char(5),
	product_id char(30),
	CONSTRAINT splrFK FOREIGN KEY (suplr_id) REFERENCES suppliers(supplier_id)
);

SELECT * FROM products2;

-- FOREIGN KEY

CREATE TABLE employees(
	id char (7) PRIMARY KEY,
	name varchar(25) UNIQUE,
	salary smallint NOT NULL,
	hired_date date
);

INSERT INTO employees VALUES('1000001','Jenifer',12000,'2024-04-04');
INSERT INTO employees VALUES('1000008',null,5000, '2018-04-14');
INSERT INTO employees VALUES('1000004','Veli Han',5000, '2019-04-14');
INSERT INTO employees VALUES('1000005','Mustafa Ali',5000, '2019-04-14');

--ERROR
-- INSERT INTO employees VALUES('10006','Mustafa Ali',null, '2019-04-14');

-- ERROR
-- INSERT INTO employees VALUES ('10009','cem','','2018-04-14');



INSERT INTO employees VALUES ('','cem2',100,'2018-04-14');

-- ERROR
-- INSERT INTO employees VALUES ('','cem3',100,'2018-04-14');

SELECT * FROM employees;

--adresid, atreet, state, city	
CREATE TABLE addresses(
	address_id char(7),
	street varchar(30),
	state varchar(20),
	city varchar(20),
	CONSTRAINT ad_id FOREIGN KEY (address_id) REFERENCES employees (id)
);
-- ERROR: insert or update on table "addresses" violates foreign key constraint "ad_id"
-- INSERT INTO addresses VALUES('10003','X street','X state','X city');
-- employees (PARENT)-> id field -> PK
-- addresses (CHILD) -> address_id-> FK
-- When you try to add a new record into addresses table , you have to make sure the FK is already exist in the parent table

INSERT INTO addresses VALUES('1000004','X street','X state','X city');

INSERT INTO addresses VALUES('1000008', 'streetA', 'state A', 'city A');
-- below code works bceause foreign key accepts null value
INSERT INTO addresses VALUES(NULL, 'streetL', 'state O', 'city Z');

-- foreign key also accept duplicates
INSERT INTO addresses VALUES('1000008', 'streetL', 'state O', 'city Z');


SELECT * from addresses;

CREATE TABLE employees2(
	id char (7) PRIMARY KEY,
	name varchar(25) UNIQUE,
	salary int CHECK (salary>5000) NOT NULL,
	hired_date date
);

INSERT INTO employees2 VALUES('10001','Eric Court', 20000, '2018-04-06');
INSERT INTO employees2 VALUES('10003','Jennifer K', 40000, '2018-04-06');
INSERT INTO employees2 VALUES('10004','Johnson S', 70000, '2018-04-06');
INSERT INTO employees2 VALUES('10005','George L', 9000, '2018-04-06');

-- below code will be ERROR because salary does not meet the CHECK condition
INSERT INTO employees2 VALUES('10002','Melisa Jackson', 700, '2018-04-06');


SELECT * FROM employees2;

SELECT name from employees2;

SELECT name, salary FROM employees2;

SELECT name, id, hired_date from employees2;

SELECT * FROM employees2;
SELECT name, salary FROM employees2 WHERE salary > 20000;

SELECT * FROM employees2 WHERE name = 'George L';

SELECT * FROM employees2 Where salary = 20000;

-- DELETE keyword

DELETE FROM addresses WHERE city= 'X city';

Delete from addresses where address_id='1000008' and state = 'state A';

-- the below code deletes all the data from the table
delete from addresses;

DELETE FROM employees2;

SELECT * FROM addresses;

-- how to delete table?
DROP TABLE addresses;
DROP Table employees2;

CREATE TABLE DigitalDevices (
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);
SELECT * FROM DigitalDevices;
-- Inserting Sample Digital Devices
INSERT INTO DigitalDevices (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
(1, 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
(2, 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
(3, 'Tablet', 'Samsung', 'Galaxy Tab S7', 649.99, 8),
(4, 'Smartwatch', 'Fitbit', 'Versa 3', 229.95, 20),
(5, 'Wireless Earbuds', 'Apple', 'AirPods Pro', 249.00, 12);

-- AND OR 
-- EXP: Delete the records which brand is Fitbit, Dell.

--the below code will note delete anything because the satisfaction cannot be satisfied
DELETE FROM  DigitalDevices WHERE brand = 'Fitbit' AND brand = 'Dell';
-- The brand can't be equal to fitbit and dell at the same time

DELETE FROM  DigitalDevices WHERE brand = 'Fitbit' OR brand = 'Dell';

-- EXP:Delete the records whichs Brand is Apple and Model is iPhone 12
DELETE FROM  DigitalDevices WHERE brand = 'Apple' AND model = 'iPhone 12';

SELECT * FROM DigitalDevices;

-- SQL is case insensitive

-- below code will not delete any data, because we do not have SaMSung but Samsung
DELETE FROM DigitalDevices Where brand='SaMSung';
-- strings are case sensitive
DELETE FROM DigitalDevices Where brand='Samsung';

-- TRUNCATE --> deletes permanently
TRUNCATE digitaldevices;

DROP TABLE if exists digitaldevices;

CREATE TABLE stds1
(
id CHAR(3) primary key,
name VARCHAR (50), 
parent_name VARCHAR(50), 
exam_note int);
INSERT INTO stds1 VALUES (123,'Ali Can', 'Hasan', 75); 
INSERT INTO stds1 VALUES (124, 'Merve Gul', 'Ayse',85);
INSERT INTO stds1 VALUES (125, 'Kemal Yasa', 'Hasan',85); 
INSERT INTO stds1 VALUES (126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO stds1 VALUES (127, 'Mustafa Bak', 'Can',99);
SELECT * FROM stds1;

CREATE TABLE notes1 ( 
std_id char (3),
lesson_name varchar (30),
exam_note int,
CONSTRAINT notes1_fk FOREIGN KEY (std_id) REFERENCES stds1(id)
--on delete cascade
);
INSERT INTO notes1 VALUES ('123', 'chemistry',75); 
INSERT INTO notes1 VALUES ('124', 'pyhsics',65); 
INSERT INTO notes1 VALUES ('125', 'history',90); 
INSERT INTO notes1 VALUES ('126', 'Maths',90);
SELECT * FROM notes1;

--Errorrr!!!! -> Below code doesnt work
DELETE FROM stds1 WHERE id='123';
--If FK is exist in the child table , you can not delete from the parent table directly. 
-- It gives errorr, because it is connected , there is a relationship. 
--If you would like to delete firstly you will delete from child table then you can delete from the parent table
--stds1 is the parent table 
DELETE FROM notes1 WHERE std_id='123';
DELETE FROM notes1 WHERE std_id='124';
DELETE FROM stds1 WHERE id='124';

CREATE TABLE stds2
(
id CHAR(3) primary key,
name VARCHAR (50), 
parent_name VARCHAR(50), 
exam_note int);
INSERT INTO stds2 VALUES (123,'Ali Can', 'Hasan', 75); 
INSERT INTO stds2 VALUES (124, 'Merve Gul', 'Ayse',85);
INSERT INTO stds2 VALUES (125, 'Kemal Yasa', 'Hasan',85); 
INSERT INTO stds2 VALUES (126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO stds2 VALUES (127, 'Mustafa Bak', 'Can',99);
SELECT * FROM stds2;

CREATE TABLE notes2 ( 
std_id char (3),
lesson_name varchar (30),
exam_note int,
CONSTRAINT notes2_fk FOREIGN KEY (std_id) REFERENCES stds2(id)
on delete cascade
);
-- on delete cascade option should be stated in the child creation

INSERT INTO notes2 VALUES ('123', 'chemistry',75); 
INSERT INTO notes2 VALUES ('124', 'pyhsics',65); 
INSERT INTO notes2 VALUES ('125', 'history',90); 
INSERT INTO notes2 VALUES ('126', 'Maths',90);
SELECT * FROM notes2;
--on delete cascade -> deletes the record even if it is related in another table , without caring the relationship we can delete it.
-- The below code deletes the data from also the child TABLE
-- it means if you delete the record from parent it is also deleted from the child
DELETE FROM stds2 WHERE id='123';

DELETE FROM notes2 WHERE std_id = '124';
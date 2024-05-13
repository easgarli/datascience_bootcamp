CREATE TABLE march
(
product_id int,
customer_name varchar (50), 
product_name varchar (50)
);
INSERT INTO march VALUES (10, 'Mark', 'Honda'); 
INSERT INTO march VALUES (20, 'John', 'Toyota'); 
INSERT INTO march VALUES (30, 'Amy', 'Ford'); 
INSERT INTO march VALUES (20, 'Mark', 'Toyota'); 
INSERT INTO march VALUES (10, 'Adam', 'Honda'); 
INSERT INTO march VALUES (40, 'John', 'Hyundai'); 
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE april
(
product_id int,
customer_name varchar(50), 
product_name varchar(50)
);
INSERT INTO april VALUES (10, 'Hasan', 'Honda'); 
INSERT INTO april VALUES (10, 'Kemal', 'Honda'); 
INSERT INTO april VALUES (20, 'Ayse', 'Toyota'); 
INSERT INTO april VALUES (50, 'Yasar', 'Volvo'); 
INSERT INTO april VALUES (20, 'Mine', 'Toyota');

SELECT * from march;

SELECT product_id, customer_name from march WHERE product_id in 
	(SELECT product_id from april);


SELECT product_id, customer_name from march WHERE EXISTS
	(SELECT product_id from april Where
	march.product_id = april.product_id);

SELECT customer_name, product_name FROM april WHERE EXISTS
(SELECT product_name FROM march 
	WHERE april.product_name = march.product_name);
------------------
---UPDATE operation

CREATE TABLE customer_preferences
(
product_id CHAR(10),
customer_name VARCHAR (50), 
product_name VARCHAR (50)
);
INSERT INTO customer_preferences VALUES (10, 'Mark', 'Orange'); 
INSERT INTO customer_preferences VALUES (50, 'Mark', 'Pineapple'); 
INSERT INTO customer_preferences VALUES (60, 'John', 'Avocado');
INSERT INTO customer_preferences VALUES (30, 'Lary', 'Cherries'); 
INSERT INTO customer_preferences VALUES (20, 'Mark', 'Apple'); 
INSERT INTO customer_preferences VALUES (10, 'Adem', 'Orange'); 
INSERT INTO customer_preferences VALUES (40, 'John', 'Apricot');
INSERT INTO customer_preferences VALUES (20, 'Eddie', 'Apple');
SELECT * FROM customer_preferences;

DROP TABLE customer_preferences;
-- Example
-- If customer name in Lary change it to No NAME
---- UPDATE keyword is used with SET keyword
UPDATE customer_preferences 
	SET customer_name = 'No Name' 
	WHERE customer_name = 'Lary';


UPDATE customer_preferences 
	SET customer_name = 'No Name' 
	WHERE EXISTS (Select customer_name from customer_preferences
	WHERE customer_name = 'Lary');


UPDATE customer_preferences 
	SET product_id = '50'
	WHERE EXISTS (Select product_id from customer_preferences
	WHERE product_id = '60');


DELETE FROM customer_preferences
WHERE EXISTS (SELECT product_name FROM
	customer_preferences WHERE
	product_name = 'Orange');

CREATE TABLE workers(
    worker_id SMALLINT, 
    worker_name VARCHAR(50), 
    worker_salary NUMERIC,
    CONSTRAINT Worker_id_pk PRIMARY KEY (worker_id)
);
    
INSERT INTO workers VALUES (101,'Tom Hanks', 12000); 
INSERT INTO workers VALUES (102,'Brad Pitt', 2000);
INSERT INTO workers VALUES (103,'Aisha Can', 7000);
INSERT INTO workers VALUES (104,'Angie Ocean', 12000);
SELECT * FROM workers;

DROP TABLE workers;
UPDATE workers SET worker_salary = worker_salary +1000
	WHERE worker_salary < (SELECT AVG(worker_salary) 
	from workers);

SELECT MAX(worker_salary) FROM workers;

UPDATE workers SET worker_salary = (SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_name='Brad Pitt';


UPDATE workers SET worker_salary = 
	(SELECT MIN(worker_salary)*1.3 FROM workers)
	WHERE worker_name='Tom Hanks';


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR (80)
);
INSERT INTO people VALUES (123456789, 'Mark Star', 'Florida'); 
INSERT INTO people VALUES (234567890, 'Angie Way', 'Virginia'); 
INSERT INTO people VALUES (345678901, 'Maryy Tien', 'New Jersey'); 
INSERT INTO people (ssn, address) VALUES (456789012, 'Michigan'); 
INSERT INTO people (ssn, address) VALUES (567890123, 'California'); 
INSERT INTO people (ssn, name) VALUES (567890123, 'California');
select * from people;

UPDATE people SET ssn = 555558888
WHERE ssn = 234567890;

--- IS NULL
-- to be inserted 

UPDATE people SET name = 'To be inserted'
	 WHERE name IS NULL;

UPDATE people SET address = 'To be inserted'
	 WHERE address IS NULL;

delete from people;

DELETE FROM people WHERE ssn IS NOT NULL;


What is the difference between TRUNCATE and DROP query with DELETE?
--DELETE command deletes one or more existing records from the table in the database.
--DROP Command removes the entire table from the database.
--TRUNCATE command deletes all rows in the current table and leaves the row with its column names.



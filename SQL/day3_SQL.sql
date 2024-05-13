CREATE TABLE DigitalDevices3 (
    DeviceID char(3) PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR (50) UNIQUE,
    Price DECIMAL(10, 2),
    Quantity INT
);


-- Inserting Sample Digital Devices
INSERT INTO DigitalDevices3 (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
('001' , 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
('002' , 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
('003' , 'Samsung', 'Galaxy Tab ', 'S7', 649.99, 8),
('004' , 'Fitbit', 'Versa ','3', 229.95, 20),
('005' , 'Apple', 'AirPods ','Pro', 249.00, 12);


select * from DigitalDevices3;

CREATE TABLE Users3 (
    UserID char(5) UNIQUE,
    UserName VARCHAR(40),
    DeviceID char(3),
    CONSTRAINT Users_fk FOREIGN KEY (DeviceID) REFERENCES DigitalDevices3(DeviceID)
	on delete cascade
);

INSERT INTO Users3 (UserID, UserName, DeviceID) VALUES
('12345','John', '001'), -- John owns a Laptop (DeviceID: 1)
('23456','Alice', '004'), -- Alice owns a Smartphone (DeviceID: 2)
('34567','Bob', '003');   -- Bob owns a Smartwatch (DeviceID: 4)


SELECT * FROM Users3;
INSERT INTO DigitalDevices3 VALUES ('004', 'Fitness Tracker', 'Garmin', 'Vivosmart 4', 129.99, 10);

INSERT INTO DigitalDevices3 VALUES ('009', 'E-reader', 'Amazon', 'iPhone 12', 129.99, 15);

INSERT INTO DigitalDevices3 VALUES('008', 'Gaming Console', 'X', 'PlayStation 5', 499.99, 5);

INSERT INTO DigitalDevices3 VALUES ('010', 'Laptop', 'Dell', 'Inspiron 18', 899.99, 10);

delete from digitaldevices3 where deviceid = '004';

DROP TABLE users3;
DROP TABLE digitaldevices3;

delete from digitaldevices3 where deviceid='001';

------------------------------------------------------
CREATE TABLE customers2 ( 
	product_id int,
	customer_name varchar(50), 
	product_name varchar(50)
);

INSERT INTO customers2 VALUES (10,'Mark', 'Orange');
INSERT INTO customers2 VALUES (10,'Mark', 'Orange');
INSERT INTO customers2 VALUES (20,'John', 'Apple');
INSERT INTO customers2 VALUES (30,'Amy', 'Palm');
INSERT INTO customers2 VALUES (20,'Mark', 'Apple');
INSERT INTO customers2 VALUES (10,'Adem', 'Orange');
INSERT INTO customers2 VALUES (40,'John', 'Apricot');
INSERT INTO customers2 VALUES (20,'Eddie', 'Apple');
SELECT * FROM customers2;

drop table customers2;
-------------------- SQL Conditions

-- 


select * from customers2 where product_name='Orange' 
	or product_name='Apple' 
	or product_name = 'Apricot';


-- the below code will not work
select * from customers2 where product_name='Orange' 
	AND product_name='Apple' 
	AND product_name = 'Apricot';

-- code readibility is important
 --IN
SELECT * FROM customers2 where product_name in('Orange','Apple','Apricot');

-- NOT IN
SELECT * FROM customers2 where product_name Not in('Orange','Apple','Apricot');

SELECT * FROM customers2 where customer_name in('Mark','Amy');

SELECT * FROM customers2 where customer_name ='Mark' AND product_name= 'Orange';

SELECT * FROM customers2 where product_id =30 AND customer_name= 'Amy';

-- BETWEEN condition

SELECT * FROM customers2 where product_id<40 AND product_id >20;


SELECT * FROM customers2 where product_id BETWEEN 20 AND 40;

SELECT * FROM customers2 where product_id NOT BETWEEN 20 AND 40;



CREATE TABLE clients
(
	id int,
	name VARCHAR(50),
	city VARCHAR (50),
	salary int,
	company VARCHAR (20)
);

INSERT INTO clients VALUES (123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko'); 
INSERT INTO clients VALUES (234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki'); 
INSERT INTO clients VALUES (345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko'); 
INSERT INTO clients VALUES (456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin'); 
INSERT INTO clients VALUES (567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas'); 
INSERT INTO clients VALUES (456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin'); 
INSERT INTO clients VALUES (123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE brands
(
brand_id int,
brand_name VARCHAR (20), 
employee_number int
);

INSERT INTO brands VALUES (100,'Vakko', 12000);
INSERT INTO brands VALUES (101,'Pierre Cardin', 18000);
INSERT INTO brands VALUES (102,'Adidas', 10000);
INSERT INTO brands VALUES (103,'LCWaikiki', 21000); 
INSERT INTO brands VALUES (104,'Nike', 19000);

select * from brands;


SELECT name, salary, company, city  FROM clients Where company IN 
	(select  brand_name FROM brands WHERE brand_id>101);




select * from clients;

select name, salary, company FROM clients
	WHERE company IN (select brand_name from brands where  employee_number>15000);

-- AAGREGATE FUNCTIONS-- SUM(), MAX(), MIN(), COUNT(), AVG()

SELECT MAX(salary) FROM clients;

--alias -> temporary name that you give to the resultof aggregate FUNCTION
SELECT MAX(salary) AS max_salary FROM clients;

--MIN() -> retunr the minimum VALUE
SELECT MIN(salary) AS min_salary FROM clients;

-- ROUND() -> 
SELECT ROUND(AVG(salary),3) AS avg_slry FROM clients;

-- COUNT()
SELECT COUNT(*) FROM clients WHERE company = 'Pierre Cardin';

SELECT COUNT(*) FROM clients WHERE salary >=1500;

SELECT SUM(salary) as total_salary from clients;

SELECt * FROM clients;

SELECT * FROM brands;


SELECT brand_id, brand_name, (SELECT COUNT(city) 
	FROM clients 
	WHERE company=brand_name) 
	from brands;

SELECT MAX(salary) FROM clients;

SELECT brand_name, employee_number,(SELECT MAX(salary) 
	FROM clients WHERE company = brand_name)
	FROM brands;

--- CREATE VIEW
-- it saves into the memory temporarily, without creating table or typing
-- the query again if you want to save in SQL

CREATE VIEW max_min_salaries
AS
SELECT brand_name, employee_number,
	(SELECT MAX(salary) 
	FROM clients 
	WHERE company = brand_name),

	(SELECT MIN(salary) 
	FROM clients 
	WHERE company = brand_name)
FROM brands;

SELECT * FROM max_min_salaries;


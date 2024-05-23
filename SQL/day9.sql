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

-- how to add a filed(column) to an existing TABLe
ALTER TABLE workers ADD worker_address VARCHAR(50);

-- how to add a filed with default VALUE
ALTER TABLE workers ADD employee_address TEXT DEFAULT 'Ohio, New York, FL';

--- Create a new field under workers table name it as company_name , assign as default 'Techpro Education'
ALTER TABLE workers ADD comany_name TEXT DEFAULT 'Techpro Education';

ALTER TABLE workers 
	ADD zip_code NUMERIC DEFAULT 1000,
	ADD	city VARCHAR(30);


-- how to delete a field from a TABLE
ALTER TABLE workers
	DROP COLUMN worker_address;

ALTER TABLE workers
	DROP worker_salary;

ALTER TABLE workers_to_employees
	ADD employee_salary NUMERIC DEFAULT 1000;

DELETE FROM workers where worker_id = '101'

ALTER TABLE workers rename worker_name TO employee_name;

ALTER TABLE workers_to_employees rename comany_name TO company_name;

ALTER TABLE workers RENAME to workers_to_employees;


INSERT INTO workers_to_employees VALUES (101, 'Jane Blue', 900000,39762, 'Techpro Education')

ALTER TABLE workers_to_employees ALTER COLUMN comany_name SET NOT NULL;

ALTER TABLE workers_to_employees ALTER COLUMN city SET NOT NULL;

UPDATE workers_to_employees SET city = 'Qazax' WHERE worker_id =104

ALTER TABLE workers_to_employees ADD CONSTRAINT salary_uniq UNIQUE (employee_salary)

UPDATE workers_to_employees SET employee_salary = 78450 WHERE worker_id = 104;

ALTER TABLE workers_to_employees 
	ALTER COLUMN employee_name TYPE CHAR(60);

ALTER TABLE workers_to_employees 
	ALTER COLUMN company_name TYPE VARCHAR(50);

ALTER TABLE workers_to_employees 
	ADD worker_address VARCHAR(30); 

SELECT * FROM workers_to_employees;

ALTER TABLE workers_to_employees RENAME to workers;

ALTER TABLE workers ADD UNIQUE (worker_address)

ALTER TABLE workers ADD job_title TEXT;

ALTER TABLE workers
DROP COLUMN worker_address;

ALTER TABLE workers ALTER COLUMN employee_name SET NOT NULL;

ALTER TABLE workers ALTER COLUMN employee_name DROP NOT NULL;

ALTER TABLE workers DROP CONSTRAINT salary_uniq;

SELECT * FROM workers;



----------------------------------------
CREATE TABLE Cats (
    CatID INT PRIMARY KEY,
    Name VARCHAR(50),
    Breed VARCHAR(50),
    Color CHAR(20),
    Age INT,
    Weight FLOAT
);
INSERT INTO Cats (CatID, Name, Breed, Color, Age, Weight) VALUES
(1, 'Whiskers', 'Persian', 'White', 5, 8.2),
(2, 'Luna', 'Siamese', 'Brown', 3, 6.5),
(3, 'Simba', 'Maine Coon', 'Orange', 4, 10.1),
(4, 'Mittens', 'Tabby', 'Gray', 2, 4.9),
(5, 'Oreo', 'Domestic Shorthair', 'Black and White', 1, 3.7),
(6, 'Tiger', 'Bengal', 'Striped', 6, 12.3),
(7, 'Pink', 'Maine Coon', 'Pink', 5, 10.2),
(8, 'Milo', 'Tabby', 'Orange', 2, 5.2),
(9, 'Loki', 'Siamese', 'Gray', 3, 6.7),
(10, 'Bella', 'Maine Coon', 'Brown', 5, 9.4),
(11, 'Shadow', 'Domestic Shorthair', 'Black', 1, 4.1);

ALTER TABLE cats 
	ADD COLUMN Microchipped VARCHAR(30);

ALTER TABLE cats
	DROP COLUMN weight;

ALTER TABLE cats 
	ALTER COLUMN age TYPE float;

ALTER TABLE cats
	ALTER COLUMN breed SET NOT Null;

ALTER TABLE cats
	ADD UNIQUE (name);

ALTER TABLE cats
	ADD COLUMN neutered varchar(3) DEFAULT 'no'
ALTER TABLE cats
	RENAME COLUMN color TO FurColor;

SELECT * FROM Cats;


--------------------------------------
CREATE TABLE singers (
    singer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genre_id INT,
    department_id INT,
    email VARCHAR(255)
    
);
-- Assuming genres have been inserted in order as Pop = 1, Rock = 2, Jazz = 3, Classical = 4, Electronic = 5
INSERT INTO singers VALUES (001,'John Smith', 1, 1, 'john.smith@example.com');
INSERT INTO singers VALUES (002,'Emily Davis', 2, 1, 'emily.davis@example.com');
INSERT INTO singers VALUES (003,'Chris Brown', 3, 2, 'chris.brown@example.com');
INSERT INTO singers VALUES (004,'Alexa Chung', 4, 2, 'alexa.chung@example.com');
INSERT INTO singers VALUES (005,'David Johnson', 5, 3, 'david.johnson@example.com');
INSERT INTO singers VALUES (006,'Laura Green', null, 1, 'laura.green@example.com');
INSERT INTO singers VALUES (007,'Michael Carter', null, null, 'michael.carter@example.com');
INSERT INTO singers VALUES (008,'Sophia Lee', NULL, NULL, 'sophia.lee@example.com');

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) 
);
INSERT INTO genres VALUES (1,'Pop');
INSERT INTO genres VALUES (2,'Rock');
INSERT INTO genres VALUES (3,'Jazz');
INSERT INTO genres VALUES (4,'Classical');
INSERT INTO genres VALUES (5,'Electronic');
INSERT INTO genres VALUES (10,'Hip-Hop');
INSERT INTO genres VALUES (11,'Country');
INSERT INTO genres VALUES (12,'Blues');



SELECT * FROM genres

SELECT singers.name, genres.genre_name FROM singers
LEFT JOIN genres
ON singers.genre_id = genres.genre_id

SELECT singers.name, genres.genre_name FROM singers
FULL JOIN genres
ON singers.genre_id = genres.genre_id

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

CREATE TABLE UsersCats (
    UserID INT PRIMARY KEY,
    Breed varchar(50),
    City VARCHAR(50),
    State VARCHAR(50)
);
INSERT INTO UsersCats (UserID, Breed, City, State) VALUES
(1, 'Persian', 'New York', 'NY'),
(2, 'Maine Coon', 'Los Angeles', 'CA'),
(3, 'Tabby', 'Chicago', 'IL'),
(4, 'Siamese', 'Houston', 'TX'),
(5, 'Domestic Shorthair', 'Phoenix', 'AZ'),
(6, 'Persian', 'San Francisco', 'CA'),
(7, 'Tabby', 'Seattle', 'WA'),
(8, 'Maine Coon', 'Miami', 'FL'),
(9, 'Siamese', 'Atlanta', 'GA'),
(10, 'Domestic Shorthair', 'Boston', 'MA');


SELECT state FROM userscats where breed= 'Persian';


-- Question: Write a SQL query to retrieve the names of cats owned by
-- users who live in New York.

SELECT name from cats WHERE breed IN 
	(SELECT breed from userscats where city = 'New York');


-- Question: Write a SQL query to calculate the average age of cats owned
-- by users who live in California.

SELECT avg(age) from cats WHERE breed IN 
	(SELECT breed from userscats where state = 'CA');


-- Question: Write a SQL query to find the states of users who has
-- a Maine Coon or an orange cat
SELECT state FROM userscats where breed = 'Maine Coon' OR breed In 
	(SELECT breed from cats WHERE color = 'Orange');


--List Each city name, state, cat name and total in
---how many colors this cat


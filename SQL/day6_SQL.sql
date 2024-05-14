

CREATE TABLE words
(
word_id CHAR(10) UNIQUE, 
word VARCHAR(50) NOT NULL, 
number_of_letters SMALLINT
);


INSERT INTO words VALUES (1001,'hot', 3);
INSERT INTO words VALUES (1002,'hat', 3);
INSERT INTO words VALUES (1003,'hit', 3);
INSERT INTO words VALUES (1004,'hbt', 3);
INSERT INTO words VALUES (1008,'hct', 3); 
INSERT INTO words VALUES (1005,'adem',4);
INSERT INTO words VALUES (1006,'selena', 6);
INSERT INTO words VALUES (1007,'yusuf', 5);
INSERT INTO words VALUES (1009,'yunus', 5);
INSERT INTO words VALUES (1010,'ayunus', 6);

SELECT * FROM words;




CREATE TABLE employees2
(
id CHAR (9),
name VARCHAR(50),
state VARCHAR (50),
salary SMALLINT,
company VARCHAR (20)
);

INSERT INTO employees2 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM'); 
INSERT INTO employees2 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE'); 
INSERT INTO employees2 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM'); 
INSERT INTO employees2 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO employees2 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO employees2 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE'); 
INSERT INTO employees2 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees2;




CREATE TABLE companies(
company_id CHAR (9), 
company VARCHAR(20), 
number_of_employees SMALLINT
	);
INSERT INTO companies VALUES (100,'IBM', 12000);
INSERT INTO companies VALUES (101,'GOOGLE', 18000);
INSERT INTO companies VALUES (102,'MICROSOFT', 10000);
INSERT INTO companies VALUES (103,'APPLE', 21000);
   
SELECT * FROM companies;




SELECT name from employees2 where name LIKE 'B%t';
SELECT name from employees2 
	where name LIKE '%a%';

SELECT name from employees2 
	where name LIKE '%e%' OR 
	name like '%r%';

SELECT state from employees2 
	where state LIKE '%i_'

SELECT state from employees2 
	where state LIKE '_e____%'

SELECT state from employees2 
	where state LIKE '__%i%'

SELECT state from employees2 
	where state NOT LIKE '__%i%'

SELECT word from words 
	where word NOT LIKE '%t'
	AND word NOT LIKE '%f';

SELECT word from words 
	where word LIKE '%t'
	OR word NOT LIKE '%f';

SELECT word from words 
	where word NOT LIKE '_%a%'
	AND word NOT LIKE '_%e%';


------ REGULAR EXPRESSION: REGEX
-- ordinary way
SELECT word from words WHERE 
	word LIKE 'ho%t' OR 
	word like 'ha%t' OR
	word like 'hi%t';

--regex
SELECT word FROM words WHERE word ~'h[oai]t';
SELECT word FROM words WHERE word ~'h[oai](.*)t';

INSERT INTO words VALUES (1011,'habit',5);
INSERT INTO words VALUES (101,'ahmet',5);
INSERT INTO words VALUES (1012,'ahmetaga',8);


SELECT word FROM words WHERE word ~'h(.*)[oae]t';

SELECT word FROM words WHERE word ~'^h(.*)[oae]t';

SELECT word FROM words WHERE word ~'h(.*)[oae]t$';
SELECT * FROM words;

-- ^ - first letter
-- $ - last letter
-- (.*) any CHARACTER
-- . or _ one character 
-- * and % - 0, 1, multiple characters 

SELECt word from words where word ~'^h[a-e](.*)t$';

SELECt word from words where word ~'^[say]';

SELECt word from words where word ~'[maf]$';

SELECt word from words where word ~'^s(.*)a$';

SELECT word from words where word ~'^[d-t].l';

SELECT word from words where word ~'^[d-t]..e';

CREATE TABLE workers3
(
id CHAR (9),
name VARCHAR (50),
state VARCHAR (50), 
salary SMALLINT, 
company VARCHAR (20)
);
INSERT INTO workers3 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM'); 
INSERT INTO workers3 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE'); 
INSERT INTO workers3 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM'); 
INSERT INTO workers3 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO workers3 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO workers3 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE'); 
INSERT INTO workers3 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers3;


SELECT name FROM workers3 WHERE name ~'^E(.*)y$';

SELECT name FROM workers3 WHERE name ~'^[^E](.*)[^y]$';

--Get the name values from workers2 which doesnt start with 'E' and end with y
SELECT name FROM workers3 WHERE Name ~ '^[^E](.*)[^y]$';

--Get the name values which starts with 'J', 'B',  or 'E' and ends with 'r' or 't'

SELECT name FROM workers3 WHERE Name ~ '^[JBA](.*)[rt]$'

SELECT name FROM workers3 WHERE Name ~ '^[JBA]' OR Name ~'[rt]$'

SELECT name FROM workers3 WHERE Name ~ '^[^JBE](.*)[^rt]$'SELECT salary FROM workers2 order by salary desc

SELECT * from workers2 ORDER BY number_of_employees LIMIT 3

SELECT * FROM workers2 ORDER BY number_of_employees DESC LIMIT 3;

SELECT * FROM workers2 ORDER BY number_of_employees ;

SELECT * FROM workers2 ORDER BY number_of_employees LIMIT 3 OFFSET 5;

SELECT * FROM workers2 ORDER BY number_of_employees DESC LIMIT 2 OFFSET 2;

SELECT salary, number_of_employees FROM workers2 ORDER BY salary LIMIT 3 OFFSET 4;

SELECT * FROM workers2 ORDER BY salary DESC OFFSET 2 FETCH NEXT 2 ROWS ONLY;

SELECT company from workers2 group by company

SELECT name, sum(salary) from workers2 group by name

SELECT name, sum(salary) AS sum_salary from workers2 group by name ORDER BY sum_salary DESC LIMIT 1 OFFSET 1;

SELECT name, sum(salary) AS sum_salary from workers2 group by name ORDER BY sum_salary DESC LIMIT 1 OFFSET 1;

SELECT state, count(*) as num_of_workers from workers2 group by state ORDER BY num_of_workers DESC;


SELECT * FROM workers2

--Find the sum of number_of_employees for each company which pays over 2000$
SELECT sum(number_of_employees) AS total_employees, company from workers2 WHERE salary > 2000 group by company;

SELECT company, min(salary) as min_salary, max(salary) as max_salary from workers2 group by company;



SELECT * FROM workers2

SELECT name, SUM(salary) AS total_salary FROM workers2 GROUP BY name HAVING sum(salary)>2500

SELECT company, count(name) as num_of_workers from workers2 group by company having count(name)>1;

SELECT company, min(salary) from workers2 group by company having min(salary)>2000

SELECT state, max(salary) from workers2 group by state having max(salary)<3000


SELECT * from workers2;
SELECT name from workers2;

SELECT distinct name from workers2;

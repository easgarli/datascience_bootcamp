SELECT salary FROM workers2 order by salary desc

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

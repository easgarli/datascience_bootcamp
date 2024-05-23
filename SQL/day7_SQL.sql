select breed, avg(weight) from cats group by breed HAVING avg(weight)>7.5;

SELECT breed, ROUND(AVG(weight)::numeric, 2) FROM cats GROUP BY breed;

SELECT breed, ROUND(CAST(AVG(weight) AS numeric), 2) FROM cats GROUP BY breed;

select * from cats order by weight DESC LIMIT 3 OFFSET 3;

SELECT breed, count(*) from cats group by breed order by breed

select breed, sum(weight) from cats group by breed having sum(weight)>10 order by sum(weight)

SELECT name, breed from cats WHERE  age > (select avg(age) FROM cats)


select breed, count(*), avg(age) from cats group by breed having  count(*)>2 and avg(age) < 5

select * from cats where name like 'L%'

select * from cats where name ~ '^(.+)i(.+)$'

select * from cats where breed ~ '^[MB]'

select * from cats where breed ~ 'oon$'

select * from cats where name ~ '^[LTW](.*)r$'

select * from cats where color ~ '^[A-M]..[cw]'
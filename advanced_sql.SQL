
--numeric(3,2) -> 3-> precision, 2 -> scale
--raise notice -> we will give a message
-- % ->
-------------Advanced SQL 
--If i would like to print -> 1 Jonathan Black has paid 20.5.
do $$
declare 
	counter integer :=1;
	first_name varchar(50) :='Jonathan';
	last_name varchar(50) :='Black';
	payment numeric(4,2) :=20.5;
begin
	raise notice '% % % has paid %',
	counter,
	first_name,
	last_name,
	payment;
end $$;

---------------------
--Mr.Jason and Mr.George bought a coffee paying 20 dolars.
do $$
declare
	first_person varchar(50) :='Mr.Jason';
	second_person varchar(50) :='Mr.George';
	payment numeric(4) := 20;
begin 
	raise notice '% and % bought a coffee paying % dollars',
	first_person,
	second_person,
	payment;
end $$;
--order is important.


do $$
DECLARE
	created_at time :=now();
BEGIN
	raise notice '%',created_at;
	perform pg_sleep(5);
	raise notice '%', created_at;
END $$;
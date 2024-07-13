CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    breed VARCHAR(50),
    color VARCHAR(30)
);


INSERT INTO cats (name, age, breed, color) VALUES 
('Whiskers', 3, 'Maine Coon', 'Gray'),
('Socks', 2, 'Tabby', 'Brown and Black'),
('Mittens', 1, 'Persian', 'White'),
('Luna', 3, 'Siamese', 'White'),
('Oscar', 2, 'Bengal', 'Black and Gold'),
('Milo', 4, 'Russian Blue', 'Gray'),
('Bella', 1, 'Ragdoll', 'Blue'),
('Max', 5, 'British Shorthair', 'Silver');

SELECT * FROM cats;

do $$
DECLARE
	cat_name cats.name%type = 'Luna';
BEGIN
	IF EXISTS (SELECT name FROM cats where name=cat_name) THEN
		DELETE FROM cats WHERE name=cat_name;
		raise notice 'The cat with the name % was deleted',cat_name;
	ELSE
		raise notice '% does not exist in the table.',cat_name;
	end if;
end $$;

do $$
DECLARE
	cat_name cats.name%type = 'Oscar';
	cat_age cats.age%type =3;
BEGIN
	IF EXISTS (SELECT name FROM cats where name=cat_name) THEN
	UPDATE cats SET age = cat_age WHERE name=cat_name;
		raise notice 'The age of the cat % was updated to %',cat_name,cat_age;
	ELSE
		raise notice '% does not exist in the table.',cat_name;
	end if;
end $$;


do $$ 
declare 
	movie_type movie.type%type;
	movie_id movie.id%type:=94;
	message varchar(50);
begin 
	select type from movie into movie_type where id=movie_id;
	if found then 
		case movie_type
			when 'Horror' then 
				message:='Not Proper for children';
			when 'Action' then 
				message:='Not Proper for children';
			when 'Adventure' then 
				message:='Appropriate for children';
			when 'Animation' then 
				message:='Appropriate for children';
			when 'Comedy' then 
				message:= 'Appropriate for children';
			else
				message:='Undefined';
		end case;
		raise notice 'The movie is %',message;
	else 
		raise notice 'Id is not recognized!';
	end if;	
end $$;	


do $$ 
declare 
	movie_type movie.type%type;
	movie_id movie.id%type:=94;
	message varchar(50);
begin 
	select type from movie into movie_type where id=movie_id;
	if found then 
		case movie_type
			when 'Horror', 'Action'  then 
				message:='Not Proper for children';
			when 'Adventure', 'Animation', 'Comedy' then 
				message:= 'Appropriate for children';
			else
				message:='Undefined';
		end case;
		raise notice 'The movie is %',message;
	else 
		raise notice 'Id is not recognized!';
	end if;	
end $$;	



do $$
BEGIN
	for counter in 1..5 loop
		raise notice 'The counter: %',counter;
	end loop;
end $$;

--------------------------------
do $$
BEGIN
	for counter in 1..15 by 3  loop
		raise notice 'The counter: %',counter;
	end loop;
end $$;

--- error BY value of FOR loop must be greater than zero
do $$
BEGIN
	for counter in 15..1 by -3  loop
		raise notice 'The counter: %',counter;
	end loop;
end $$;

----instead usev reverse
do $$
BEGIN
	for counter in reverse 15..1 by 3  loop
		raise notice 'The counter: %',counter;
	end loop;
end $$;

-----
do $$
BEGIN
	for letter in 65..90 loop
		raise notice 'The character is: %',chr(letter);
	end loop;
end $$;

do $$
DECLARE
    movie_detail record;
BEGIN
    FOR movie_detail in (SELECT title, length
    					from movie
    					order by length desc limit 2)
    loop
    	raise notice 'The movie: %, length is: %',
    	movie_detail.title, 
		movie_detail.length;
    end loop;
end $$;


do $$ 
declare 
	n integer :=15;
	counter integer:=0;
	first_num integer:=0;
	second_num integer:=1;
	fib_num integer:=0;
begin 
	if(n<=0) then 
	raise notice 'Negative values are not accepted. ';
	else
		loop 
			exit when counter=n;
			counter:=counter+1;
			select second_num , first_num+second_num into first_num,second_num;

			fib_num:=first_num;

			raise notice '%',fib_num;
		end loop;
	end if;
end $$;
---- Advanced SQL 2
---- copy data type from TABLE
-- Task: get movies type which name is Mission Impossible
	
do $$
DECLARE
	movie_type movie.type%type; 
	movie_length movie.length%type;
BEGIN
	select type, length
	from movie 
	INTO movie_type, movie_length
	WHERE title='Mission Impossible';
	raise notice 'Mission Impossible movies type is : % and length is :%',movie_type,movie_length;
END $$;

---- explanations
-- Get the type field from movie table with data type of it

do $$
DECLARE
	movie_type movie.type%type; 
	movie_length movie.length%type;
	movie_title movie.title%type :='Deep Blue Sea';
BEGIN
	select type, length
	from movie 
	INTO movie_type, movie_length
	WHERE title=movie_title;
	raise notice 'Deep Blu Sea movies type is : % and length is :%',movie_type,movie_length;
END $$

--------------------- ROW TYPE
--- Print the actor's all data where the actor id is 1	

DO $$
DECLARE
	selected_actor actor%rowtype;
BEGIN
	SELECT * FROM actor INTO selected_actor where id=1;
	raise notice 'The actors name is % %', selected_actor.first_name, selected_actor.last_name;
END $$


------ RECORD
-- it is flexible
-- Task: print on the console the movie title and type woth the id equal 1

DO $$
DECLARE
	rec record;
BEGIN
	SELECT title,type FROM movie into rec where id=1;
	raise notice 'Ttile is : % - Type is : % ', rec.title, rec.type;
END $$

	--- BLOCKS


do $$
<<outer_blok>>
declare 
	counter integer :=0;
begin 
	counter:=counter+1;
	raise notice 'The value of the counter is : %',counter;
	
	<<inner_blok>>
	declare
		counter integer:=0;
	begin 
		counter:=counter+10;
		raise notice 'The value of the inner_counter is : %',inner_blok.counter;
		raise notice 'The value of the outer counter is : %',outer_blok.counter;
	end;
end $$;



DO $$
<<outer_blok>>
DECLARE
	counter
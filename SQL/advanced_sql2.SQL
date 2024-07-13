do $$
DECLARE
	the_movie movie%rowtype;
	movie_id movie.id%type :=1;
BEGIN
	SELECT * FROM movie INTO the_movie WHERE id=movie_id;
	raise notice 'The movie title is : % with the id: %', the_movie.title,movie_id;
END $$;

-----
-- Check if the id exists in the table. If it exists print the title, else print not EXISTS
-- The below code works but is not suggested because there is repetition
do $$
DECLARE
	the_movie movie%rowtype;
	movie_id movie.id%type :=1;
BEGIN
	SELECT * FROM movie INTO the_movie WHERE id=movie_id;
	IF found THEN
		raise notice 'The movie title is : % with the id: %', the_movie.title,movie_id;
	END IF;	
	IF not found THEN
		raise notice 'The movie with the id % does not exist!',movie_id;
	END IF;
END $$;

--------IF ELSE
do $$
DECLARE
	the_movie movie%rowtype;
	movie_id movie.id%type :=1;
BEGIN
	SELECT * FROM movie INTO the_movie WHERE id=movie_id;
	IF found THEN
		raise notice 'The movie title is : % with the id: %', the_movie.title,movie_id;
	ELSE
		raise notice 'The movie with the id % does not exist!',movie_id;
	END IF;
END $$;

--syntax 
-- if condition1 then 
-- 	statement1;
-- 	elseif condition2 then
-- 		statement2;
-- 	elseif condition3 then 
-- 		statement3;
-- 	else 
-- 		else-statement;

do $$
DECLARE
	the_movie movie%rowtype;
	movie_id movie.id%type :=1;
BEGIN
	SELECT * FROM movie INTO the_movie WHERE id=movie_id;
	IF found THEN
		raise notice 'There is a movie title is : % with the id: %', the_movie.title,movie_id;
		IF the_movie.length < 50 THEN
			raise notice 'Short';
		ELSEIF the_movie.length > 120 THEN
			raise notice 'Long';
		END IF;
	ELSE
		raise notice 'The movie with this id has not been found!';
	END IF;
END $$;

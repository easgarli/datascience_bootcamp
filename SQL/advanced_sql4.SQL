DO $$ 
DECLARE 
	counter integer := 0;
BEGIN 
	while counter<=10 loop 
		counter=counter+1;
		if counter%2=0 then 
			raise notice '%',counter;
		else 
			continue;
		end if;	
		
	end loop;
END $$;

----
do $$
DECLARE
	counter integer :=0;
BEGIN
	loop
		counter =counter+1;
		exit WHEN counter > 10;
		CONTINUE WHEN mod(counter,2)=1;
		raise notice 'Even number is: %',counter;
	END loop;
END $$;

-- task

CREATE TABLE bank(
	client_id integer Primary Key, 
	client_name varchar(50), 
	monthly_expense integer, 
	mes_req varchar(80), 
	membership varchar (20)
);
INSERT INTO bank VALUES (456456456, 'Tom Hanks', 6000); 
INSERT INTO bank VALUES (456456457, 'Brad Pitt', 3000); 
INSERT INTO bank VALUES (456456458, 'Hug Grant', 2000); 
INSERT INTO bank VALUES (456456459, 'Tom Junior', 45000); 
INSERT INTO bank VALUES (456456453, 'John Walker', 2500);
SELECT * FROM bank;

--Task: Update all rows where the expense amount is above 5000 per month and reqiure a message for the client
--to receive a message to pass on to a premium membership in a bank application.
--Update the membership as Premium Membership

DO $$
DECLARE
	person bank%rowtype;
	membership_val bank.membership%type:='Premium membership';
	message_val bank.mes_req%type := 'Need to update to Premium';
	monthly_exp_value bank.monthly_expense%type:=5000;
BEGIN
	UPDATE bank SET membership=membership_val,mes_req=message_val
	WHERE monthly_expense > monthly_exp_value;
	FOR person IN (select * FROM  bank WHERE mes_req=message_val and membership=membership_val) loop
			raise notice 'The client % s monthly expense is % with the ID %',
			person.client_name, person.monthly_expense, person.client_id;
	END loop;	
END $$;

select * from bank;




--exmpl 

--EN: Get the first_name and last_name from actor table print together. 

DO $$
DECLARE 
	actor_record record;
BEGIN 
	for actor_record in (select first_name ||' '|| last_name from actors) loop
		raise notice '%',actor_record;
	end loop;
END $$;
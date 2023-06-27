SELECT *
FROM payment;

CREATE OR REPLACE PROCEDURE late_fee (
	customer INTEGER, -- customer id
	payment_choice INTEGER, -- payment
	late_fee_amount DECIMAL -- amount for late fee
)

LANGUAGE plpgsql -- get stored and lets other users know what language your procedure is written in
AS $$
BEGIN
	--Add late fee to cusomter payment amount
	UPDATE payment
	SET amount = amount + late_fee_amount
	WHERE customer_id = customer AND payment_id = payment_choice;
	
	-- Commit the above statement insdie of a transaction
	COMMIT;
END;
$$

-- procedures are stored on the left column

-- Calling a Stored Procedure
CALL late_Fee(341, 17504, 2.00);


-- Validate the late fee has been posted
SELECT *
FROM payment
WHERE customer_id = 341;

-- DELETE/DROP newly created stored procedure
DROP PROCEDURE late_fee;

--Using the rental table and the payment table, right a query that will add a 2.00 late fee to any rental returned after 7 days (or however long you choose)

--EX. 1
CREATE OR REPLACE PROCEDURE add_late_fee(
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE payment
  SET amount = amount + 2.00
  WHERE rental_id IN (
    SELECT rental_id
    FROM rental
    WHERE return_date > (rental_date + INTERVAL '7 days')
  );
  
  COMMIT;
END;
$$;

-- EX. 2
CREATE OR REPLACE PROCEDURE super_late_fee (
 rental INTEGER,
 date1 DATE,
 date2 DATE
)

LANGUAGE plpgsql
AS $$
BEGIN
 UPDATE amount
 SET amount = amount + 2.00
 WHERE date2 > date1 + INTERVAL '7 days';
 COMMIT;
END;
$$
	
-- Stored Functions
CREATE OR REPLACE FUNCTION add_actor(_actor_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _last_update TIMESTAMP WITHOUT TIME ZONE)
Returns void -- can return data typer but in this case we're just inserting into a table.
AS $MAIN$
Begin
	INSERT INTO actor
	VALUES(_actor_id, _first_name, _last_name, _last_update);
END;
$MAIN$
LANGUAGE plpgsql;

-- DO NOT CALL function -- SELECT it
-- Bad function call
-- CALL add_actor(500, 'Orlando', 'Bloom', NOW():timestamp)

-- Good nice way of SELECTING a function
SELECT add_actor(500, 'Orlando', 'Bloom', NOW()::timestamp);

-- Verify that the actor was added
SELECT *
FROM actor
WHERE actor_id = 500;

-- Calling a function inside of a procedure
-- take a value that function returns and then pass that into a procedure

CREATE OR REPLACE FUNCTION get_discount(price NUMERIC, percentage INTEGER)
RETURNS INTEGER
AS $$
BEGIN
RETURN (price * precentage/100);
END;
$$
LANGUAGE plpgsql;
	
CREATE OR REPLACE PROCEDURE apply_discount(
	percentage INTEGER,
	_payment_id INTEGER
)
LANGUAGE plpgsql
AS
$$
BEGIN
	UPDATE payment
	SET amount = get_discount(payment.amount, percentage)
	WHERE payment_id = _payment_id;
	COMMIT;
END;
$$
	
SELECT *
FROM payment;
	
CALL apply_dscount(50, 17507)
	






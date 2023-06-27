-- -- Customer Table for Presidents
-- CREATE TABLE customer(
-- 	customer_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100),
-- 	last_name VARCHAR(100),
-- 	email VARCHAR(200),
-- 	address VARCHAR(150),
-- 	city VARCHAR(150),
-- 	customer_state VARCHAR(100),
-- 	zipcode VARCHAR(50)
-- );

-- -- Orders Table for Presidents
-- CREATE TABLE order_(
-- 	order_id SERIAL PRIMARY KEY,
-- 	order_date DATE DEFAULT CURRENT_DATE,
-- 	amount NUMERIC(5,2),
-- 	customer_id INTEGER,
-- 	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
-- );

-- INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
-- VALUES(1,'George','Washington','gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

-- INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
-- VALUES(2,'John','Adams','jadams@usa.gov','1200 Hancock', 'Quincy', 'MA','02169');

-- INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
-- VALUES(3,'Thomas','Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkway', 'Charlottesville','VA','02169');

-- INSERt INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
-- VALUES(4,'James','Madison', 'jmad@usa.gov', '11350 Conway','Orange','VA','02169');

-- INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
-- VALUES(5,'James','Monroe','jmonroe@usa.gov','2050 James Monroe Parkway','Charlottesville','VA','02169');

-- -- INSERT INFO INTO ORDERS TABLE

-- INSERT INTO order_(order_id,amount,customer_id)
-- VALUES(1,234.56,1);

-- INSERT INTO order_(order_id,amount,customer_id)
-- VALUES(2,78.50,3);

-- INSERT INTO order_(order_id,amount,customer_id)
-- VALUES(3,124.00,2);

-- INSERT INTO order_(order_id,amount,customer_id)
-- VALUES(4,65.50,3);

-- INSERT INTO order_(order_id,amount,customer_id)
-- VALUES(5,55.50,NULL);

SELECT *
FROM customer;

SELECT *
FROM order_;

-- INNER JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
INNER JOIN order_
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN - Everything from Table A and onlynon-null values from Table B
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id;

-- RIGHT JOIN - Everyting from Table B and only non-null values from Table A
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN where previous Table B becomes Table A
SELECT first_name, last_name, order_date, amount
FROM order_ -- Table A
LEFT JOIN customer -- TABLE B
ON order_.customer_id = customer.customer_id;

-- FULL JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id;











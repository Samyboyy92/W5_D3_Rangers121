-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name,last_name
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.first_name,customer.last_name,payment.amount
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name,last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country.country = 'Nepal';


-- 5. Which staff member had the most transactions?
SELECT staff.first_name, staff.last_name
FROM payment
JOIN staff
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY count(*) DESC
LIMIT 1;

-- 6. How many movies of each rating are there?
SELECT rating,count(*)
FROM film
GROUP BY rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);


-- 8. How many free rentals did our stores give away?
SELECT count(*)
FROM rental
LEFT JOIN payment
ON payment.rental_id = rental.rental_id
WHERE payment.rental_id IS NULL;
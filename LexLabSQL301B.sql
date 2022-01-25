USE sakila; 

-- Q1 Drop column picture from staff
SELECT * FROM sakila.staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * FROM sakila.staff; -- just checking

-- Q2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- Check Tammy's information
SELECT * FROM sakila.customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';
-- Check other staff information
SELECT * FROM sakila.staff;
-- Now insert
INSERT INTO sakila.staff(first_name, last_name,         last_update) 
VALUES
('Tammy','Sanders', '         ', (current_timestamp));


-- Q3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
SELECT * FROM sakila.rental;

-- gather all information
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select film_id from sakila.film
where title = 'ACADEMY DINOSAUR';
select inventory_id from sakila.inventory
where film_id = '1';
select staff_id from sakila.staff
where first_name = 'MIKE' and last_name = 'HILLYER';
-- now insert
INSERT INTO sakila.rental(rental_date, inventory_id, customer_id, staff_id, last_update) 
VALUES
((current_timestamp),'1', '130', '1', (current_timestamp));

select * from sakila.rental
where customer_id = '130'; -- just checking it worked correctly
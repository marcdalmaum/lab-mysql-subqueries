USE sakila;

-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?

SELECT count(*) AS Copies_Hunchback_Impossible
	FROM inventory
		WHERE inventory.film_id IN (SELECT film_id FROM film WHERE title = "HUNCHBACK IMPOSSIBLE")
;

-- 2. List all films whose length is longer than the average of all the films.

SELECT *
	FROM film
		WHERE length > (SELECT AVG(length) FROM film)
;

-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_.

SELECT actor.first_name, actor.last_name
	FROM actor
		INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
			WHERE film_actor.film_id in (SELECT film_id FROM film WHERE title = "Alone Trip")
;

-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT film.title
	FROM film
		INNER JOIN film_category ON film.film_id = film_category.film_id
			WHERE film_category.category_id in(SELECT category_id FROM category WHERE name = "Family")
;

-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

SELECT customer.first_name, customer.last_name, customer.email
	FROM customer
		WHERE address_id in (
			SELECT address_id FROM address WHERE city_id in(
			SELECT city_id FROM city WHERE country_id in (
			SELECT country_id FROM country WHERE country="CANADA")))
;

SELECT customer.first_name, customer.last_name, customer.email
	FROM customer
		INNER JOIN address ON customer.address_id = address.address_id
		INNER JOIN city ON address.city_id = city.city_id
		INNER JOIN country ON city.country_id = country.country_id
			WHERE country.country="CANADA"
;
    
-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.


-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments


-- 8. Get the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.

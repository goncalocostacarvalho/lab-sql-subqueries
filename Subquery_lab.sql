USE sakila;

-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(*)
FROM film 
WHERE title = "Hunchback Impossible";

SELECT COUNT(inventory_id) AS number_copies
FROM film
JOIN inventory
USING (film_id)
WHERE title = "Hunchback Impossible";

-- List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT ROUND(AVG(length),2)  AS average 
FROM film;

SELECT title
FROM film 
WHERE length > (SELECT ROUND(AVG(length),2)  AS average FROM film);

-- Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT first_name, last_name
FROM actor
JOIN film_actor
USING (actor_id)
JOIN film
USING (film_id)
WHERE title = "Alone Trip";

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);
    
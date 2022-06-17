USE sakila;

/*task 2*/
SELECT cat.name AS CategoryName, film.title AS FilmTitle, 
	film.description AS FilmDescription, film.release_year AS ReleaseYear
FROM film AS film 
JOIN film_category AS fcat ON film.film_id = fcat.film_id
JOIN category AS cat ON fcat.category_id = cat.category_id
WHERE cat.name = 'Documentary' AND film.description LIKE '%drama%';

/*task 3*/
SELECT film.title AS FilmTitle, CONCAT(act.last_name, ", ", act.first_name) AS ActorName
FROM  film AS film
JOIN film_actor AS factor ON film.film_id = factor.film_id
JOIN actor AS act ON factor.actor_id = act.actor_id
WHERE act.first_name = 'Julia' AND act.last_name = 'McQueen';

/*task 4*/
SELECT film.title AS FilmTitle, CONCAT(act.last_name, ", ", act.first_name) AS ActorName
FROM  film AS film
JOIN film_actor AS factor ON film.film_id = factor.film_id
JOIN actor AS act ON factor.actor_id = act.actor_id
WHERE film.title = 'AMADEUS HOLY';

/*task 5*/
SELECT film.title AS FilmTitle, CONCAT(cust.last_name, ", ", cust.first_name) AS CustomerName
FROM film AS film
JOIN inventory AS inv ON film.film_id = inv.film_id
JOIN rental AS rent ON rent.inventory_id = inv.inventory_id
JOIN customer AS cust ON cust.customer_id = rent.customer_id
WHERE cust.first_name = 'KATHLEEN' AND cust.last_name = 'ADAMS';

/*task 6*/
/* 
What film categories are most rented? Least?
What movies are rated as G?
Which actors' movies sell the best?
*/


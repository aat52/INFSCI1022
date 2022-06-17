USE sakila;

/*task 1*/
SELECT film.title AS MovieTitle, film.rental_rate AS RentalRate, film.replacement_cost AS ReplacementCost
FROM film AS film 
JOIN inventory AS inv ON film.film_id = inv.film_id
WHERE inventory_id IN
(SELECT inventory_id FROM rental WHERE MONTH(return_date) = 5 AND YEAR(return_date) = 2005);

/*task 2*/
SELECT film.title AS MovieTitle, film.rental_rate AS RentalRate, 
(SELECT max(amount) FROM payment 
JOIN rental ON rental.rental_id = payment.rental_id 
WHERE rental.inventory_id = inv.inventory_id)
AS MaximumProfit
FROM film AS film
LEFT JOIN inventory AS inv ON film.film_id = inv.film_id;

/*task 3*/
SELECT film.title AS MovieTitle, film.rental_rate AS RentalRate, max(amount) AS MaximumProfit
FROM film AS film
JOIN inventory AS inv ON film.film_id = inv.film_id
JOIN rental AS rent ON rent.inventory_id = inv.inventory_id
JOIN payment AS pay ON pay.rental_id = rent.rental_id
GROUP BY film.title,  film.rental_rate;
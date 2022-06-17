USE sakila;

/*task 1*/
SELECT cat.name AS CategoryName, film.title AS FilmTitle, 
	film.description AS FilmDescription, film.release_year AS ReleaseYear
FROM film AS film 
JOIN film_category AS fcat ON film.film_id = fcat.film_id
JOIN category AS cat ON fcat.category_id = cat.category_id
WHERE cat.name = 'Documentary' AND film.description LIKE '%drama%';

DELIMITER $$;
CREATE PROCEDURE GetMovieFromYear(
		IN given_year INT)
	BEGIN
   		SELECT title
        FROM film
        WHERE release_year = given_year;
   	END;
CALL GetMovieFromYear(2006);


/*task 2*/
SELECT film.title AS FilmTitle, CONCAT(act.last_name, ", ", act.first_name) AS ActorName
FROM  film AS film
JOIN film_actor AS factor ON film.film_id = factor.film_id
JOIN actor AS act ON factor.actor_id = act.actor_id
WHERE act.first_name = 'Julia' AND act.last_name = 'McQueen';

DELIMITER $$;
CREATE PROCEDURE GetMovieFromActor(
		IN given_actor VARCHAR(225))
	BEGIN
   		SELECT film.title AS FilmTitle, CONCAT(act.last_name, ', ', act.first_name) AS ActorName
		FROM  film AS film
		JOIN film_actor AS factor ON film.film_id = factor.film_id
		JOIN actor AS act ON factor.actor_id = act.actor_id
        WHERE CONCAT(act.last_name, ', ', act.first_name) = given_actor;
   	END;
CALL GetMovieFromActor('McQueen, Julia');

/*task 3*/
SELECT film.title AS FilmTitle, CONCAT(act.last_name, ", ", act.first_name) AS ActorName
FROM  film AS film
JOIN film_actor AS factor ON film.film_id = factor.film_id
JOIN actor AS act ON factor.actor_id = act.actor_id
WHERE film.title = 'AMADEUS HOLY';

DELIMITER $$
CREATE FUNCTION addActors() 
		RETURNS double
			NOT DETERMINISTIC
	BEGIN
			DECLARE actor_sum double;
	 
			SET actor_sum =
			(SELECT count(CONCAT(act.first_name))
			FROM  film AS film
			JOIN film_actor AS factor ON film.film_id = factor.film_id
			JOIN actor AS act ON factor.actor_id = act.actor_id
			WHERE film.title = 'AMADEUS HOLY');
	 
			RETURN (actor_sum);
	END
    
/*the select statement has to be run separately from the create statement, 
or else error code 1064 appears*/

SELECT addActors() AS COUNT;

DELIMITER $$




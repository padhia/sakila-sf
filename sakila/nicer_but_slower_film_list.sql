CREATE VIEW sakila.nicer_but_slower_film_list
AS
SELECT film.film_id AS FID
    , any_value(film.title) AS title
    , any_value(film.description) AS description
    , category.name AS category
    , any_value(film.rental_rate) AS price
    , any_value(film.length) AS length
    , any_value(film.rating) AS rating
    , LISTAGG(
        CONCAT(
            CONCAT(UPPER(SUBSTR(actor.first_name,1,1)),
            LOWER(SUBSTR(actor.first_name,2,LENGTH(actor.first_name))),
            ' ',
            CONCAT(UPPER(SUBSTR(actor.last_name,1,1)),
            LOWER(SUBSTR(actor.last_name,2,LENGTH(actor.last_name)))))
        ),
        ', '
      ) AS actors
FROM film
LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;

CREATE VIEW sakila.actor_info
AS
SELECT
a.actor_id,
a.first_name,
a.last_name,
LISTAGG(DISTINCT c.name || ': ' ||
		(
            SELECT LISTAGG(f.title, ', ') WITHIN GROUP (ORDER BY f.title)
            FROM sakila.film f
            INNER JOIN sakila.film_category fc ON f.film_id = fc.film_id
            INNER JOIN sakila.film_actor fa ON f.film_id = fa.film_id
            WHERE fc.category_id = c.category_id
                AND fa.actor_id = a.actor_id
        ), '; ') WITHIN GROUP (ORDER BY c.name)
AS film_info
FROM sakila.actor a
LEFT JOIN sakila.film_actor fa
  ON a.actor_id = fa.actor_id
LEFT JOIN sakila.film_category fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila.category c
  ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name, a.last_name;

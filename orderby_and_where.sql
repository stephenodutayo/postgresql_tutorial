-- Order by clause
SELECT
	*
FROM
	pizzas
ORDER BY
	price DESC;

SELECT
	*
FROM
	orders
ORDER BY
	date DESC,
	time ASC;
SELECT
	*
FROM
	pizza_types
ORDER BY
	3 DESC;

--where clause
SELECT
	*
FROM
	order_details
WHERE
	pizza_id = 'mexicana_l'
	AND quantity >= 2;

SELECT
	*
FROM
	order_details
WHERE
	quantity >= 2
ORDER BY
	quantity DESC;

SELECT
	*
FROM
	pizzas
WHERE
	size = 'S'
	OR size = 'L'
ORDER BY
	price DESC;

SELECT
	*
FROM
	order_details
WHERE
	pizza_id IN('hawaiian_m', 'mexicana_s','spin_pesto_l')
ORDER BY
	pizza_id;

SELECT
	*
FROM
	order_details
WHERE
	orders_id BETWEEN 1 AND 15
ORDER BY
	orders_id;

SELECT
	*
FROM
	orders
WHERE
	date BETWEEN '20150101' AND '20150106'
ORDER BY
	date DESC,
	time ASC;

SELECT
	*
FROM
	order_details
WHERE
	pizza_id LIKE '__xicana%'
ORDER BY
	pizza_id;

SELECT
	*
FROM
	order_details
WHERE
	pizza_id NOT LIKE '__xicana%'
ORDER BY
	pizza_id;

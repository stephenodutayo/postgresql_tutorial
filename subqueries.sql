/* subqueries
subqueries in the select statement
*/
/* find the average price for all pizza_id in pizzas table*/
SELECT
	pizza_id,
	size,
	price,
	(SELECT
		AVG(price) average_price
	FROM
		pizzas)
FROM
	pizzas;

SELECT
	pizza_id,
	size,
	price,
	AVG(price) OVER() axerage_price
FROM
	pizzas;

-- subqueries after the from clause
/* find the average price for all pizza_id in pizzas table beginning with letter t*/

SELECT
	AVG(price) average_price
FROM
	(SELECT
		*
	FROM
		pizzas
	WHERE
		pizza_id ILIKE 't%') subquery1
;

SELECT
	pizza_id,
	price,
	AVG(price) average_price
FROM
	(SELECT
		*
	FROM
		pizzas
	WHERE
		pizza_id ILIKE 't%') subquery1
GROUP BY
	pizza_id,
	price;
/* list all pizzas whose price is higher than the pizzas avg price*/

SELECT
	*
FROM
	pizzas
WHERE
	price > (
	SELECT
		AVG(price) average_price
	FROM
		pizzas)
ORDER BY
	price DESC;

/* find pizza_id and price for all pizza that sold more than 3 quantity*/

SELECT
	pizza_id,
	price
FROM
	pizzas
WHERE
	pizza_id IN (
	SELECT
		DISTINCT pizza_id
	FROM
		order_details
	WHERE
		quantity > 3);

SELECT
	pizza_id,
	COUNT(pizza_id) num_of_orders,	
	SUM(quantity) total_quantity
FROM
	order_details
WHERE
	pizza_id IN(
	SELECT
		DISTINCT pizza_id
	FROM
		order_details
	WHERE
		pizza_id ILIKE 's%')
GROUP BY
	pizza_id
ORDER BY
	total_quantity DESC;

SELECT
	pizza_id,
	COUNT(pizza_id) num_of_orders,
	SUM(quantity) total_quantity
FROM
	order_details
GROUP BY
	pizza_id
HAVING
	pizza_id LIKE 's%'
ORDER BY
	total_quantity DESC;

SELECT
	pizza_id
FROM
	pizzas
WHERE
	price > (
	SELECT
		AVG(price)
	FROM
		pizzas);


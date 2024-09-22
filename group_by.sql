SELECT
	*
FROM
	order_details;

SELECT
	COUNT(*) num_of_row
FROM
	order_details;
	
SELECT
	AVG(quantity) avg_quantity,
	SUM(quantity) total_quantity,
	MAX(quantity) max_quantity,
	MIN(quantity) nin_quantity
FROM
	order_details
WHERE
	pizza_id = 'mexicana_m';
	
SELECT
	pizza_id,
	AVG(quantity) avg_quantity,
	SUM(quantity) total_quantity,
	MAX(quantity) max_quantity,
	MIN(quantity) nin_quantity
FROM
	order_details
GROUP BY
	pizza_id
ORDER BY
	total_quantity DESC;

SELECT
	pizza_id,
	AVG(quantity) avg_quantity,
	SUM(quantity) total_quantity,
	MAX(quantity) max_quantity,
	MIN(quantity) nin_quantity
FROM
	order_details
GROUP BY
	pizza_id
HAVING
	SUM(quantity) >= 250
ORDER BY
	total_quantity;
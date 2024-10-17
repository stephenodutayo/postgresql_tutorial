SELECT
	od.*,
	p.price,
	od.quantity * p.price as total_price,
	CASE
		WHEN p.price >= 15 THEN 'expensive'
		WHEN p.price BETWEEN 10 AND 14 THEN 'medeium'
		ELSE 'cheap'
	END as category,
	CASE
		WHEN od.pizza_id ILIKE 'p%' THEN 'starts with p'
		ELSE null
	END as text
FROM
	order_details od
INNER JOIN pizzas p
	USING(pizza_id)
ORDER BY
	total_price ASC;






	
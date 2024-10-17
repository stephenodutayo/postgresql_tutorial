SELECT
	od.*,
	p.price,
	od.quantity * p.price total_price
FROM
	order_details od
INNER JOIN pizzas p
	USING(pizza_id)
;

CREATE VIEW total_price AS(
	SELECT
		od.*,
		p.price,
		od.quantity * p.price total_price
	FROM
		order_details od
	INNER JOIN pizzas p
		USING(pizza_id)
);

SELECT
	*
FROM
	total_price;

CREATE VIEW grand_pizza_price AS(
	SELECT
		pizza_id,
		SUM(quantity) total_pizza_sold, 
		SUM(total_price) grand_pizza_price
	FROM
		total_price
	GROUP BY
		pizza_id
	ORDER BY
		grand_pizza_price DESC)
;

DROP VIEW IF EXISTS total_price RESTRICT;
DROP VIEW IF EXISTS total_price CASCADE;
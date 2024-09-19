--simple select statement

SELECT
	pizza_type_id,
	ingredients,
	category
FROM
	pizza_types;

SELECT
	orders_id,
	date
FROM
	orders;

--with aliasing
SELECT
	order_details_id as PizzaOrderDetailsID,
	pizza_id as PizzaID,
	quantity as QTY
FROM
	order_details;
--keyword as is optional
SELECT
	pizza_id pizzaID,
	price cost
FROM
	pizzas;

--with Distint clause
SELECT
	category
FROM
	pizza_types;

SELECT
	DISTINCT 
	category
FROM
	pizza_types;











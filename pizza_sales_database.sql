CREATE TABLE IF NOT EXISTS order_details(
	order_details_id INT PRIMARY KEY,
	orders_id INT,	
	pizza_id INT,
	quantity "numeric"
);

CREATE TABLE IF NOT EXISTS orders(
	orders_id INT PRIMARY KEY,
	date DATE,
	time TIME
);

CREATE TABLE IF NOT EXISTS pizza_types(
	pizza_type_id INT PRIMARY KEY,
	name VARCHAR(300),	
	category VARCHAR(300),
	ingredients VARCHAR(300)
);

CREATE TABLE IF NOT EXISTS pizzas(
	pizza_id INT PRIMARY KEY,
	pizza_type_id INT,
	size INT,
	price REAL	
);

ALTER TABLE order_details
	ALTER COLUMN pizza_id TYPE "varchar";

ALTER TABLE pizza_types
	ALTER COLUMN pizza_type_id TYPE "varchar";

ALTER TABLE pizzas
	ALTER COLUMN pizza_id TYPE "varchar",
	ALTER COLUMN pizza_type_id TYPE "varchar",	
	ALTER COLUMN size TYPE "varchar";
	
SELECT 
	*
FROM  
	pizzas;
	
SELECT 
	*
FROM 
	order_details;

SELECT 
	*
FROM  
	orders;

SELECT 
	*
FROM  
	pizza_types;
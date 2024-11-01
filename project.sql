	
SELECT * 
FROM orders;

SELECT * 
FROM freight;

SELECT * 
FROM warehouse;

SELECT * 
FROM customer;

SELECT * 
FROM product;

SELECT * 
FROM suppliers;

-- supplier performance analysis
-- top 5 suppliers with highest average delivery time

SELECT
	supplier_id,
	supplier_name,
	COUNT(DISTINCT product_id) num_of_products_supplied,
	STRING_AGG(DISTINCT product_name, ', ') product_list,
	EXTRACT( DAY FROM AVG(delivery_date - order_date)) AS average_delivery_time
FROM 
	orders
GROUP BY
	supplier_id, 
	supplier_name
ORDER BY
	average_delivery_time DESC
LIMIT 5
;

-- checking for alternative suppliers 

SELECT
	o1.supplier_name alternative_supplier,
	o1.product_name,
	AVG(o1.delivery_date - o1.order_date) alternative_supplier_delivery_time	
FROM orders o1
GROUP BY
	o1.supplier_name,
	o1.product_name
HAVING
	AVG(o1.delivery_date - o1.order_date) < (
	SELECT
		AVG(o2.delivery_date - o2.order_date)		
	FROM
		orders o2
	WHERE
		o2.supplier_name != o1.supplier_name AND
		o2.product_name = o1.product_name
	)
ORDER BY
	o1.supplier_name;

WITH supplier_averages AS (
	SELECT
		supplier_name,
		product_name,
		AVG(delivery_date - order_date) AS average_delivery_times
	FROM
		orders
	GROUP BY
		supplier_name,
		product_name
)
SELECT
	sa1.supplier_name AS alternative_supplier,
	sa1.product_name,
	sa1.average_delivery_times AS alternative_average_delivery_time
FROM
	supplier_averages AS sa1
JOIN supplier_averages AS sa2
ON
	sa1.supplier_name != sa2.supplier_name AND
	sa1.product_name = sa2.product_name
WHERE
	sa1.average_delivery_times < sa2.average_delivery_times 
ORDER BY
	sa1.supplier_name;
	
SELECT
	s.supplier_id,
	s.supplier_name,
	COUNT(p.product_id) AS num_of_product_supplied,
	STRING_AGG( p.product_name, ', ' ORDER BY p.product_name) AS list_of_product_supplied	
FROM product p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY s.supplier_id;
/* No two suppliers supplies the same product*/

--warehouse efficiency

SELECT
	w."warehouse -id",
	w.warehouse_name,
	w."warehouse_capacity(sq fts)",
	w.warehouse_utilization,
	COUNT(o.order_id) total_num_of_orders,
	ROUND( AVG(o."value"), 4) average_order_value
FROM
	orders o
LEFT JOIN warehouse w
ON
	o.warehouse_id = w."warehouse -id"
GROUP BY
	w."warehouse -id",
	w.warehouse_name,
	w.warehouse_utilization,
	w."warehouse_capacity(sq fts)"
ORDER BY
	w.warehouse_utilization DESC;
	
SELECT
	warehouse_name,
	warehouse_utilization,
CASE
	WHEN warehouse_utilization >= 85 THEN 'NEEDS EXPANSION'
	WHEN warehouse_utilization >= 60 THEN 'SUFFICIENT'
	ELSE 'CONSOLIDATED'
END AS warehouse_recommendation
FROM
	warehouse
ORDER BY
	warehouse_name;

-- customer satisfaction and delivery times

SELECT
	c.customer_segment,
	EXTRACT( DAY FROM AVG( o.delivery_date - o.order_date)) AS average_delivery_time
FROM
	customer c
INNER JOIN orders o
ON
	c.customer_id = o.customer_id
GROUP BY
	c.customer_segment
ORDER BY 
	average_delivery_time DESC
;
-- freight analysis
SELECT
	freight_name,
	mode_of_transport,
	ROUND( AVG(order_cost), 4) avg_order_cost,	
	AVG("transit_time(days)") AS average_transit_time
FROM 
	orders 
GROUP BY
	freight_name,
	mode_of_transport
ORDER BY
	average_transit_time
;

WITH freight_averages AS (
	SELECT
		freight_name,
		mode_of_transport,
		AVG("transit_time(days)") AS average_transit_time,
		ROUND( AVG(order_cost), 2) AS average_order_cost
	FROM
		orders
	GROUP BY
		freight_name,
		mode_of_transport
)
SELECT
	fa1.freight_name AS alternative_freight_company,
	fa1.mode_of_transport,
	fa1.average_transit_time AS alternative_average_transit_time,
	fa1.average_order_cost AS alternative_average_order_cost
FROM
	freight_averages AS fa1
JOIN freight_averages AS fa2
ON
	fa1.freight_name != fa2.freight_name AND
	fa1.mode_of_transport = fa2.mode_of_transport
WHERE
	fa1.average_transit_time <= fa2.average_transit_time AND
	fa1.average_order_cost <= fa2.average_order_cost
ORDER BY
	alternative_freight_company;

	
-- product profitability

SELECT 
	product_name,
	AVG("value") average_product_value,
	AVG(order_cost) average_cost_of_product,
	AVG("value") - AVG(order_cost) axerage_profit
FROM
	orders 
GROUP BY
	product_name
ORDER BY
	axerage_profit DESC;

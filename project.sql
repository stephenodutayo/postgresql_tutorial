	
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
	STRING_AGG( DISTINCT product_id::"varchar" || ': ' ||  product_name, ', ') product_list,
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
	s.supplier_id,
	s.supplier_name,
	COUNT(p.product_id) AS num_of_product_supplied,
	STRING_AGG( p.product_name, ', ' ORDER BY p.product_name) AS list_of_product_supplied	
FROM product p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY s.supplier_id;/* No two suppliers supplies the same product*/

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
INNER JOIN warehouse w
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

-- product profitability

SELECT 
	DISTINCT p.product_name,
	p.product_price,
	AVG(DIV(o.order_cost, o.order_quantity))
FROM 
	orders o
INNER JOIN product p
ON
	o.product_id = p.product_id
GROUP BY
	p.product_name,
	p.product_price	;









	
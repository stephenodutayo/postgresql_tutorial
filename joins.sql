-- joins
-- inner joins

SELECT
	*
FROM
	client_table;

SELECT
	o.*,
	c.first_name || ' ' || c.last_name full_name,
	c."location"
FROM
	order_table o
INNER JOIN client_table c	
	ON c.client_id = o.client_id
ORDER BY
	o.order_id,
	full_name;

-- left join
INSERT INTO order_table(order_day,order_id,product_id,client_id) VALUES
('Sunday', 1011, 107, 105),
('Tuesday', 1012, 108, 106);
	
SELECT
	o.order_day,
	o.order_id,
	c.first_name || ' ' || c.last_name full_name,
	c."location",
	p.product_name,
	p.selling_price
FROM
	order_table o
LEFT JOIN client_table c	
	ON c.client_id = o.client_id
LEFT JOIN product_table p
	ON o.product_id = p.product_id
ORDER BY
	o.order_id,
	full_name;

SELECT
	o.order_day,
	o.order_id,
	c.first_name || ' ' || c.last_name full_name,
	c."location",
	p.product_name,
	p.selling_price
FROM
	order_table o
LEFT JOIN client_table c	
	USING (client_id)
LEFT JOIN product_table p
	USING (product_id)
ORDER BY
	o.order_id,
	full_name;

-- right join
SELECT
	*
FROM
	product_table;


INSERT INTO product_table(product_id,product_name,cost_price,selling_price)
VALUES
(107, 'Pencils', 100, 120),
(108, 'Rulers', 50, 70),
(109, 'Paint Brushes', 150, 170),
(110, 'Stencil set', 1000, 1200);

SELECT
	*,
	p.selling_price - p.cost_price as profit
FROM
	order_table o
RIGHT JOIN product_table p
	ON o.product_id = p.product_id;

--outer join
SELECT
	*
FROM
	order_table;

INSERT INTO order_table(order_day,order_id,product_id,client_id) VALUES
('Sunday', 1013, 113, 102);

SELECT
	*
FROM
	order_table o
FULL OUTER JOIN product_table p
	ON o.product_id = p.product_id;

--union









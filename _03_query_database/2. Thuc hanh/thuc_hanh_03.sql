CREATE DATABASE IF NOT EXISTS using_group_by_and_having;
USE using_group_by_and_having;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	order_number INT PRIMARY KEY,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(10),
    comments TEXT,
    customer_number INT
);

SELECT status FROM orders
	GROUP BY status;
    
SELECT status, COUNT(*) AS 'So luong status'
	FROM orders
	GROUP BY status;
    
DROP TABLE IF EXISTS order_details;
CREATE TABLE order_details(
	order_number INT,
    quantity_ordered INT,
    price_each DOUBLE,
    order_line_number INT,
    CONSTRAINT fk_order_details_order_number
		FOREIGN KEY(order_number) REFERENCES orders(order_number)
);

SELECT status, SUM(quantity_ordered * price_each) AS amount
	FROM orders
	INNER JOIN order_details ON orders.order_number = order_details.order_number
    GROUP BY status;
    
SELECT order_number, SUM(quantity_ordered * price_each)
	FROM order_details
    GROUP BY order_number;
    
SELECT YEAR(order_date) AS year, SUM(quantity_ordered * price_each) AS total
	FROM orders
    INNER JOIN order_details ON orders.order_number = order_details.order_number
    WHERE status = 'shipped'
    GROUP BY year
    HAVING year > 2003;
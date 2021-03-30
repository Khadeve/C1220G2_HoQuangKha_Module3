CREATE DATABASE IF NOT EXISTS database_query_from_multiple_tables;

USE database_query_from_multiple_tables;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	customer_number INT PRIMARY KEY,
    customer_name VARCHAR(50),
    contact_last_name VARCHAR(50),
    contact_first_name VARCHAR(50),
    phone VARCHAR(50),
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    country VARCHAR(50),
    sales_rep_employee_number INT,
    credit_limit DOUBLE
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	order_number INT PRIMARY KEY,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(10),
    comments TEXT,
    customer_number INT,
    CONSTRAINT fk_orders_customer_number
		FOREIGN KEY(customer_number) REFERENCES customers(customer_number)
);

DROP TABLE IF EXISTS payments;
CREATE TABLE payments(
	customer_number INT,
    check_number INT PRIMARY KEY,
    payment_date DATE,
    amount DOUBLE,
    CONSTRAINT fk_payments_customer_number
		FOREIGN KEY(customer_number) REFERENCES customers(customer_number)
);

SELECT customers.customer_number, customer_name, phone, payment_date, amount FROM customers
	INNER JOIN payments
    ON customers.customer_number = payments.customer_number
    WHERE city = 'Las Vegas';
    
SELECT customers.customer_number, customers.customer_name, orders.order_number, orders.status
	FROM customers
	LEFT JOIN orders
    ON customers.customer_number = orders.customer_number;
    
SELECT c.customer_number, c.customer_name, o.order_number, o.status
	FROM customers c LEFT JOIN orders o
    ON c.customer_number = o.customer_number
    WHERE o.order_number IS NULL;

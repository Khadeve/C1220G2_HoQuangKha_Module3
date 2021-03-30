CREATE DATABASE IF NOT EXISTS database_manipulation_products;

USE database_manipulation_products;

DROP TABLE IF EXISTS product_lines;
CREATE TABLE product_lines(
	product_line VARCHAR(50) PRIMARY KEY,
    text_description TEXT,
    html_description TEXT,
    image TEXT
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	product_code VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(50),
    product_line VARCHAR(50),
    product_scale INT,
    product_vendor VARCHAR(50),
    product_description TEXT,
    quantity_in_stock INT,
    buy_price DOUBLE
);

SELECT product_code, product_name, buy_price, quantity_in_stock FROM products
	WHERE buy_price > 56.76 AND quantity_in_stock > 10;
    
SELECT product_code, product_name, buy_price, text_description
	FROM products
	INNER JOIN product_lines
    ON products.product_line = product_lines.product_line
    WHERE buy_price > 56.76 AND buy_price < 95.59;
    
select product_code, product_name, buy_price, quantity_in_stock, product_vendor, product_line
	from products
    where product_line = 'Classic Cars' or product_vendor = 'Min Lin Diecast';
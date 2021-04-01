CREATE DATABASE IF NOT EXISTS furama_resort;

USE furama_resort;

/* -------- Tables related to employee -------- */

DROP TABLE IF EXISTS positions;
CREATE TABLE positions (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(45),
    PRIMARY KEY (position_id)
);

ALTER TABLE positions
	MODIFY position_id INT NOT NULL AUTO_INCREMENT;

INSERT INTO positions (position_name) VALUES
    ('Information Technology'),
	('Human Resource'),
    ('Sales'),
    ('Security'),
    ('House Keeping'),
    ('General Manager');

DROP TABLE IF EXISTS academic_levels;
CREATE TABLE academic_levels (
    academic_level_id INT PRIMARY KEY,
    academic_level VARCHAR(45)
);

INSERT INTO academic_levels VALUES
	(1, 'High school'),
    (2, 'Bachelor'),
    (3, 'Master');

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(45)
);

INSERT INTO departments VALUES
	(1, 'Purchasing'),
	(2, 'Marketing'),
    (3, 'Maintenance'),
    (4, 'Human Resource Management'),
    (5, 'Accounting and Finance');

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    position_id INT,
    academic_level_id INT,
    department_id INT,
    birth_date DATE,
    id_number VARCHAR(45),
    salary DOUBLE,
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(100),
    CONSTRAINT fk_position FOREIGN KEY (position_id)
        REFERENCES positions (position_id),
    CONSTRAINT fk_academic_level FOREIGN KEY (academic_level_id)
        REFERENCES academic_levels (academic_level_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

ALTER TABLE employees
	DROP FOREIGN KEY fk_position;

ALTER TABLE employees
	ADD FOREIGN KEY(position_id) REFERENCES positions(position_id);
    
DELETE FROM employees;

INSERT INTO employees VALUES
	(1, 'Kha Ho', 1, 2, 3, '1995-12-29', '123 456 789', 500.5, '0385449275', 'KhaHo@gmail.com', 'Da Nang'),
	(2, 'Hoai Do', 2, 2, 2, '1995-09-02', '456 123 789', 600, '0385444345', 'HoaiDo@gmail.com', 'Da Nang'),
	(3, 'Nhan Truong', 3, 2, 3, '1995-10-02', '456 789 123', 600, '0385555345', 'NhanTruong@gmail.com', 'Quang Tri'),
	(4, 'Nu Ai', 3, 2, 2, '1995-10-20', '000 789 123', 800, '0385555666', 'NuAi@gmail.com', 'Quy Nhon');

/* ------------------------------------------------ */

/* ------------ Tables related to customer ----------- */

DROP TABLE IF EXISTS types_of_customers;
CREATE TABLE types_of_customers (
    type_of_customer_id INT PRIMARY KEY,
    type_of_customer VARCHAR(45)
);

INSERT INTO types_of_customers VALUES
	(1, 'member'), (2, 'silver'), (3, 'gold'), (4, 'platinum'), (5, 'diamond');

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    type_of_customer_id INT,
    full_name VARCHAR(45),
    birth_date DATE,
    id_number VARCHAR(45),
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    CONSTRAINT fk_type_of_customer FOREIGN KEY (type_of_customer_id)
        REFERENCES types_of_customers (type_of_customer_id)
);

DELETE FROM customers;

INSERT INTO customers VALUES
	(1, 1, 'Gia Dong', '1995-10-11', '011 011 011', '0911234567', 'giaDong@gmail.com', 'Da Nang'),
	(2, 2, 'Thanh Cong', '1991-07-20', '011 012 012', '0911234765', 'thanhCong@gmail.com', 'Quang Nam'),
	(3, 3, 'Van Thang', '1991-06-22', '011 013 013', '0911123765', 'vanThang@gmail.com', 'Da Nang'),
	(4, 4, 'Thanh Tai', '1994-05-05', '011 014 014', '0900123765', 'thanhTai@gmail.com', 'Quang Tri'),
	(5, 5, 'Thanh Hau', '1997-12-10', '011 015 015', '0911789456', 'thanhHau@gmail.com', 'Quang Nam');
    

/* -------------------------------------------------- */

/* ------------ Tables related to service ----------- */

DROP TABLE IF EXISTS types_of_rentals;
CREATE TABLE types_of_rentals (
    type_of_rental_id INT PRIMARY KEY,
    type_of_rental VARCHAR(45),
    price DOUBLE
);

INSERT INTO types_of_rentals VALUES
	(1, 'hours', 10),
	(2, 'days', 20),
	(3, 'months', 1000),
	(4, 'years', 25000);

DROP TABLE IF EXISTS types_of_services;
CREATE TABLE types_of_services (
    type_of_service_id INT PRIMARY KEY,
    type_of_service VARCHAR(45)
);

INSERT INTO types_of_services VALUES
	(1, 'villa'),
    (2, 'house'),
    (3, 'room');

DROP TABLE IF EXISTS services;
CREATE TABLE services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(45),
    area DOUBLE,
    number_of_floors INT,
    largest_number_of_guests INT,
    price DOUBLE,
    type_of_rental_id INT,
    type_of_service_id INT,
    `status` VARCHAR(45),
    CONSTRAINT fk_type_of_rental FOREIGN KEY (type_of_rental_id)
        REFERENCES types_of_rentals (type_of_rental_id),
    CONSTRAINT fk_type_of_service FOREIGN KEY (type_of_service_id)
        REFERENCES types_of_services (type_of_service_id)
);

INSERT INTO services VALUES
	(1, 'Memory', 50, 1, 3, 250, 2, 3, 'available'),
	(2, 'Balcony', 155, 2, 4, 100, 3, 2, 'available'),
	(4, 'River wave villa', 230, 1, 7, 500, 1, 1, 'occupied');
    
UPDATE services
	SET service_id = 3 WHERE service_name = 'River wave villa';

/* -------------------------------------------------- */

/* ------------ Tables related to agreement ----------- */

DROP TABLE IF EXISTS agreements;
CREATE TABLE agreements (
    agreement_id INT PRIMARY KEY,
    employee_id INT,
    customer_id INT,
    service_id INT,
    starting_date DATE,
    ending_date DATE,
    deposit DOUBLE,
    total_money DOUBLE,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT fk_service FOREIGN KEY (service_id)
        REFERENCES services (service_id)
);

INSERT INTO agreements VALUES
	(1, 1, 1, 1, '2021-03-20', '2021-03-25', 250, 1250),
	(2, 2, 2, 2, '2021-03-20', '2021-04-20', 1000, 9000),
	(3, 3, 3, 3, '2021-03-25', '2021-03-25', 100, 250);

DROP TABLE IF EXISTS extra_services;
CREATE TABLE extra_services (
    extra_service_id INT PRIMARY KEY,
    extra_service_name VARCHAR(45),
    price DOUBLE,
    unit INT,
    status VARCHAR(45)
);

INSERT INTO extra_services VALUES
	(1, 'Massage', 20, 30, 'available'),
    (2, 'Karaoke', 50, 10, 'available'),
    (3, 'Bike tour', 25, 30, 'near full'),
    (4, 'Stream bath', 15, 50, 'near full'),
    (5, 'Swimming pool', 7, 2, 'available');

DROP TABLE IF EXISTS detailed_agreements;
CREATE TABLE detailed_agreements (
    detailed_agreement_id INT PRIMARY KEY,
    agreement_id INT,
    extra_service_id INT,
    amount INT NOT NULL,
    CONSTRAINT fk_agreement FOREIGN KEY (agreement_id)
        REFERENCES agreements (agreement_id),
    CONSTRAINT fk_extra_service FOREIGN KEY (extra_service_id)
        REFERENCES extra_services (extra_service_id)
);

INSERT INTO detailed_agreements VALUES
	(1, 1, 4, 1),
    (2, 2, 3, 1),
    (3, 3, 5, 1);

/* -------------------------------------------------- */

/* ---------------------Task 2----------------------- */
DELETE FROM employees WHERE employee_id = 5;

INSERT INTO employees VALUES
	(5, 'Khang Ho Quang Ho Quang', 4, 3, 2, '2006-09-24', '001 111 111', 750, '0901000111', 'KhangHoQuang@gmail.com', 'Binh Dinh');

SELECT 
    employee_id,
    full_name,
    CHAR_LENGTH(full_name) AS length_of_name
FROM
    employees
WHERE
    (CHAR_LENGTH(full_name) <= 15)
        AND (full_name LIKE 'H%'
        OR full_name LIKE 'T%'
        OR full_name LIKE 'K%');

/* -------------------------------------------------- */

/* ---------------------Task 3----------------------- */

INSERT INTO customers VALUES
	(6, 3, 'John Wick', '1965-10-11', '011 016 016', '0901234567', 'johnWick@gmail.com', 'Ha Noi');

SET @min_age = 18, @max_age = 50;

SELECT 
    customer_id,
    full_name,
    birth_date,
    @customer_age AS age,
    address
FROM
    customers
WHERE
    ((@customer_age:=CEIL(DATEDIFF(CURDATE(), birth_date) / 365)) >= @min_age
        AND @customer_age <= @max_age)
        AND (address = 'Da Nang'
        OR address = 'Quang Tri');

/* -------------------------------------------------- */

/* --------------------- Task 4 ----------------------- */
INSERT INTO customers VALUES
	(7, 5, 'Duc Hau', '1997-10-10', '011 017 017', '0910012456', 'ducHau@gmail.com', 'Da Nang'),
	(8, 5, 'Nha', '1995-03-25', '011 018 018', '0910012345', 'NhaMeo@gmail.com', 'Binh Dinh');
    
DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    service_id INT,
    CONSTRAINT fk_bookings_customer_id FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT fk_bookings_service_id FOREIGN KEY (service_id)
        REFERENCES services (service_id)
);

INSERT INTO bookings (customer_id, service_id) VALUES
	(1, 1), (5, 2), (1, 2),
    (7, 3), (8, 3), (5, 1),
    (6, 2), (7, 1), (7, 2);

SELECT 
    customer_id, COUNT(customer_id) AS number_of_bookings
FROM
    bookings
GROUP BY customer_id;

SELECT 
    bookings.customer_id,
    customers.full_name,
    COUNT(bookings.customer_id) AS number_of_bookings
FROM
    bookings
        INNER JOIN
    customers ON (bookings.customer_id = customers.customer_id
        AND customers.type_of_customer_id = 5)
GROUP BY bookings.customer_id
ORDER BY COUNT(bookings.customer_id);
/* -------------------------------------------------- */

/* ---------------------Task 5----------------------- */
SELECT 
    c.customer_id,
    c.full_name,
    toc.type_of_customer,
    a.agreement_id,
    s.service_name,
    a.starting_date,
    a.ending_date,
    IFNULL(a.total_money, 0) + IFNULL(SUM(es.price * es.unit), 0) AS total_money
FROM
    (((((customers c
    LEFT JOIN types_of_customers toc ON c.type_of_customer_id = toc.type_of_customer_id)
    LEFT JOIN agreements a ON c.customer_id = a.customer_id)
    LEFT JOIN services s ON a.service_id = s.service_id)
    LEFT JOIN detailed_agreements da ON a.agreement_id = da.agreement_id)
    LEFT JOIN extra_services es ON da.extra_service_id = es.extra_service_id)
    GROUP BY a.agreement_id;
/* -------------------------------------------------- */

/* ------------------------- Task 6 ------------------------- */

INSERT INTO services VALUES
	(4, 'Le Bouton Room', 70, 1, 3, 200, 1, 1, 'available'),
	(5, 'Le Bouton villa', 250, 2, 5, 1000, 1, 3, 'available');

INSERT INTO agreements VALUES
	(4, 5, 5, 3, '2018-02-20', '2018-02-22', 100, 300);
    
UPDATE agreements
	SET service_id = 4
    WHERE agreement_id = 4;

SELECT s.service_id, s.service_name, s.area, s.price, tos.type_of_service
	FROM ((services s
    INNER JOIN types_of_services tos ON s.type_of_service_id = tos.type_of_service_id)
    INNER JOIN agreements a ON s.service_id = a.service_id)
	WHERE a.starting_date < '2019-01-01' OR a.starting_date > '2019-03-31';
    
/*-----------------------------------------------------------*/

/* ------------------------- Task 7 ------------------------- */
SELECT 
    a.service_id,
    s.service_name,
    s.area,
    s.largest_number_of_guests,
    s.price,
    tos.type_of_service
FROM
    ((agreements a
    INNER JOIN services s ON a.service_id = s.service_id)
    INNER JOIN types_of_services tos ON s.type_of_service_id = tos.type_of_service_id)
WHERE
    YEAR(a.starting_date) = 2018
        AND a.service_id <> ALL (SELECT 
            service_id
        FROM
            agreements
        WHERE
            YEAR(starting_date) = 2019)
ORDER BY s.service_id;
/*-----------------------------------------------------------*/

/* ------------------------- Task 8 ------------------------- */
INSERT INTO customers VALUES
	(9, 3, 'Thanh Tai', '1995-05-05', '011 016 016', '0901123765', 'thanhTai@gmail.com', 'Da Nang'),
	(10, 3, 'Thanh Hau', '1996-12-10', '011 017 017', '0910789456', 'thanhHau@gmail.com', 'Quang Nam');
    
-- solution 1:
SELECT DISTINCT full_name AS customer_name
	FROM customers;

-- solution 2:
SELECT full_name AS customer_name
	FROM customers
    GROUP BY full_name;

-- solution 3:
/*-----------------------------------------------------------*/

/* ------------------------- Task 9 ------------------------- */
INSERT INTO agreements VALUES
	(5, 3, 3, 3, '2021-04-25', '2021-04-27', 100, 250);

SELECT
    @month_year AS `time`,
    COUNT(@month_year) AS bookings_in_month
FROM
    agreements
WHERE
    YEAR(starting_date) = 2021
GROUP BY (@month_year:=SUBSTRING(starting_date, 1, 7))
ORDER BY @month_year;

/*-----------------------------------------------------------*/

/* ------------------------- Task 10 ------------------------- */
/*------------------------------------------------------------*/

/* ------------------------- Task 11 ------------------------- */
INSERT INTO customers VALUES
	(11, 5, 'Thanh Tung', '1990-10-11', '011 111 111', '0901234000', 'thanhTung@gmail.com', 'Quang Ngai'),
	(12, 5, 'Duc', '1997-02-11', '011 112 112', '0901111000', 'duc@gmail.com', 'Vinh');
    
INSERT INTO agreements VALUES
	(6, 4, 11, 4, '2021-02-10', '2021-02-15', 100, 900),
	(7, 2, 12, 3, '2021-02-10', '2021-02-13', 500, 1000);
    
INSERT INTO detailed_agreements VALUES
	(4, 6, 3, 1),
    (5, 7, 4, 1);
    
SELECT 
    es.extra_service_name,
    es.price,
    es.unit,
    c.full_name AS customer_name,
    c.customer_id,
    c.address,
    toc.type_of_customer
FROM
    ((((extra_services es
    INNER JOIN detailed_agreements da ON da.extra_service_id = es.extra_service_id)
    INNER JOIN agreements a ON a.agreement_id = da.agreement_id)
    INNER JOIN customers c ON c.customer_id = a.customer_id)
    INNER JOIN types_of_customers toc ON toc.type_of_customer_id = c.type_of_customer_id)
WHERE
    toc.type_of_customer = 'diamond'
        AND (c.address = 'Vinh'
        OR c.address = 'Quang Ngai');
/*-----------------------------------------------------------*/

/* ------------------------- Task 12 ------------------------- */
INSERT INTO detailed_agreements VALUES
	(6, 1, 2, 1);

DROP VIEW IF EXISTS booked_services;
CREATE VIEW booked_services AS
    SELECT 
        a.agreement_id,
        a.starting_date,
        e.full_name AS employee_name,
        c.full_name AS customer_name,
        c.phone_number AS customer_phone_number,
        s.service_id,
        s.service_name,
        COUNT(da.agreement_id) AS number_of_extra_services,
        a.deposit
    FROM
        ((((agreements a
        INNER JOIN employees e ON a.employee_id = e.employee_id)
        INNER JOIN customers c ON a.customer_id = c.customer_id)
        INNER JOIN services s ON a.service_id = s.service_id)
        INNER JOIN detailed_agreements da ON a.agreement_id = da.agreement_id)
    GROUP BY (da.agreement_id)
    ORDER BY (da.agreement_id);

SELECT * FROM booked_services;	-- service_id: 1 2 3 4 5

DROP TABLE IF EXISTS booked_services_in_last_3_months; 
CREATE VIEW booked_services_in_last_3_months AS
	SELECT * FROM agreements
    WHERE starting_date BETWEEN '2021-10-01' AND '2021-12-31';

SELECT * FROM booked_services_in_last_3_months;	-- service_id: 2 5

CREATE VIEW booked_services_in_first_6_months AS
	SELECT * FROM agreements
    WHERE starting_date BETWEEN '2021-01-01' AND '2021-06-30';

SELECT * FROM booked_services_in_first_6_months;	-- service_id: 1 2 3 4

SELECT DISTINCT s1.agreement_id, s1.employee_name, s1.customer_name, s1.customer_phone_number,
		s1.service_id, s1.service_name, s1.number_of_extra_services, s1.deposit
	FROM booked_services s1
    WHERE s1.service_id = ANY (SELECT service_id FROM booked_services_in_last_3_months)
    AND s1.service_id <> ALL (SELECT service_id FROM booked_services_in_first_6_months)
    ORDER BY s1.agreement_id;
/*-----------------------------------------------------------*/

/* ------------------------- Task 13 ------------------------- */
DROP VIEW IF EXISTS number_of_using_extra_services;
CREATE VIEW number_of_using_extra_services AS
    SELECT 
        extra_service_id, COUNT(extra_service_id) AS number_of_using
    FROM
        detailed_agreements
    GROUP BY extra_service_id
    ORDER BY COUNT(extra_service_id);
    
SELECT * FROM number_of_using_extra_services;

DROP VIEW IF EXISTS busiest_extra_services;
CREATE VIEW busiest_extra_services AS
	SELECT extra_service_id FROM number_of_using_extra_services
		WHERE number_of_using IN (SELECT MAX(number_of_using) FROM number_of_using_extra_services);
	
SELECT * FROM busiest_extra_services;

SELECT * FROM extra_services
	INNER JOIN busiest_extra_services
    ON extra_services.extra_service_id = busiest_extra_services.extra_service_id;
/*-------------------------------------------------------------*/

/* ------------------------- Task 14 ------------------------- */

SELECT 
    a.agreement_id,
    tos.type_of_service,
    es.extra_service_name,
    nou.number_of_using
FROM
    (((((agreements a
    INNER JOIN detailed_agreements da ON a.agreement_id = da.agreement_id)
    INNER JOIN extra_services es ON es.extra_service_id = da.extra_service_id)
    INNER JOIN services s ON a.service_id = s.service_id)
    INNER JOIN types_of_services tos ON tos.type_of_service_id = s.type_of_service_id)
    INNER JOIN number_of_using_extra_services nou ON nou.extra_service_id = es.extra_service_id)
WHERE
    number_of_using = 1
ORDER BY agreement_id;

/*-----------------------------------------------------------*/

/* ------------------------- Task 15 ------------------------- */

DROP VIEW IF EXISTS number_of_contacts_in_2018_of_employee;
CREATE VIEW number_of_contacts_in_2018_of_employee AS
	SELECT employee_id, COUNT(employee_id) AS number_of_contacts
     FROM agreements
     WHERE YEAR(starting_date) = 2018
     GROUP BY employee_id
     ORDER BY COUNT(employee_id);
     
SELECT e.employee_id, e.full_name, acl.academic_level, d.department_name,
	e.phone_number, e.address
    FROM employees e
		INNER JOIN academic_levels acl ON acl.academic_level_id = e.academic_level_id
        INNER JOIN departments d ON d.department_id = e.department_id
        INNER JOIN number_of_contacts_in_2018_of_employee noc ON noc.employee_id = e.employee_id
	WHERE noc.number_of_contacts IN (1, 2, 3)
    ORDER BY employee_id;

/* ----------------------------------------------------------- */

/* ------------------------- Task 16 ------------------------- */

INSERT INTO employees VALUES
	(6, 'Thanh Tai', 1, 3, 3, '1995-02-03',	'001 006 006', 800,	'0901111220', 'ThanhTai@gmail.com',	'Quang Tri');
    
INSERT INTO agreements VALUES
	(20, 6, 5, 5, '2021-03-31',	'2021-04-03', 100, 900);
    
INSERT INTO detailed_agreements VALUES
	(13, 20, 2, 3);

DROP VIEW IF EXISTS number_of_contacts_2017_to_2019_of_employee;
CREATE VIEW number_of_contacts_2017_to_2019_of_employee AS
	SELECT employee_id, COUNT(employee_id) AS number_of_contacts_in_2017_2018
		FROM agreements
        WHERE YEAR(starting_date) IN (2017, 2018)
        GROUP BY employee_id
        ORDER BY employee_id;
        
DELETE agreements , detailed_agreements FROM agreements
        INNER JOIN
    detailed_agreements ON agreements.agreement_id = detailed_agreements.agreement_id 
WHERE
    agreements.employee_id NOT IN (SELECT 
        employee_id
    FROM
        number_of_contacts_2017_to_2019_of_employee);
        
DELETE FROM employees 
WHERE
    employee_id NOT IN (SELECT
        employee_id
    FROM
        number_of_contacts_2017_to_2019_of_employee);
/* ----------------------------------------------------------- */

/* ------------------------- Task 17 ------------------------- */
DROP VIEW IF EXISTS total_use_of_platinum_customers_in_2019;
CREATE VIEW total_use_of_platinum_customers_in_2019 AS
	SELECT c.customer_id, c.full_name AS customer_name, toc.type_of_customer,
		SUM(a.total_money + (es.price * da.amount)) AS total_money
        FROM ((((customers c
        INNER JOIN types_of_customers toc ON c.type_of_customer_id = toc.type_of_customer_id)
        INNER JOIN agreements a ON a.customer_id = c.customer_id)
        INNER JOIN detailed_agreements da ON da.agreement_id = a.agreement_id)
        INNER JOIN extra_services es ON es.extra_service_id = da.extra_service_id)
        WHERE YEAR(a.starting_date) = 2019 AND toc.type_of_customer = 'platinum'
        GROUP BY c.customer_id
        ORDER BY c.customer_id;
        
UPDATE customers
	SET type_of_customer_id = 5
    WHERE customer_id = ANY (
		SELECT customer_id FROM total_use_of_platinum_customers_in_2019
        WHERE total_money > 3000);
/* ----------------------------------------------------------- */

/* ------------------------- Task 18 ------------------------- */
INSERT INTO customers VALUES
	(15, 3, "Ai Nu", '1995-01-09', '011 114 114', '0901555678', 'aiNu@gmail.com', 'Quy Nhon');
    
INSERT INTO agreements VALUES
	(23, 1, 15, 1, '2015-01-01', '2015-01-05', 1000, 5000);

DELETE customers, agreements
	FROM customers
    INNER JOIN agreements ON customers.customer_id = agreements.customer_id
    WHERE YEAR(agreements.starting_date) < 2016;
/* ----------------------------------------------------------- */

/* ------------------------- Task 19 ------------------------- */

DROP VIEW IF EXISTS number_of_bookings_extra_services_in_2019;
CREATE VIEW number_of_bookings_extra_services_in_2019 AS
    SELECT 
        extra_service_id, SUM(amount) AS number_of_bookings_in_2019
    FROM
        detailed_agreements da
            INNER JOIN
        agreements a ON da.agreement_id = a.agreement_id
    WHERE
        YEAR(a.starting_date) = 2019
    GROUP BY extra_service_id
    ORDER BY extra_service_id;
    
UPDATE extra_services 
SET 
    price = price * 2
WHERE
    extra_service_id IN (SELECT 
            extra_service_id
        FROM
            number_of_bookings_extra_services_in_2019
        WHERE
            number_of_bookings_in_2019 > 10);

/* ----------------------------------------------------------- */

/* ------------------------- Task 20 ------------------------- */
SELECT 
	'Customer' AS person_type,
    customer_id AS id,
    full_name,
    email,
    phone_number,
    birth_date,
    address
FROM
    customers 
UNION SELECT
	'Employee' AS person_type,
    employee_id,
    full_name,
    email,
    phone_number,
    birth_date,
    address
FROM
    employees;
    
/* ----------------------------------------------------------- */

/* ------------------------- Task 21 ------------------------- */

DROP VIEW IF EXISTS employee_view;

CREATE VIEW employee_view AS
    SELECT DISTINCT
        e.employee_id, e.full_name, e.id_number, e.birth_date, e.phone_number, e.address, 
        a.starting_date AS agreement_open_date
    FROM
        (employees e
        INNER JOIN agreements a ON e.employee_id = a.employee_id)
    WHERE
        e.address = 'Hai Chau'
            AND a.starting_date = '2019-12-12';
/* ----------------------------------------------------------- */

/* ------------------------- Task 22 ------------------------- */

UPDATE employees 
SET 
    address = 'Lien Chieu'
WHERE
    employee_id IN (SELECT
            employee_id
        FROM
            employee_view);

/* ----------------------------------------------------------- */

/* ------------------------- Task 23 ------------------------- */

INSERT INTO customers VALUES
	(14, 3, 'Quang Khang', '2006-02-06', '001 014 014', '0909014014', 'quangKhang@gmail.com', 'Binh Dinh');
    
INSERT INTO agreements VALUES
	(22, 1,	14,	2, '2021-04-01', '2021-10-01', 250, 1000);
    
INSERT INTO detailed_agreements VALUES
	(13, 22, 5, 3);

DROP PROCEDURE IF EXISTS delete_customer;

delimiter //
CREATE PROCEDURE delete_customer(id INT)
BEGIN
	SET foreign_key_checks = 0;
	DELETE agreements , detailed_agreements FROM agreements
	INNER JOIN detailed_agreements ON agreements.agreement_id = detailed_agreements.agreement_id 
	WHERE agreements.customer_id = id;
	SET foreign_key_checks = 1;
    
    DELETE FROM customers
	WHERE customer_id = id;
END //
delimiter ;

CALL delete_customer(14);
/* ----------------------------------------------------------- */

/* ------------------------- Task 23 ------------------------- */

delimiter //
create function check_valid_id(
		id int,
        `table_name` varchar(50)
)
returns bool
deterministic
begin
end //
delimiter ;
    

drop procedure if exists add_new_agreement;

delimiter //
create procedure add_new_agreement(employee_id int, customer_id int, service_id int,
	starting_date date, ending_date date, deposit double, total_money double)
begin
	-- get the next id for new agreement.
    declare next_agreement_id int;
    set next_agreement_id = (select
		max(agreement_id)
		from agreements) + 1;
        
	-- check parameter employee_id
    
end //
delimiter ;

call add_new_agreement();

/* ----------------------------------------------------------- */
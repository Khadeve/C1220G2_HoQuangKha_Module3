create database if not exists furama_resort;

use furama_resort;

/* -------- Tables related to employee -------- */

drop table if exists positions;
create table positions(
	position_id int primary key,
    position_name varchar(45),
    primary key(position_id)
);

alter table positions
	modify position_id int not null auto_increment;

insert into positions (position_name) values
    ('Information Technology'),
	('Human Resource'),
    ('Sales'),
    ('Security'),
    ('House Keeping'),
    ('General Manager');

drop table if exists academic_levels;
create table academic_levels(
	academic_level_id int primary key,
    academic_level varchar(45)
);

insert into academic_levels values
	(1, 'High school'),
    (2, 'Bachelor'),
    (3, 'Master');

drop table if exists departments;
create table departments(
	department_id int primary key,
    department_name varchar(45)
);

insert into departments values
	(1, 'Purchasing'),
	(2, 'Marketing'),
    (3, 'Maintenance'),
    (4, 'Human Resource Management'),
    (5, 'Accounting and Finance');

drop table if exists employees;
create table employees(
	employee_id int primary key,
    full_name varchar(50),
    position_id int,
    academic_level_id int,
    department_id int,
    birth_date date,
    id_number varchar(45),
    salary double,
    phone_number varchar(45),
    email varchar(45),
    address varchar(100),
    constraint fk_position
		foreign key(position_id) references positions(position_id),
	constraint fk_academic_level
		foreign key(academic_level_id) references academic_levels(academic_level_id),
	constraint fk_department
		foreign key(department_id) references departments(department_id)
);

alter table employees
	drop foreign key fk_position;

alter table employees
	add foreign key(position_id) references positions(position_id);
    
delete from employees;

insert into employees values
	(1, 'Kha Ho', 1, 2, 3, '1995-12-29', '123 456 789', 500.5, '0385449275', 'KhaHo@gmail.com', 'Da Nang'),
	(2, 'Hoai Do', 2, 2, 2, '1995-09-02', '456 123 789', 600, '0385444345', 'HoaiDo@gmail.com', 'Da Nang'),
	(3, 'Nhan Truong', 3, 2, 3, '1995-10-02', '456 789 123', 600, '0385555345', 'NhanTruong@gmail.com', 'Quang Tri'),
	(4, 'Nu Ai', 3, 2, 2, '1995-10-20', '000 789 123', 800, '0385555666', 'NuAi@gmail.com', 'Quy Nhon');

/* ------------------------------------------------ */

/* ------------ Tables related to customer ----------- */

drop table if exists types_of_customers;
create table types_of_customers(
	type_of_customer_id int primary key,
    type_of_customer varchar(45)
);

insert into types_of_customers values
	(1, 'member'), (2, 'silver'), (3, 'gold'), (4, 'platinum'), (5, 'diamond');

drop table if exists customers;
create table customers(
	customer_id int primary key,
    type_of_customer_id int,
    full_name varchar(45),
    birth_date date,
    id_number varchar(45),
    phone_number varchar(45),
    email varchar(45),
    address varchar(45),
    constraint fk_type_of_customer foreign key(type_of_customer_id)
		references types_of_customers(type_of_customer_id)
);

delete from customers;

insert into customers values
	(1, 1, 'Gia Dong', '1995-10-11', '011 011 011', '0911234567', 'giaDong@gmail.com', 'Da Nang'),
	(2, 2, 'Thanh Cong', '1991-07-20', '011 012 012', '0911234765', 'thanhCong@gmail.com', 'Quang Nam'),
	(3, 3, 'Van Thang', '1991-06-22', '011 013 013', '0911123765', 'vanThang@gmail.com', 'Da Nang'),
	(4, 4, 'Thanh Tai', '1994-05-05', '011 014 014', '0900123765', 'thanhTai@gmail.com', 'Quang Tri'),
	(5, 5, 'Thanh Hau', '1997-12-10', '011 015 015', '0911789456', 'thanhHau@gmail.com', 'Quang Nam');
    

/* -------------------------------------------------- */

/* ------------ Tables related to service ----------- */

drop table if exists types_of_rentals;
create table types_of_rentals(
	type_of_rental_id int primary key,
    type_of_rental varchar(45),
    price double
);

insert into types_of_rentals values
	(1, 'hours', 10),
	(2, 'days', 20),
	(3, 'months', 1000),
	(4, 'years', 25000);

drop table if exists types_of_services;
create table types_of_services(
	type_of_service_id int primary key,
    type_of_service varchar(45)
);

insert into types_of_services values
	(1, 'villa'),
    (2, 'house'),
    (3, 'room');

drop table if exists services;
create table services(
	service_id int primary key,
    service_name varchar(45),
    area double,
    number_of_floors int,
    largest_number_of_guests int,
    price double,
    type_of_rental_id int,
    type_of_service_id int,
    `status` varchar(45),
    constraint fk_type_of_rental foreign key(type_of_rental_id)
		references types_of_rentals(type_of_rental_id),
	constraint fk_type_of_service foreign key(type_of_service_id)
		references types_of_services(type_of_service_id)
);

insert into services values
	(1, 'Memory', 50, 1, 3, 250, 2, 3, 'available'),
	(2, 'Balcony', 155, 2, 4, 100, 3, 2, 'available'),
	(4, 'River wave villa', 230, 1, 7, 500, 1, 1, 'occupied');
    
update services
	set service_id = 3 where service_name = 'River wave villa';

/* -------------------------------------------------- */

/* ------------ Tables related to agreement ----------- */

drop table if exists agreements;
create table agreements(
	agreement_id int primary key,
    employee_id int,
    customer_id int,
    service_id int,
    starting_date date,
    ending_date date,
    deposit double,
    total_money double,
    
    constraint fk_employee foreign key(employee_id)
		references employees(employee_id),
	constraint fk_customer foreign key(customer_id)
		references customers(customer_id),
	constraint fk_service foreign key(service_id)
		references services(service_id)
);

insert into agreements values
	(1, 1, 1, 1, '2021-03-20', '2021-03-25', 250, 1250),
	(2, 2, 2, 2, '2021-03-20', '2021-04-20', 1000, 9000),
	(3, 3, 3, 3, '2021-03-25', '2021-03-25', 100, 250);

drop table if exists extra_services;
create table extra_services(
	extra_service_id int primary key,
    extra_service_name varchar(45),
    price double,
    unit int,
    status varchar(45)
);

insert into extra_services values
	(1, 'Massage', 20, 30, 'available'),
    (2, 'Karaoke', 50, 10, 'available'),
    (3, 'Bike tour', 25, 30, 'near full'),
    (4, 'Stream bath', 15, 50, 'near full'),
    (5, 'Swimming pool', 7, 2, 'available');

drop table if exists detailed_agreements;
create table detailed_agreements(
	detailed_agreement_id int primary key,
    agreement_id int,
    extra_service_id int,
    amount int not null,
    
    constraint fk_agreement foreign key(agreement_id)
		references agreements(agreement_id),
	constraint fk_extra_service foreign key(extra_service_id)
		references extra_services(extra_service_id)
);

insert into detailed_agreements values
	(1, 1, 4, 1),
    (2, 2, 3, 1),
    (3, 3, 5, 1);

/* -------------------------------------------------- */

/* ---------------------Task 2----------------------- */
delete from employees where employee_id = 5;

insert into employees values
	(5, 'Khang Ho Quang Ho Quang', 4, 3, 2, '2006-09-24', '001 111 111', 750, '0901000111', 'KhangHoQuang@gmail.com', 'Binh Dinh');

select employee_id, full_name, char_length(full_name) as length_of_name
	from employees
    where (char_length(full_name) <= 15)
    and (full_name like 'H%' or full_name like 'T%' or full_name like 'K%');

/* -------------------------------------------------- */

/* ---------------------Task 3----------------------- */

insert into customers values
	(6, 3, 'John Wick', '1965-10-11', '011 016 016', '0901234567', 'johnWick@gmail.com', 'Ha Noi');

set @min_age = 18, @max_age = 50;

select customer_id, full_name, birth_date, ceil((datediff(curdate(), birth_date) / 365)) as age, address
	from customers
	where (ceil((datediff(curdate(), birth_date) / 365) >= @min_age) and ceil((datediff(curdate(), birth_date) / 365)) <= @max_age)
    and (address = 'Da Nang' or address = 'Quang Tri');

/* -------------------------------------------------- */

/* ---------------------Task 4----------------------- */
insert into customers values
	(7, 5, 'Duc Hau', '1997-10-10', '011 017 017', '0910012456', 'ducHau@gmail.com', 'Da Nang'),
	(8, 5, 'Nha', '1995-03-25', '011 018 018', '0910012345', 'NhaMeo@gmail.com', 'Binh Dinh');
    
drop table if exists bookings;
create table bookings(
	booking_id int auto_increment primary key,
    customer_id int,
    service_id int,
    constraint fk_bookings_customer_id
		foreign key(customer_id) references customers(customer_id),
	constraint fk_bookings_service_id
		foreign key(service_id) references services(service_id)
);

insert into bookings (customer_id, service_id) values
	(1, 1), (5, 2), (1, 2),
    (7, 3), (8, 3), (5, 1),
    (6, 2), (7, 1), (7, 2);

select customer_id, count(customer_id) as number_of_bookings
	from bookings
    group by customer_id;

select bookings.customer_id, customers.full_name, count(bookings.customer_id) as number_of_bookings
	from bookings
    inner join customers on (bookings.customer_id = customers.customer_id and customers.type_of_customer_id = 5)
    group by bookings.customer_id
    order by count(bookings.customer_id);
/* -------------------------------------------------- */

/* ---------------------Task 5----------------------- */
select customers.customer_id, customers.full_name, types_of_customers.type_of_customer,
	agreements.agreement_id, services.service_name, agreements.starting_date, agreements.ending_date,
    (agreements.total_money + (extra_services.price * extra_services.unit)) as total_money
    from (((((customers left join types_of_customers on customers.type_of_customer_id = types_of_customers.type_of_customer_id)
		left join agreements on customers.customer_id = agreements.customer_id)
        left join services on agreements.service_id = services.service_id)
        left join detailed_agreements on agreements.agreement_id = detailed_agreements.agreement_id)
        left join extra_services on detailed_agreements.extra_service_id = extra_services.extra_service_id);
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
	WHERE a.starting_date < '2019-01-01';
    
/*-----------------------------------------------------------*/

/* ------------------------- Task 7 ------------------------- */
select a.service_id, s.service_name, s.area, s.largest_number_of_guests,
	s.price, tos.type_of_service
    from ((agreements a
    inner join services s on a.service_id = s.service_id)
    inner join types_of_services tos on  s.type_of_service_id = tos.type_of_service_id)
    where year(a.starting_date) = 2018 and
    a.service_id <> all (select service_id from agreements where year(starting_date) = 2019)
    order by s.service_id;
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
    
SELECT SUBSTRING(starting_date, 1, 7) AS `time`, COUNT(SUBSTRING(starting_date, 1, 7)) AS bookings_in_month
	FROM agreements
    WHERE starting_date LIKE '2021%'
    GROUP BY (SUBSTRING(starting_date, 1, 7));
/*-----------------------------------------------------------*/

/* ------------------------- Task 10 ------------------------- */
/*------------------------------------------------------------*/

/* ------------------------- Task 11 ------------------------- */
insert into customers values
	(11, 5, 'Thanh Tung', '1990-10-11', '011 111 111', '0901234000', 'thanhTung@gmail.com', 'Quang Ngai'),
	(12, 5, 'Duc', '1997-02-11', '011 112 112', '0901111000', 'duc@gmail.com', 'Vinh');
    
insert into agreements values
	(6, 4, 11, 4, '2021-02-10', '2021-02-15', 100, 900),
	(7, 2, 12, 3, '2021-02-10', '2021-02-13', 500, 1000);
    
insert into detailed_agreements values
	(4, 6, 3, 1),
    (5, 7, 4, 1);
    
select es.extra_service_name, es.price, es.unit,
	c.full_name as customer_name, c.customer_id, c.address, toc.type_of_customer
	from ((((extra_services es
	inner join detailed_agreements da on da.extra_service_id = es.extra_service_id)
    inner join agreements a on a.agreement_id = da.agreement_id)
    inner join customers c on c.customer_id = a.customer_id)
    inner join types_of_customers toc on toc.type_of_customer_id = c.type_of_customer_id)
    where toc.type_of_customer = 'diamond' and (c.address = 'Vinh' or c.address = 'Quang Ngai');
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

select a.agreement_id, tos.type_of_service, es.extra_service_name, nou.number_of_using
	from (((((agreements a
		inner join detailed_agreements da on a.agreement_id = da.agreement_id)
        inner join extra_services es on es.extra_service_id = da.extra_service_id)
        inner join services s on a.service_id = s.service_id)
        inner join types_of_services tos on tos.type_of_service_id = s.type_of_service_id)
        inner join number_of_using_extra_services nou on nou.extra_service_id = es.extra_service_id)
	where number_of_using = 1
    order by agreement_id;

/*-----------------------------------------------------------*/

/* ------------------------- Task 15 ------------------------- */

drop view if exists number_of_contacts_in_2018_of_employee;
create view number_of_contacts_in_2018_of_employee as
	select employee_id, count(employee_id) as number_of_contacts
     from agreements
     where year(starting_date) = 2018
     group by employee_id
     order by count(employee_id);
     
select e.employee_id, e.full_name, acl.academic_level, d.department_name,
	e.phone_number, e.address
    from employees e
		inner join academic_levels acl on acl.academic_level_id = e.academic_level_id
        inner join departments d on d.department_id = e.department_id
        inner join number_of_contacts_in_2018_of_employee noc on noc.employee_id = e.employee_id
	where noc.number_of_contacts in (1, 2, 3)
    order by employee_id;

/* ----------------------------------------------------------- */

/* ------------------------- Task 16 ------------------------- */
DROP VIEW IF EXISTS number_of_contacts_2017_to_2019_of_employee;
CREATE VIEW number_of_contacts_2017_to_2019_of_employee AS
	SELECT employee_id, COUNT(employee_id) AS number_of_contacts
		FROM agreements
        WHERE YEAR(starting_date) IN (2017, 2018)
        GROUP BY employee_id
        ORDER BY employee_id;
        
DELETE FROM employees
	WHERE employee_id NOT IN (SELECT employee_id FROM number_of_contacts_2017_to_2019_of_employee);
/* ----------------------------------------------------------- */
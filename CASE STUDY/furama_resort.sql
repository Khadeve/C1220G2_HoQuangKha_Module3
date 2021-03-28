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
    
alter table detailed_agreements
	modify amount double not null;

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
	agreements.agreement_id, services.service_name, agreements.starting_date, agreements.ending_date, agreements.total_money
    from (((customers inner join types_of_customers on customers.type_of_customer_id = types_of_customers.type_of_customer_id)
		inner join agreements on customers.customer_id = agreements.customer_id)
        inner join services on agreements.service_id = services.service_id);
/* -------------------------------------------------- */
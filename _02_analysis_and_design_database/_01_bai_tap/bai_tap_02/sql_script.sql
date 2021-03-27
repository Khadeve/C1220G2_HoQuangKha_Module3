create database if not exists car_shop;

use car_shop;

drop table if exists customers;
create table customers(
	customer_number int primary key,
    customer_company_name varchar(50) not null,
    contact_last_name varchar(50) not null,
    contact_first_name varchar(50) not null,
    phone_number varchar(50) not null,
    address_line_1 varchar(50) not null,
    address_line_2 varchar(50),
    city varchar(50) not null,
    state varchar(50) not null,
    postal_code varchar(15) not null,
    country varchar(50) not null,
    credit_limit double
);

drop table if exists orders;
create table orders(
	order_number int primary key,
    order_date date not null,
    required_date date not null,
    shipped_date date,
    `status` varchar(15) not null,
    `comment` text,
    quantity_ordered int not null,
    price_each double not null,
    customer_number int,
    constraint fk_customer_order
		foreign key(customer_number) references customers(customer_number)
);

drop table if exists payments;
create table payments(
	customer_number int,
    check_number varchar(50) not null,
    payment_date date not null,
    amount double not null,
    constraint fk_customer_payment
		foreign key(customer_number) references customers(customer_number)
);

drop table if exists product_lines;
create table product_lines(
	product_line varchar(50) primary key,
    text_description text,
    image varchar(255)
);


drop table if exists products;
create table products(
	product_code varchar(15) primary key,
    product_name varchar(70) not null,
    product_scale varchar(10) not null,
    product_vendor varchar(50) not null,
    product_description text not null,
    quantity_in_stock int not null,
    buy_price double not null,
    selling_price double not null,
    product_line varchar(50),
    constraint fk_product_line
		foreign key(product_line) references product_lines(product_line)
);

drop table if exists orders_contain_products;
create table orders_contain_products(
	order_number int,
    product_code varchar(15),
    primary key(order_number, product_code),
    constraint fk_order
		foreign key(order_number) references orders(order_number),
	constraint fk_product
		foreign key(product_code) references products(product_code)
);

drop table if exists job_title;
create table job_title(
	id int not null,
    job_name varchar(50) not null,
    primary key(id)
);

drop table if exists managers;
create table managers(
	manager_number int primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(100) not null,
    number_of_employees int not null
);

drop table if exists offices;
create table offices(
	office_code varchar(10) primary key,
    city varchar(50) not null,
    phone_number varchar(50) not null,
    address_line_1 varchar(50) not null,
    address_line_2 varchar(50),
    state varchar(50),
    country varchar(50) not null,
    postal_code varchar(15) not null
);

drop table if exists employees;
create table employees(
	employee_number int primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(100) not null,
    job_title_id int not null,
    manager_number int,
    office_code varchar(10),
    constraint fk_job_title
		foreign key(job_title_id) references job_title(id),
	constraint fk_manager
		foreign key(manager_number) references managers(manager_number),
	constraint fk_office
		foreign key(office_code) references offices(office_code)
);


create database if not exists thuc_hanh_03;

use thuc_hanh_03;

create table customers(
	id int auto_increment primary key,
    `name` varchar(50) not null,
    address varchar(255),
    email varchar(255)
);

create table orders(
	id int auto_increment primary key,
    staff varchar(50),
    customers_id int,
    foreign key(customers_id) references customers(id)
);


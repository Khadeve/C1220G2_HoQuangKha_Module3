create database if not exists thuc_hanh_02;

use thuc_hanh_02;

create table users (
	user_id int auto_increment primary key,
    username varchar(50),
    `password` varchar(255),
    email varchar(255)
);

create table roles (
	role_id int auto_increment,
    role_name varchar(50),
    primary key(role_id)
);

create table user_roles (
	user_id int not null,
    role_id int not null,
    primary key(user_id, role_id),
    foreign key(user_id) references users(user_id),
    foreign key(role_id) references roles(role_id)
);
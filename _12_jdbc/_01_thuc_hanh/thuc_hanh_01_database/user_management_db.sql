create database if not exists user_management_db;
use user_management_db;

create table users (
	id int not null auto_increment,
    `name` varchar(50) not null,
    email varchar(50) not null,
    country varchar(50),
    primary key (id)
);

insert into users(`name`, email, country) values
	('Khang Ho', 'khangHo@gmail.com', 'Viet Nam'),
    ('John Wick', 'johnWick@gmail.com', 'USA'),
    ('Oshuka Mura', 'oshukaMura@gmail,com', 'Japan');
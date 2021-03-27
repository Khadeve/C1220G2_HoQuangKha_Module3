create database if not exists bank_account;

use bank_account;

drop table if exists customers;

create table customers(
	customer_number int primary key,
    full_name varchar(50) not null,
    address varchar(255) not null,
    email varchar(255),
    phone_number varchar(20)
);


drop table if exists accounts;

create table accounts(
	account_number int primary key,
    account_type varchar(50) not null,
    activation_date date not null,
    balance double not null,
    customer_number int,
    constraint fk_customer_number
		foreign key(customer_number) references customers(customer_number)
);

drop table if exists transactions;

create table transactions(
	tran_number int primary key,
    account_number int not null,
    transaction_date date not null,
    amount double not null,
    constraint fk_account_number
		foreign key(account_number) references accounts(account_number)
);
create database if not exists furama_database_web;

use furama_database_web;

-- ------------------------ employee table -------------------------------  
create table position (
	position_id int,
    position_name varchar(45),
    primary key (position_id)
);

create table education_degree (
	education_degree_id int,
    education_degree_name varchar(45),
    primary key (education_degree_id)
);

create table division (
	division_id int,
    division_name varchar(45),
    primary key (division_id)
);

set foreign_key_checks = 0;
set foreign_key_checks = 1;


drop table if exists employee;
create table employee (
	employee_id int not null auto_increment,
    employee_name varchar(45) not null,
    employee_birthday date not null,
    employee_id_card varchar(45) not null,
    employee_salary double not null,
    employee_phone varchar(45) not null,
    employee_email varchar(45),
    employee_address varchar(45),
    position_id int,
    education_degree_id int,
    division_id int,
    username varchar(255),
    
    primary key (employee_id),
    
    constraint fk_employee_id
    foreign key (position_id) references position (position_id) on delete cascade,
    
    constraint fk_education_degree_id
    foreign key (education_degree_id) references education_degree (education_degree_id) on delete cascade,
    
    constraint fk_division_id
    foreign key (division_id) references division (division_id) on delete cascade,
    
    constraint fk_employee_username
    foreign key (username) references `user` (username) on delete cascade
);

-- -----------------------------------------------------------------------

-- ---------------------------- user role -----------------------------------

drop table if exists `role`;
create table `role` (
	role_id int not null auto_increment,
    role_name varchar(255),
    primary key (role_id)
);

drop table if exists `user`;
create table `user` (
	username varchar(255) not null,
    `password` varchar(255),
    primary key (username)
);

drop table if exists `user_role`;
create table user_role (
	role_id int not null,
    username varchar(255) not null,
    primary key (role_id, username),
    
    constraint fk_role_id
    foreign key (role_id) references `role`(role_id) on delete cascade,
    
    constraint fk_username
    foreign key (username) references `user`(username) on delete cascade
);

-- --------------------------------------------------------------------------

-- ------------------------ customer table -------------------------------  
create table customer_type (
	customer_type_id int not null auto_increment,
    customer_type_name varchar(45),
    primary key (customer_type_id)
);

set foreign_key_checks = 1;

drop table if exists customer;
create table customer (
	customer_id int not null auto_increment,
    customer_type_id int not null,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_gender boolean not null,
    customer_id_card varchar(45) not null,
    customer_phone varchar(45) not null,
    customer_email varchar(45),
    customer_address varchar(45),
    
    primary key (customer_id),
    
    constraint fk_customer_type_id
    foreign key (customer_type_id) references customer_type(customer_type_id) on delete cascade
);

-- --------------------------------------------------------------------------

-- ---------------------------- service -------------------------------------

create table service_type (
	service_type_id int not null auto_increment,
    service_type_name varchar(45),
    primary key (service_type_id)
);

create table rent_type (
	rent_type_id int not null auto_increment,
    rent_type_name varchar(45),
    rent_type_cost double,
    primary key (rent_type_id)
);

drop table if exists service;
create table service (
	service_id int not null auto_increment,
    service_name varchar(45) not null,
    service_area double,
    service_cost double not null,
    service_max_people int,
    rent_type_id int not null,
    service_type_id int not null,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    
    primary key (service_id),
    
    constraint fk_rent_type_id
    foreign key (rent_type_id) references rent_type (rent_type_id) on delete cascade,
    
    constraint fk_service_type_id
    foreign key (service_type_id) references service_type (service_type_id) on delete cascade
);

-- --------------------------------------------------------------------------

-- ---------------------------- contract -------------------------------------

drop table if exists contract;
create table contract (
	contract_id int not null auto_increment,
    contract_start_date datetime not null,
    contract_end_date datetime not null,
    contract_deposit double not null,
    contract_total_money double not null,
    employee_id int not null,
    customer_id int not null,
    service_id int not null,
    
    primary key (contract_id),
    
    constraint fk_contract_employee_id
    foreign key (employee_id) references employee (employee_id) on delete cascade,
    
    constraint fk_contract_customer_id
    foreign key (customer_id) references customer (customer_id) on delete cascade,
    
    constraint fk_contract_service_id
    foreign key (service_id) references service (service_id) on delete cascade
);

create table attach_service (
	attach_service_id int not null auto_increment,
    attach_service_name varchar(45) not null,
    attach_service_cost double not null,
    attach_service_unit int not null,
    attach_service_status varchar(45),
    
    primary key (attach_service_id)
);

create table contract_detail (
	contract_detail_id int not null auto_increment,
    contract_id int not null,
    attach_service_id int not null,
    quantity int not null,
    
    primary key (contract_detail_id),
    
    constraint fk_contract_id
    foreign key (contract_id) references contract (contract_id) on delete cascade,
    
    constraint fk_attach_service_id
    foreign key (attach_service_id) references attach_service (attach_service_id) on delete cascade
);

-- ---------------------------------------------------------------------------



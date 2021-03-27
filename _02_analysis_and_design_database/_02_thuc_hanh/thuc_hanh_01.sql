create database if not exists thuc_hanh_01;

use thuc_hanh_01;

create table contacts (
	contact_id int not null auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    birthday date,
    constraint pk_contact primary key (contact_id)
);

create table suppliers (
	supplier_id int not null auto_increment,
    supplier_name varchar(50) not null,
    account_rep varchar(50) not null default 'TBD',
    constraint pk_supplier primary key (supplier_id)
);

insert into suppliers
values
(1,'Microsoft', 'MCS');

insert into suppliers (supplier_name)
values ('Amazon');

insert into suppliers(supplier_name, account_rep)
values
('Facebook', 'FB'),
('Google', 'GG');

alter table suppliers
	add Country varchar(30) not null default 'USA';

alter table suppliers
	modify Country varchar(30) not null; 

alter table suppliers
	drop column Country;

alter table suppliers
	change column supplier_name provider_name
		varchar(25) not null;
        
alter table suppliers
	rename to providers;

drop table contacts;

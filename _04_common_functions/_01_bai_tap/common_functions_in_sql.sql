create database if not exists common_functions_in_sql;
use common_functions_in_sql;

drop table if exists students;
create table students(
	id int not null,
    full_name varchar(50) not null,
    age int not null,
    course varchar(50),
    fee int
);

insert into students values
	(1, 'Hoang', 21, 'CNTT', 400000),
	(2, 'Viet', 19, 'DTVT', 320000),
	(3, 'Thanh', 18, 'KTDN', 400000),
	(4, 'Nhan', 19, 'CK', 450000),
	(5, 'Nhan', 20, 'TCNH', 500000),
	(5, 'Nhan', 20, 'TCNH', 200000);
    
update students
	set full_name = 'Huong'
    where id = 5;

select * from students
	where full_name = 'Huong';
    
select id, full_name, sum(fee) as summary_fee
	from students
    where full_name = 'Huong';
    
select distinct full_name from students;
    
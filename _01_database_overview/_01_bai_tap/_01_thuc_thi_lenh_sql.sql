create database employee_management;

use employee_management;

create table employee (
	id int primary key,
	fullName varchar(50),
    dayOfBirth date
);

insert into employee
values
(2, 'Quang Khang', '2006/09/24');

insert into employee
values
(1, 'Quang Kha', '1995/12/29'),
(3, 'Viet Hoai', '1995/09/02'),
(4, 'Trong Nhan', '1995/02/22');

select id, fullName
from employee;

-- delete from employee
-- where dayOfBirth = '1995/12/29';

select * from employee
where fullName like '%ng';

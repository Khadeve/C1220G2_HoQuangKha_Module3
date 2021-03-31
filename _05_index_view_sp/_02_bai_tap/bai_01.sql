create database if not exists index_view_sp_bai_tap;
use index_view_sp_bai_tap;

drop table if exists products;
create table products(
	id int auto_increment primary key,
    product_code varchar(50),
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description text,
    product_status varchar(10)
);

create index idx_product_code
	on products(product_code);
    
create index idx_product_name_price
	on products(product_name, product_price);

drop view if exists view_product_1;
create view view_product_1 as
	select product_code, product_name, product_price, product_status
    from products;

drop procedure if exists get_all_products;
delimiter //
create procedure get_all_product()
begin
	select * from products;
end;
// delimiter ;

drop procedure if exists add_new_product;
delimiter //
create procedure add_new_product (product_code varchar(50), product_name varchar(50),
product_price double, product_amount int, product_description text, product_status varchar(10))
begin
	insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
		values
		(product_code, product_name, product_price, product_amount, product_description, product_status);
end;
// delimiter ;

call add_new_product('111', 'shampoo', 10.5, 5, 'night use only', 'available');

drop procedure if exists delete_existing_product;
delimiter //
create procedure delete_existing_product (id int)
begin
	delete from products where product_id = id;
end;
// delimiter ;


	
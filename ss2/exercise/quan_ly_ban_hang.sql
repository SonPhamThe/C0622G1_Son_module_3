drop database if exists CSDL_quan_ly_ban_hang;
create database CSDL_quan_ly_ban_hang;
use CSDL_quan_ly_ban_hang;
create table customer(
customer_id int primary key,
`name` varchar(45),
age int
);
create table `order`(
order_id int primary key,
customer_id int,
date_order datetime,
total_price double,
foreign key(customer_id) references customer(customer_id)
);
create table `product`(
product_id int primary key,
`name` varchar(45),
price double
);
create table order_detail(
order_id int ,
product_id int,
number_of_order int,
primary key(order_id,product_id),
foreign key(order_id) references `order`(order_id),
foreign key(product_id) references `product`(product_id)
);
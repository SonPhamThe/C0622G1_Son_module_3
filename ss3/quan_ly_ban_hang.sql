DROP DATABASE IF EXISTS quan_ly_ban_hang;
CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer(
c_id INT AUTO_INCREMENT PRIMARY KEY,
c_name VARCHAR(25),
c_age TINYINT
);
CREATE TABLE `order`(
o_id INT AUTO_INCREMENT PRIMARY KEY,
C_id INT,
o_date DATETIME,
o_total_price INT,
FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
CREATE TABLE product(
p_id INT AUTO_INCREMENT PRIMARY KEY,
p_name VARCHAR(25),
p_price INT 
);
CREATE TABLE order_detail(
o_id INT,
p_id INT,
od_qty INT,
PRIMARY KEY(o_id,p_id),
FOREIGN KEY(o_id) REFERENCES `order`(o_id),
FOREIGN KEY(p_id) REFERENCES product(p_id)
);
INSERT INTO customer VALUES (1,"Minh Quan",10),(2,"Ngoc Oanh",20),(3,"Hong Ha",50);
INSERT INTO `order` VALUES (1,1,'2006-3-21',NULL),(2,2,'2006-3-23',NULL),(3,1,'2006-3-16',NULL);
INSERT INTO product VALUES (1,"May Giat",3),(2,"Tu Lanh",5),(3,"DIeu Hoa",7),(4,"Quat",1),(5,"Bep DIen",2);
INSERT INTO order_detail VALUES (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
SELECT o_id, o_date, o_total_price  FROM `order` ;
SELECT c.c_id, c.c_name, p.p_name FROM customer c 
JOIN `order` o ON c.c_id = o.c_id 
JOIN order_detail od ON o.o_id = od.o_id 
JOIN product p ON od.p_id = p.p_id;
SELECT c_name FROM customer WHERE c_id NOT IN (SELECT o.c_id FROM `order` o);
SELECT o.o_id, o.o_date,SUM(od.od_qty * p.p_price) AS total_price_order FROM `order` o JOIN order_detail od ON o.o_id = od.o_id JOIN product p ON p.p_id = od.p_id GROUP BY o.o_id;  
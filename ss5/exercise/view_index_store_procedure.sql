DROP DATABASE IF EXISTS exercise_view_index_store_procedure;
CREATE DATABASE exercise_view_index_store_procedure;
USE exercise_view_index_store_procedure;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(45),
    product_name VARCHAR(45),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(45),
    product_status BIT
);
INSERT INTO products(id,product_code,product_name,product_price,product_amount,product_description,product_status) 
VALUES (1,"VL123","Đá",235689,5,"cứng",1),
       (2,"VL1234","xi măng",455689,8,"mềm",1),
	   (3,"VL12345","cát",685689,3,"mịn",0);
-- tạo chi mục unique index
CREATE UNIQUE INDEX unique_index_products ON products(product_code); 
-- tạo chỉ mục composite index
CREATE INDEX composite_index_products ON products(product_name,product_price);
-- sử dụng explain để hiển thị
EXPLAIN SELECT * FROM products;
-- tạo view lấy thông tin
CREATE VIEW product_view AS SELECT product_code, product_name, product_price, product_status FROM products;
-- sửa đổi view 
CREATE OR REPLACE VIEW product_view AS SELECT product_code, product_name, product_price, product_status FROM products WHERE product_name = "nước";
-- xóa view 
DROP VIEW product_view;
-- tạo store procedure lấy tất cả thông tin của product
delimiter //
CREATE PROCEDURE sp_product()
BEGIN
SELECT * FROM products; 
END //
delimiter ; 
-- gọi store procedure 
CALL sp_product();
-- tạo store procedure thêm một sản phẩm mới
delimiter //
CREATE PROCEDURE sp_product_add()
BEGIN
ALTER TABLE products ADD COLUMN address VARCHAR(25);
SELECT * FROM products;
END //
delimiter ; 
-- gọi store procedure để thêm
CALL sp_product_add;
-- tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE sp_product_edit()
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE products SET product_name = "Vinh Heo" WHERE id = 1;
SELECT * FROM products;
END //
delimiter ; 
-- gọi store procedure để chỉnh sửa
CALL sp_product_edit;
-- tạo store procedure để xóa
delimiter //
CREATE PROCEDURE sp_product_delete()
BEGIN
delete from products where id = 1;
SELECT * FROM products;
END //
delimiter ; 
-- gọi store procedure để xóa 
CALL sp_product_delete;
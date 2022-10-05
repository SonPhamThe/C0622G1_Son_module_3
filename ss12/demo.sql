DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;

CREATE TABLE users (
id INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
country VARCHAR(45)
);

CREATE TABLE permision (
id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE user_permision(
user_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
permision_id INT(11)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

SELECT * FROM users WHERE name LIKE "Minh";
SELECT * FROM users WHERE country LIKE "Viet Nam";
SELECT * FROM users ORDER BY name;

DELIMITER //
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
SELECT u.name, u.email, u.country 
FROM users u
WHERE u.id = user_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insert_user (
IN user_name VARCHAR(50),
IN user_email VARCHAR(50),
IN user_country VARCHAR(50)
)
BEGIN 
INSERT INTO users(name,email,country) VALUES(user_name, user_email, user_country);
END //
DELIMITER ;

insert into permision(id, name) values(1, 'add');

insert into permision(id, name) values(2, 'edit');

insert into permision(id, name) values(3, 'delete');

insert into permision(id, name) values(4, 'view');

-- display list users
DELIMITER //
CREATE PROCEDURE display_list_users()
BEGIN
SELECT * FROM users;
END //
DELIMITER ;

-- delete users
DELIMITER //
CREATE PROCEDURE delete_user(IN user_id INT)
BEGIN
DELETE FROM users WHERE users.id = user_id;
END //
DELIMITER ;

-- edit users 
DELIMITER //
drop PROCEDURE if EXISTS edit_user;
CREATE PROCEDURE edit_user(
IN user_id int,
IN user_name VARCHAR(50),
IN user_email VARCHAR(50),
IN user_country VARCHAR(50)
)
BEGIN
UPDATE users 
SET users.name = user_name, users.email = user_email , users.country = user_country
where users.id = user_id;
END //
DELIMITER ;

select * from users;

call edit_user(3, 'sang', 's@gmail.com', 'usa');

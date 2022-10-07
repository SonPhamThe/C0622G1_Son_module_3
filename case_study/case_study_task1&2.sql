DROP DATABASE IF EXISTS case_study;
CREATE DATABASE case_study;
USE case_study;
CREATE TABLE `position`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);
CREATE TABLE education_degree (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);
CREATE TABLE division (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);
CREATE TABLE `role` (
role_id INT PRIMARY KEY AUTO_INCREMENT,
role_name VARCHAR(255)
);
CREATE TABLE `user`(
username VARCHAR(255) PRIMARY KEY ,
`password` VARCHAR(255)
);
CREATE TABLE user_role (
role_id INT NOT NULL ,
CONSTRAINT fk_htk_role_id
FOREIGN KEY (role_id)
REFERENCES `role`(role_id)
ON UPDATE CASCADE,
username VARCHAR(255),
CONSTRAINT fk_htk_username_role
FOREIGN KEY (username)
REFERENCES `user`(username)
ON UPDATE CASCADE
);
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    id_card VARCHAR(45),
    salary DOUBLE,
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    position_id INT NOT NULL,
	CONSTRAINT fk_htk_position_id
	FOREIGN KEY (id)
	REFERENCES `position`(id)
    ON UPDATE CASCADE,
    education_degree_id INT NOT NULL,
    CONSTRAINT fk_htk_education_degree_id
	FOREIGN KEY (education_degree_id)
	REFERENCES education_degree(id)
    ON UPDATE CASCADE,
    division_id INT NOT NULL,
    CONSTRAINT fk_htk_division_id
	FOREIGN KEY (division_id)
	REFERENCES division(id)
    ON UPDATE CASCADE,
    username VARCHAR(255),
    CONSTRAINT fk_htk_username
    FOREIGN KEY (username)
    REFERENCES `user`(username)
    ON UPDATE CASCADE
);
CREATE TABLE customer_type(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45)
);
CREATE TABLE facility_type(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45)
);
CREATE TABLE rent_type(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45)
);
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45),
	date_of_birth DATE,
	gender BIT(1),
	id_card VARCHAR(45),
	phone_number VARCHAR(45),
	email VARCHAR(45),
	address VARCHAR(45),
    customer_type_id INT NOT NULL,
    CONSTRAINT fk_htk_customer_type_id
	FOREIGN KEY (id)
	REFERENCES customer_type(id)
    ON UPDATE CASCADE
);

CREATE TABLE attach_facility(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45),
	cost DOUBLE,
	unit VARCHAR(10),
    `status` VARCHAR(45)
);

CREATE TABLE facility(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45),
	area INT,
    cost DOUBLE,
	max_people INT,
	standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floors INT,
    facility_free TEXT,
	rent_type_id INT NOT NULL,
	CONSTRAINT fk_htk_rent_type_id
	FOREIGN KEY (id)
	REFERENCES rent_type(id)
    ON UPDATE CASCADE,
	facility_type_id INT NOT NULL,
	CONSTRAINT fk_htk_facility_type_id
	FOREIGN KEY (id)
	REFERENCES facility_type(id)
    ON UPDATE CASCADE
);

CREATE TABLE contract(
	id INT PRIMARY KEY AUTO_INCREMENT,
	start_date DATETIME,
	end_date DATETIME,
	deposit DOUBLE,
	employee_id INT NOT NULL,
    CONSTRAINT fk_htk_employee_id
	FOREIGN KEY (id)
	REFERENCES employee(id)
    ON UPDATE CASCADE,
	customer_id INT NOT NULL,
	CONSTRAINT fk_htk_customer_id 
	FOREIGN KEY (id)
	REFERENCES customer(id)
    ON UPDATE CASCADE,
	facility_id INT NOT NULL,
    CONSTRAINT fk_htk_facility_id 
	FOREIGN KEY (id)
	REFERENCES facility(id)
    ON UPDATE CASCADE
);
CREATE TABLE contract_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
	contract_id INT NOT NULL,
    CONSTRAINT fk_htk_contract_id
	FOREIGN KEY (id)
	REFERENCES contract(id)
    ON UPDATE CASCADE,
	attach_facility_id INT NOT NULL,
    CONSTRAINT fk_htk_attach_facility_id 
	FOREIGN KEY (id )
	REFERENCES attach_facility(id )
    ON UPDATE CASCADE
);
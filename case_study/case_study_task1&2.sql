DROP DATABASE IF EXISTS case_study;
CREATE DATABASE case_study;
USE case_study;
CREATE TABLE position (
    id_position INT PRIMARY KEY AUTO_INCREMENT,
    name_position VARCHAR(45)
);
CREATE TABLE education_degree (
    id_education_degree INT PRIMARY KEY AUTO_INCREMENT,
    name_education_degree VARCHAR(45)
);
CREATE TABLE division (
    id_division INT PRIMARY KEY AUTO_INCREMENT,
    name_division VARCHAR(45)
);
CREATE TABLE employee (
    id_employee INT PRIMARY KEY,
    name_employee VARCHAR(45),
    date_of_birth_employee DATE,
    id_card_employee VARCHAR(45),
    salary_employee DOUBLE,
    phone_number_employee VARCHAR(45),
    email_employee VARCHAR(45),
    address_employee VARCHAR(45),
    id_position INT NOT NULL,
	CONSTRAINT fk_htk_id_position
	FOREIGN KEY (id_position)
	REFERENCES `position`(id_position),
    id_education_degree INT NOT NULL,
    CONSTRAINT fk_htk_id_education_degree
	FOREIGN KEY (id_education_degree)
	REFERENCES education_degree(id_education_degree),
    id_division INT NOT NULL,
    CONSTRAINT fk_htk_id_division
	FOREIGN KEY (id_division)
	REFERENCES division(id_division)
);
CREATE TABLE customer_type(
	id_customer_type INT PRIMARY KEY AUTO_INCREMENT,
	name_customer_type VARCHAR(45)
);
CREATE TABLE facility_type(
	id_facility_type INT PRIMARY KEY AUTO_INCREMENT,
	name_facility_type VARCHAR(45)
);
CREATE TABLE rent_type(
	id_rent_type INT PRIMARY KEY AUTO_INCREMENT,
	name_rent_type VARCHAR(45)
);
CREATE TABLE customer(
	id_customer INT PRIMARY KEY,
	name_customer VARCHAR(45),
	date_of_birth_customer DATE,
	gender_customer BIT(1),
	id_card_customer VARCHAR(45),
	phone_number_customer VARCHAR(45),
	email_customer VARCHAR(45),
	address_customer VARCHAR(45),
	id_customer_type INT NOT NULL,
    CONSTRAINT fk_htk_id_customer_type
	FOREIGN KEY (id_customer_type)
	REFERENCES customer_type(id_customer_type)
);

CREATE TABLE attach_facility(
	id_attach_facility INT PRIMARY KEY,
	name_attach_facility VARCHAR(45),
	cost_attach_facility DOUBLE,
	unit_attach_facility VARCHAR(10),
    status_attach_facility VARCHAR(45)
);

CREATE TABLE facility(
	id_facility INT PRIMARY KEY,
	name_facility VARCHAR(45),
	area_facility INT,
    cost_facility DOUBLE,
	max_people_facility INT,
	standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floors INT,
    facility_free TEXT,
	id_rent_type INT NOT NULL,
	CONSTRAINT fk_htk_id_rent_type
	FOREIGN KEY (id_rent_type)
	REFERENCES rent_type(id_rent_type),
	id_facility_type INT NOT NULL,
	CONSTRAINT fk_htk_id_facility_type
	FOREIGN KEY (id_facility_type)
	REFERENCES facility_type(id_facility_type)
);

CREATE TABLE contract(
	id_contract INT PRIMARY KEY,
	start_date DATETIME,
	end_date DATETIME,
	deposit DOUBLE,
	id_employee INT NOT NULL,
    CONSTRAINT fk_htk_id_employee
	FOREIGN KEY (id_employee)
	REFERENCES employee(id_employee),
	id_customer INT NOT NULL,
	CONSTRAINT fk_htk_id_customer 
	FOREIGN KEY (id_customer )
	REFERENCES customer(id_customer),
	id_facility  INT NOT NULL,
    CONSTRAINT fk_htk_id_facility 
	FOREIGN KEY (id_facility)
	REFERENCES facility(id_facility)
);
CREATE TABLE contract_detail(
	id_contract_detail INT PRIMARY KEY,
    quantity INT,
	id_contract INT NOT NULL,
    CONSTRAINT fk_htk_id_contract
	FOREIGN KEY (id_contract)
	REFERENCES contract(id_contract),
	id_attach_facility INT NOT NULL,
    CONSTRAINT fk_htk_id_attach_facility
	FOREIGN KEY (id_attach_facility)
	REFERENCES attach_facility(id_attach_facility)
);
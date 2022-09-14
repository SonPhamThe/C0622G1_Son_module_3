DROP DATABASE IF EXISTS student_practice;
CREATE DATABASE student_pratice;
USE student_pratice;
CREATE TABLE class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(20),
    start_date DATE,
    `status` BIT
);
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(20),
    addrees VARCHAR(20),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT
);
CREATE TABLE subject (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(20),
    credit INT,
    `status` BIT
);
CREATE TABLE mark (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_id INT,
    student_id INT,
    mark INT,
    exam_times INT
);
-- thêm dữ liệu
INSERT INTO class VALUES(1,"A1","2008-12-20",1),(2,"A2","2008-12-22",1);
INSERT INTO student VALUES(1,"Hung","Ha Noi","0912113113",1,1);
INSERT INTO `subject` VALUES(1,"CF",5,1);
INSERT INTO mark VALUES(1,1,1,8,1);
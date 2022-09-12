drop database if exists student_management_exercise;
create database student_management_exercise;
use student_management_exercise;
CREATE TABLE class (
  `id` int primary key,
  `name` varchar(45)
);
CREATE TABLE student (
  `id` int primary key,
  `name` varchar(45),
  `age` int,
  `country` varchar(45)
);
CREATE TABLE teacher (
  `idt` int primary key,
  `name` varchar(45),
    `age` int,
  `country` varchar(45)
);
insert into student(id,name,age,country)
values(1,"son",18,"vietnam");
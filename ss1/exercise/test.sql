create database if not exists exercise_test;
use exercise_test;
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
-- Hiển thị toàn bộ dữ liệu bảng studdent
select * from student;
-- Thêm dữ liệu vào bảng
insert into student values (3,"sơn",17,"đà nẵng"),(4,"vinh",17,"sài gòn"),(5,"danh",17,"huế");
-- Chỉnh sửa bản ghi
set SQL_SAFE_UPDATES = 0;
update student set age = 20 where name = "sơn";
-- thêm cột cho bảng
alter table student add column address varchar(45) after age;
-- xóa cột
alter table student drop column country;
-- xóa dữ liệu theo id
delete from student where id = 2 or id = 3;
-- xóa bảng
drop table student;
drop database exercise_test;

-- 2 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
select  s.name, s.birthday from student s
union
select  i.name,i.birthday from instructor i;
select count(*) from
(select s.name as s_name
from student s 
left join class c on s.class_id = c.id
union all
select s.name as s_name
from student s 
right join class c on s.class_id = c.id) as tem;

-- 6 tìm  những gv chưa từng tham gia giảng dạy;
select i.name
from instructor_class ic
right join instructor i on ic.instructor_id=i.id
where ic.instructor_id is null;
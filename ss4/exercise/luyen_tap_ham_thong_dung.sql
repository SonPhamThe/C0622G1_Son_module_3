DROP DATABASE IF EXISTS luyen_tap_ham_thong_dung;
CREATE DATABASE luyen_tap_ham_thong_dung;
USE luyen_tap_ham_thong_dung;
CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `status` BIT
);
CREATE TABLE student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
CREATE TABLE `subject` (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    `status` BIT DEFAULT 1
);

CREATE TABLE mark (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES subject (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);
INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 3);
INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
SELECT 
    sub.sub_id, sub.sub_name, MAX(credit)
FROM
    `subject` sub
GROUP BY sub.sub_id , sub.sub_name
HAVING MAX(credit) >= ALL (SELECT 
        MAX(credit)
    FROM
        `subject` sub
    GROUP BY sub.sub_id , sub.sub_name);
SELECT 
    sub.sub_name, sub.sub_id, MAX(mark)
FROM
    mark m
        JOIN
    `subject` sub ON m.sub_id = sub.sub_id
GROUP BY sub.sub_name , sub.sub_id
HAVING MAX(mark) >= ALL (SELECT 
        MAX(mark)
    FROM
        mark
    GROUP BY sub.sub_name , sub.sub_id);SELECT 
    sub.sub_name, sub.sub_id, MAX(mark)
FROM
    mark m
        JOIN
    `subject` sub ON m.sub_id = sub.sub_id
GROUP BY sub.sub_name , sub.sub_id
HAVING MAX(mark) >= ALL (SELECT 
        MAX(mark)
    FROM
        mark
    GROUP BY sub.sub_name , sub.sub_id);
SELECT 
    s.student_id, s.student_name, AVG(mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name
ORDER BY (AVG(mark)) DESC;
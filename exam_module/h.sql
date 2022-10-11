DROP DATABASE IF EXISTS phong_tro;
CREATE DATABASE phong_tro;
USE phong_tro;
CREATE TABLE `phong_tro`.`chi_tiet_so_dien_thoai` (
  `ma_dien_thoai` VARCHAR(45) PRIMARY KEY NOT NULL,
 `so_dien_thoai` VARCHAR(45)
 );
  
CREATE TABLE `phong_tro`.`hinh_thuc_thanh_toan` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
  `name` VARCHAR(50)
  );
  
CREATE TABLE `phong_tro`.`nguoi_thue` (
  `id_card` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` VARCHAR(45)
  );

CREATE TABLE `phong_tro`.`phong_tro_thue` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ma_dien_thoai` VARCHAR(45),
  `ngay_bat_dau_thue` DATETIME,
  `ma_hinh_thuc_thanh_toan` INT,
  id_card INT,
  `ghi_chu` VARCHAR(45),
  FOREIGN KEY (`ma_dien_thoai`) REFERENCES chi_tiet_so_dien_thoai (`ma_dien_thoai`),
  FOREIGN KEY (ma_hinh_thuc_thanh_toan) REFERENCES hinh_thuc_thanh_toan (`id`),
  FOREIGN KEY (id_card) REFERENCES nguoi_thue (id_card)
  );
INSERT INTO `phong_tro`.`chi_tiet_so_dien_thoai` (`ma_dien_thoai`, `so_dien_thoai`) VALUES ('1', '0905814428');
INSERT INTO `phong_tro`.`chi_tiet_so_dien_thoai` (`ma_dien_thoai`, `so_dien_thoai`) VALUES ('2', '0787502878');
INSERT INTO `phong_tro`.`chi_tiet_so_dien_thoai` (`ma_dien_thoai`, `so_dien_thoai`) VALUES ('3', '0905787789');
INSERT INTO `phong_tro`.`chi_tiet_so_dien_thoai` (`ma_dien_thoai`, `so_dien_thoai`) VALUES ('4', '0905145267');
INSERT INTO `phong_tro`.`chi_tiet_so_dien_thoai` (`ma_dien_thoai`, `so_dien_thoai`) VALUES ('5', '0905678123');

INSERT INTO `phong_tro`.`hinh_thuc_thanh_toan` (`id`, `name`) VALUES ('1', 'tháng');
INSERT INTO `phong_tro`.`hinh_thuc_thanh_toan` (`id`, `name`) VALUES ('2', 'quý');
INSERT INTO `phong_tro`.`hinh_thuc_thanh_toan` (`id`, `name`) VALUES ('3', 'năm');

INSERT INTO `phong_tro`.`nguoi_thue` (`id_card`, `name`) VALUES ('1', 'hải');
INSERT INTO `phong_tro`.`nguoi_thue` (`id_card`, `name`) VALUES ('2', 'sơn');
INSERT INTO `phong_tro`.`nguoi_thue` (`id_card`, `name`) VALUES ('3', 'danh');
INSERT INTO `phong_tro`.`nguoi_thue` (`id_card`, `name`) VALUES ('4', 'hùng');
INSERT INTO `phong_tro`.`nguoi_thue` (`id_card`, `name`) VALUES ('5', 'giang');

INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('1', '2', '2022-12-04', '2', '1', 'có điều hòa');
INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('2', '1', '2020-10-10', '1', '2', 'có bồn cầu');
INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('3', '3', '2022-12-04', '3', '3', 'có giường ngủ');
INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('4', '5', '2021-08-12', '2', '2', 'có gồis');
INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('5', '4', '2020-04-02', '1', '1', 'có bếp');
INSERT INTO `phong_tro`.`phong_tro_thue` (`id`, `ma_dien_thoai`, `ngay_bat_dau_thue`, `ma_hinh_thuc_thanh_toan`, `id_card`, `ghi_chu`) VALUES ('6', '2', '2021-09-05', '2', '4', 'có pc');

CREATE VIEW view_phong_tro AS SELECT pt.id, nt.name AS ten_nguoi_thue, ctsdt.so_dien_thoai, pt.ngay_bat_dau_thue, httt.name AS ten_hinh_thuc_thanh_toan, pt.ghi_chu FROM phong_tro_thue pt 
JOIN nguoi_thue nt ON pt.id_card = nt.id_card
JOIN hinh_thuc_thanh_toan httt ON httt.id = pt.ma_hinh_thuc_thanh_toan 
JOIN chi_tiet_so_dien_thoai ctsdt ON ctsdt.ma_dien_thoai = pt.ma_dien_thoai;

INSERT INTO nguoi_thue(`name`) VALUES ("heo");
INSERT INTO chi_tiet_so_dien_thoai(ma_dien_thoai,so_dien_thoai) VALUES ("11","0908765432");
INSERT INTO phong_tro_thue(ngay_bat_dau_thue) VALUES ('2021-11-04');
INSERT INTO hinh_thuc_thanh_toan(`name`) VALUES ("ngày");
INSERT INTO phong_tro_thue(ghi_chu) VALUES ("hấp dẫn");
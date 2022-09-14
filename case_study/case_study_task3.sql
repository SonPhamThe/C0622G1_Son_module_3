drop database if exists furama;
CREATE database furama;
use furama;
-- tạo bảng vi_tri
CREATE TABLE vi_tri (
ma_vi_tri int  PRIMARY KEY,
ten_vi_tri varchar(45));
-- tạo bảng trin_do
CREATE TABLE trinh_do(
ma_trinh_do int  PRIMARY KEY,
ten_trinh_do varchar(45));
-- tạo bảng bo_phan
CREATE TABLE bo_phan(
ma_bo_phan int  PRIMARY KEY,
ten_bo_phan varchar(45));
-- tạo bảng nhan_vien
CREATE TABLE nhan_vien(
ma_nhan_vien int  PRIMARY KEY,
ho_ten varchar(45),
ngay_sinh DATE,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan));
-- tạo bảng loai_khach
CREATE TABLE loai_khach(
ma_loai_khach int  PRIMARY KEY,
ten_loai_khach varchar(45));
-- tạo bảng khach_hang
CREATE TABLE khach_hang(
ma_khach_hang int  PRIMARY KEY,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach));
-- tạo bảng loai_dich_vu
CREATE TABLE loai_dich_vu(
ma_loai_dich_vu int  PRIMARY KEY,
ten_loai_dich_vu varchar(45));
-- tạo bảng kieu_thue
CREATE TABLE kieu_thue(
ma_kieu_thue int  PRIMARY KEY,
ten_kieu_thue varchar(45)
);
-- tạo bảng dich_vu
CREATE TABLE dich_vu(
ma_dich_vu int  primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text,
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu),
FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue)
);
-- tạo bảng dich_vu_di_kem
CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem int  primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45));
-- tạo bảng hop_dong
CREATE TABLE hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);
-- tạo bảng hop_dong_chi_tiet
CREATE TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem),
FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong)
);
-- thêm data cho vi_tri
INSERT INTO `furama`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES (1, 'Quản Lý');
INSERT INTO `furama`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES (2, 'Nhân Viên');
-- thêm data cho trinh_do
INSERT INTO `furama`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('1', 'Trung Cấp');
INSERT INTO `furama`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('2', 'Cao Đẳng');
INSERT INTO `furama`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('3', 'Đại Học');
INSERT INTO `furama`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('4', 'Sau Đại Học');
-- thêm data cho bo_phan
INSERT INTO `furama`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('1', 'Sale-Marketing');
INSERT INTO `furama`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('2', 'Hành chính');
INSERT INTO `furama`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('3', 'Phục vụ');
INSERT INTO `furama`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('4', 'Quản lý');
-- thêm data cho nhan_vien
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (1, 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (2, 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (3, 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (4, 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2,3);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (9, 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4);
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2,3,2);
-- thêm data cho loai_khach
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('1', 'Diamond');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('2', 'Platinium');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('3', 'Gold');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('4', 'Silver');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('5', 'Member');
-- thêm data cho khách hàng
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (1, 2,'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (2,3,'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (3,4,'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (4,5, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (5,1, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (6,1, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (7,4, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (8,4, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (9,5, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES (10,2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
-- thêm data cho loai_dich_vu
INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('1', 'Villa');
INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('2', 'House');
INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('3', 'Room');
-- thêm data cho kieu_thue
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('1', 'year');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('2', 'month');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('3', 'day');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('4', 'hour');
-- thêm data cho dich_vu
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('1', 'Villa Beach Front', '25000', '1000000', '10', '1', '2', '500', '4', '82898632', '3', '1');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('2', 'House Princess 01', '14000', '5000000', '7', '2', '1', null, '3', '9823682', '2', '2');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', '3', '3', null, null, '8832862', '4', '3');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('4', 'Villa No Beach Front', '22000', '9000000', '8', '1', '1', '300', '3', '980129', '3', '1');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('5', 'House Princess 02', '10000', '4000000', '5', '2', '2', null, '2', '607605', '3', '2');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`) VALUES ('6', 'Room Twin 02', '3000', '900000', '2', '3', '1', null, null, '144843', '4', '3');
-- thêm data cho dich_vu_di_kem
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (1, 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (2, 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (3, 'Thuê xe đạp', '20000', 'chiếc', 'tốt');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (4, 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (5, 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES (6, 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
-- thêm data cho hop_dong
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');
-- thêm data cho hop_dong_chi_tiet
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES (1, 5, 2, 4);
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('2', '8', '2', '5');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('3', '10', '2', '6');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('4', '1', '3', '1');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('5', '11', '3', '2');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('6', '1', '1', '3');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('7', '2', '1', '2');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('8', '2', '1', '2');
-- task 4 yêu cầu 2
SELECT * FROM nhan_vien where (ho_ten REGEXP "^[HKT]") AND (char_length(ho_ten)<=15);
SELECT * FROM khach_hang WHERE(timestampdiff(year,ngay_sinh,curdate()) BETWEEN 18 AND 50) AND (dia_chi REGEXP "^Đà Nẵng" OR dia_chi REGEXP "^Quảng Trị");
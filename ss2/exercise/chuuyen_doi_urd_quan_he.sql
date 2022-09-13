DROP DATABASE IF EXISTS chuyen_doi_erd_mo_hinh_quan_he;
CREATE DATABASE chuyen_doi_erd_mo_hinh_quan_he;
USE chuyen_doi_erd_mo_hinh_quan_he;
CREATE TABLE nha_CC(
ma_NCC INT AUTO_INCREMENT PRIMARY KEY,
ten_NCC VARCHAR(45),
dia_chi VARCHAR(45)
);
CREATE TABLE chi_tiet_SDT(
so_dien_thoai VARCHAR(20),
ma_dien_thoai VARCHAR(20),
ma_NCC INT,
FOREIGN KEY(ma_NCC) REFERENCES nha_CC(ma_NCC)
);
CREATE TABLE vat_tu(
ma_VT INT AUTO_INCREMENT PRIMARY KEY,
ten_VT VARCHAR(20)
);
CREATE TABLE don_DH(
so_DH INT AUTO_INCREMENT PRIMARY KEY,
ngay_DH DATE,
ma_NCC INT,
FOREIGN KEY(ma_NCC) REFERENCES nha_CC(ma_NCC)
);
CREATE TABLE chi_tiet_don_DH(
ma_VT INT,
so_DH INT,
PRIMARY KEY(ma_VT,so_DH),
FOREIGN KEY(ma_VT) REFERENCES vat_tu(ma_VT),
FOREIGN KEY(so_DH) REFERENCES don_DH(so_DH)
);
CREATE TABLE phieu_nhap(
so_PN INT AUTO_INCREMENT PRIMARY KEY,
ngay_nhap DATE
);
CREATE TABLE chi_tiet_phieu_nhap(
DG_nhap DOUBLE,
SL_nhap DOUBLE,
ma_VT INT,
so_PN INT,
PRIMARY KEY(ma_VT,so_PN),
FOREIGN KEY(ma_VT) REFERENCES vat_tu(ma_VT),
FOREIGN KEY(so_PN) REFERENCES phieu_nhap(so_PN)
);
CREATE TABLE phieu_xuat(
so_PX INT AUTO_INCREMENT PRIMARY KEY,
ngay_xuat DATE
);
CREATE TABLE chi_tiet_phieu_xuat(
DG_xuat DOUBLE,
SL_xuat DOUBLE,
so_PX INT,
ma_VT INT,
PRIMARY KEY(so_PX,ma_VT),
FOREIGN KEY(so_PX) REFERENCES phieu_xuat(so_PX),
FOREIGN KEY(ma_VT) REFERENCES vat_tu(ma_VT)
);
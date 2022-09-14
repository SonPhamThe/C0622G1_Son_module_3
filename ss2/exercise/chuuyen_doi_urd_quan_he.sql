DROP DATABASE IF EXISTS chuyen_doi_erd_mo_hinh_quan_he;
CREATE DATABASE chuyen_doi_erd_mo_hinh_quan_he;
USE chuyen_doi_erd_mo_hinh_quan_he;
CREATE TABLE nha_cc(
ma_ncc INT AUTO_INCREMENT PRIMARY KEY,
ten_ncc VARCHAR(45),
dia_chi VARCHAR(45)
);
CREATE TABLE chi_tiet_SDT(
so_dien_thoai VARCHAR(20),
ma_dien_thoai VARCHAR(20),
ma_ncc INT,
FOREIGN KEY(ma_ncc) REFERENCES nha_cc(ma_ncc)
);
CREATE TABLE vat_tu(
ma_vt INT AUTO_INCREMENT PRIMARY KEY,
ten_vt VARCHAR(20)
);
CREATE TABLE don_dh(
so_dh INT AUTO_INCREMENT PRIMARY KEY,
ngay_dh DATE,
ma_ncc INT,
FOREIGN KEY(ma_ncc) REFERENCES nha_cc(ma_ncc)
);
CREATE TABLE chi_tiet_don_dh(
ma_vt INT,
so_dh INT,
PRIMARY KEY(ma_vt,so_dh),
FOREIGN KEY(ma_vt) REFERENCES vat_tu(ma_vt),
FOREIGN KEY(so_dh) REFERENCES don_dh(so_dh)
);
CREATE TABLE phieu_nhap(
so_pn INT AUTO_INCREMENT PRIMARY KEY,
ngay_nhap DATE
);
CREATE TABLE chi_tiet_phieu_nhap(
dg_nhap DOUBLE,
sl_nhap DOUBLE,
ma_vt INT,
so_pn INT,
PRIMARY KEY(ma_vt,so_pn),
FOREIGN KEY(ma_vt) REFERENCES vat_tu(ma_vt),
FOREIGN KEY(so_pn) REFERENCES phieu_nhap(so_pn)
);
CREATE TABLE phieu_xuat(
so_px INT AUTO_INCREMENT PRIMARY KEY,
ngay_xuat DATE
);
CREATE TABLE chi_tiet_phieu_xuat(
dg_xuat DOUBLE,
sl_xuat DOUBLE,
so_px INT,
ma_vt INT,
PRIMARY KEY(so_px,ma_vt),
FOREIGN KEY(so_px) REFERENCES phieu_xuat(so_px),
FOREIGN KEY(ma_vt) REFERENCES vat_tu(ma_vt)
);
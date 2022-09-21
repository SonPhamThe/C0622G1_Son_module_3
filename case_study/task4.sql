-- task 4 yêu cầu 1-10
DROP DATABASE IF EXISTS furama;
USE case_study;
-- yêu cầu 2
-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, 
-- “T” hoặc “K” và có tối đa 15 kí tự.
SELECT * FROM nhan_vien WHERE ( ho_ten regexp '^[HTK]') AND (char_length(ho_ten)<=15);
-- yêu cầu 3
-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị	
SELECT *, year(curdate())- year(ngay_sinh) AS tuoi FROM khach_hang 
WHERE (year(curdate())- year(ngay_sinh) BETWEEN 18 AND 50) 
AND (dia_chi LIKE "% Đà Nẵng" OR dia_chi LIKE "% Quảng Trị");
-- yêu cầu 4
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_khach_hang) AS so_lan_dat_phong FROM khach_hang kh 
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach 
WHERE lk.ten_loai_khach = "Diamond"
GROUP BY hd.ma_khach_hang ORDER BY so_lan_dat_phong;
-- yêu cầu 5
-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
(ifnull(dv.chi_phi_thue,0)+SUM(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) AS tong_tien 
FROM hop_dong hd LEFT JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang 
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu 
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
GROUP BY hd.ma_hop_dong
ORDER BY kh.ma_khach_hang;
-- yêu cầu 6 
-- Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
FROM dich_vu dv JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
WHERE dv.ma_dich_vu
NOT IN (SELECT hd.ma_khach_hang FROM hop_dong hd WHERE hd.ngay_lam_hop_dong BETWEEN 2021-01-01 AND 2021-03-31);
-- yêu cầu 7
-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng 
-- trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue,
ldv.ten_loai_dich_vu FROM dich_vu dv JOIN loai_dich_vu ldv 
ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu IN (SELECT hd.ma_dich_vu FROM hop_dong hd WHERE year(hd.ngay_lam_hop_dong) = 2020)
AND dv.ma_dich_vu NOT IN (SELECT hd.ma_dich_vu FROM hop_dong hd WHERE year(hd.ngay_lam_hop_dong) = 2021);
-- yêu cầu 8
-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1
SELECT kh.ho_ten FROM khach_hang kh 
GROUP BY kh.ho_ten;
-- cách 2
SELECT DISTINCT kh.ho_ten FROM khach_hang kh;
-- cách 3
SELECT kh.ho_ten FROM khach_hang kh 
UNION 
SELECT kh.ho_ten FROM khach_hang kh ;
-- yêu cầu 9
-- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT month(hd.ngay_lam_hop_dong) AS thang, COUNT(ma_hop_dong) FROM hop_dong hd
WHERE year(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- yêu cầu 10
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
-- Task 10
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, 
SUM(ifnull(hdct.so_luong,0)) as tong_so
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;
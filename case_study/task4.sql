-- task 4 yêu cầu 1-10
DROP DATABASE IF EXISTS furama;
USE case_study;
-- yêu cầu 2
SELECT * FROM nhan_vien where (ho_ten REGEXP "^[HKT]") AND (char_length(ho_ten)<=15);
-- yêu cầu 3
SELECT * FROM khach_hang WHERE (TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) BETWEEN 18 AND 50) AND (dia_chi LIKE "%Đà Nẵng%" OR dia_chi LIKE "%Quảng Trị%");
-- yêu cầu 4
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_khach_hang) AS so_lan_dat_phong FROM khach_hang kh JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach WHERE lk.ten_loai_khach = "Diamond"
GROUP BY hd.ma_khach_hang ORDER BY so_lan_dat_phong;
-- yêu cầu 5
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(ifnull(dv.chi_phi_thue,0)+SUM(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) AS tong_tien 
FROM hop_dong hd LEFT JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang 
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu 
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
GROUP BY hd.ma_hop_dong
ORDER BY kh.ma_khach_hang;
-- yêu cầu 6 
-- yêu cầu 7
-- yêu cầu 8


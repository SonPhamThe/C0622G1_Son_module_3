USE case_study;
-- task 6 
-- yêu cầu 11
-- Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    kh.ho_ten,
    kh.dia_chi,
    lk.ten_loai_khach,
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    lk.ten_loai_khach LIKE 'Diamond'
        AND (kh.dia_chi LIKE '% Vinh'
        OR kh.dia_chi LIKE '% Quảng Ngãi');
-- yêu cầu 12
-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021;
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten AS ho_ten_nhan_vien,
    kh.ho_ten AS ho_ten_khach_hang,
    kh.so_dien_thoai AS so_dien_thoai_khach_hang,
    dv.ten_dich_vu,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    khach_hang kh
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    (QUARTER(hd.ngay_lam_hop_dong) = 4)
        AND (YEAR(hd.ngay_lam_hop_dong) = 2020)
        AND hd.ngay_lam_hop_dong NOT IN (SELECT 
            hd.ngay_lam_hop_dong
        FROM
            hop_dong hd
        WHERE
            (MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 6)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2021)
        GROUP BY hd.ma_hop_dong)
GROUP BY hd.ma_hop_dong;
-- yêu cầu 13
-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
DROP VIEW IF EXISTS max_so_luong;
CREATE VIEW max_so_luong as SELECT sum(hdct.so_luong) as so_luong_dich_vu_di_kem
FROM 
    hop_dong hd 
			JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN	
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem;
SELECT 
     dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem1
FROM 
    hop_dong hd 
			JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN	
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem
    HAVING so_luong_dich_vu_di_kem1 = (SELECT MAX(so_luong_dich_vu_di_kem) from max_so_luong);
-- yêu cầu 14
-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, hdct.ma_dich_vu_di_kem, hdct.so_luong, 
COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung FROM hop_dong hd 
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1;
-- yêu cầu 15
-- Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, 
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
FROM nhan_vien nv JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do 
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan 
JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien 
WHERE year(hd.ngay_lam_hop_dong) BETWEEN "2020" AND "2021"
GROUP BY nv.ma_nhan_vien
HAVING COUNT(nv.ma_nhan_vien) < 4;
-- yêu cầu 16
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhan_vien nv WHERE nv.ma_nhan_vien 
NOT IN (SELECT hd.ma_nhan_vien FROM hop_dong hd 
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021); 
-- yêu cầu 17
-- Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 
-- là lớn hơn 10.000.000 VNĐ.
DROP VIEW IF EXISTS task17;
CREATE VIEW task17 AS SELECT kh.ma_khach_hang,
kh.ho_ten,
lk.ten_loai_khach,
hd.ma_hop_dong, 
dv.ten_dich_vu, 
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc, 
(ifnull(dv.chi_phi_thue,0)+ SUM(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach 
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang 
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong, kh.ma_khach_hang
ORDER BY kh.ma_khach_hang;
UPDATE khach_hang kh 
JOIN task17 ON kh.ma_khach_hang = task17.ma_khach_hang
JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
SET kh.ma_loai_khach = 1 WHERE kh.ma_loai_khach = 2 AND kh.ma_khach_hang IN (SELECT task17.ma_khach_hang FROM task17 WHERE task17.tong_tien > 10000000)
AND year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021;
SELECT * FROM khach_hang;
-- yêu cầu 18
-- Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang kh 
WHERE kh.ma_khach_hang IN (SELECT hd.ma_khach_hang FROM hop_dong hd WHERE year(hd.ngay_lam_hmax_so_luongop_dong) < 2021);
-- yêu cầu 19
-- Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem dvdk JOIN hop_dong_chi_tiet hdct 
ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
SET dvdk.gia = dvdk.gia * 2 IN (SELECT hdct.ma_dich_vu_di_kem FROM hop_dong_chi_tiet hdct 
JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong 
WHERE hdct.so_luong > 10 AND year(hd.ngay_lam_hop_dong) = 2020);
-- yêu cầu 20 
-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.so_dien_thoai,nhan_vien.ngay_sinh,nhan_vien.dia_chi FROM nhan_vien
UNION ALL
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi FROM khach_hang;
USE case_study;
-- task 6 
-- yêu cầu 11
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
        OR kh.dia_chi LIKE '% Quảng Ngãi')yêu cầu 12
-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
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
     dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
FROM 
    hop_dong hd 
			JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN	
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem
    HAVING so_luong_dich_vu_di_kem = (SELECT MAX(so_luong_dich_vu_di_kem) from max_so_luong);
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
DELETE FROM nhan_vien WHERE 
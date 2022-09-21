USE case_study;
-- yêu cầu 21 
-- Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ 
-- là “Hải Châu” và đã từng lập hợp đồngnhan_vien cho một hoặc nhiều khách hàng bất kì với 
-- ngày lập hợp đồng là “12/12/2019”
CREATE VIEW v_nhan_vien AS
SELECT nv.* FROM nhan_vien nv 
JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien 
WHERE nv.ma_nhan_vien IN (SELECT hd.ma_nhan_vien FROM hop_dong hd WHERE hd.ngay_lam_hop_dong = "2019-12-12")
AND nv.dia_chi LIKE "% Liên Chiểu";
-- yêu cầu 22
-- Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với 
-- tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE v_nhan_vien vnv
SET vnv.dia_chi = REPLACE(vnv.dia_chi, 'Hải Châu', 'Liên Chiểu')
WHERE vnv.dia_chi LIKE "% Hải Châu";
-- yêu cầu 23 
-- Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //

CREATE PROCEDURE sp_xoa_khach_hang 

(IN ma_khach_hang_sp INT)

BEGIN

  DELETE FROM khach_hang kh WHERE kh.ma_khach_hang = ma_khach_hang_sp;

END //

DELIMITER ;

CALL sp_xoa_khach_hang(3);
-- yêu cầu 24
-- Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //

CREATE PROCEDURE sp_them_moi_hop_dong 

(IN ma_khach_hang_sp INT)

BEGIN

  DELETE FROM khach_hang kh WHERE kh.ma_khach_hang = ma_khach_hang_sp;

END //

DELIMITER ;

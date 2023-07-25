-- tạo bảng
CREATE TABLE sinhvien1 (
	Masv INT IDENTITY (10,2)  ,
	ten NVARCHAR(250) ,
	lop VARCHAR(250),
	email NVARCHAR(250) UNIQUE (-- duy nhất )
)
-- sửa bảng
ALTER TABLE sinhvien1
ALTER COLUMN lop VARCHAR(250)
-- xóa bảng
DROP TABLE SinhVien1
-- thêm rảng buộc
ALTER TABLE SinhVien1
ADD CONSTRAINT pk_Masv PRIMARY KEY(masv)

--
CREATE TABLE monhoc1 (
	mamh INT PRIMARY KEY,
	tenmon NVARCHAR(25)
)
-- thêm cột
ALTER TABLE monhoc1
ADD sotiet NVARCHAR(250)
-- xóa cột
ALTER TABLE monhoc1
DROP COLUMN sotiet
-- chèn
INSERT INTO monhoc1 
VALUES
	(1,'Môn c'),
	(200,'Môn d')
-- 
DROP TABLE monhoc1
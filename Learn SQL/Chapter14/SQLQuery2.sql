-- Tạo Bảng Sinh viên 
CREATE TABLE SinhVien (
	MaSV INT IDENTITY(1000,1) CONSTRAINT PK_MaSV PRIMARY KEY ,
	HoTenSV NVARCHAR(250) ,
	GioiTinh NVARCHAR(250) CONSTRAINT Check_Gioitinh CHECK (GioiTinh ='Nam' OR GioiTinh =N'Nữ'),
	NgaySinh DATE ,
	QueQuan NVARCHAR(250) ,
	Lop NVARCHAR(250)
)
-- Tạo bảng Môn Học
CREATE TABLE MonHoc(
	MaMH INT IDENTITY (1000,1) CONSTRAINT PK_MaMH PRIMARY KEY ,
	TenMH NVARCHAR(250) ,
	DVHT NVARCHAR(250) 
)
--tạo bảng điểm
/*
CREATE TABLE KetQua (
	MaSV INT ,
	MaMH INT ,
	Diem FLOAT ,
	CONSTRAINT PK_KetQua PRIMARY KEY (MaSV,MaMH)
)
*/
--Tạo bảng KetQua tự đề xuất 
CREATE TABLE KetQua (
	MaKetQua INT IDENTITY (1000,1) PRIMARY KEY ,
	MaSV INT ,
	MaMH INT ,
	Diem FLOAT ,
	CONSTRAINT FK_MaSV FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
	CONSTRAINT FK_MaMH FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
)
--Theem cot email

ALTER TABLE SinhVien
ADD
	Email NVARCHAR(250)
-- Xoas coot lop
ALTER TABLE SinhVien 
DROP COLUMN Lop
-- Sửa trường dữ liệu giới tính
ALTER TABLE SinhVien
ALTER COLUMN GioiTinh NVARCHAR(5)
--Thêm dữ liệu
INSERT INTO
	SinhVien(
		HoTenSV,
		GioiTinh,
		NgaySinh,
		QueQuan,
		Email
	)
VALUES 
	(N'Nguyễn Văn An','Nam','2002-07-02',N'Hà Nội','hai@xmail.com'),
	(N'Nguyễn Văn Minh','Nam','2002-11-02',N'Hà Nội','minh@xmail.com'),
	(N'Nguyễn Văn Hùng','Nam','2002-6-02',N'Hà Nội','hung@xmail.com'),
	(N'Nguyễn Văn Hưng','Nam','2002-03-02',N'Hà Nội','hungx@xmail.com'),
	(N'Nguyễn Văn Hoàng','Nam','2002-10-02',N'Hà Nội','hoang@xmail.com')
--Thêm dữ liệu cho bảng MonHoc

SELECT
	*
FROM  SinhVien
WHERE
	QueQuan=N'Hà Nội'OR QueQuan=N'Nghệ An'
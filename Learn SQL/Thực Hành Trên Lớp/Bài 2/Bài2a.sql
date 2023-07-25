--Create Table SinhVien
CREATE TABLE SinhVien(
	MaSV NVARCHAR(250) PRIMARY KEY,
	TenSV NVARCHAR(250) ,
	GioiTinh NVARCHAR(250)  CHECK(GioiTinh='Nam' OR GioiTinh=N'Nữ'),
	NgaySinh DATE ,
	Que NVARCHAR(250),
	Lop NVARCHAR(250)
)
--Insert data in to table SinhVien
INSERT INTO SinhVien
VALUES
	('AT170401',N'Nguyễn Thế Anh',N'Nam','2002-02-12',N'Hà Giang','L05'),
	('AT170402',N'Đào Tuấn Anh',N'Nam','2000-12-02',N'Hà Nội','L01'),
	('AT170403',N'Trần Quốc Anh',N'Nam','2002-10-09',N'Nghệ An','L05'),
	('AT170404',N'Nguyễn Thị Mai Anh',N'Nữ','2002-09-24',N'Nghệ An','L05'),
	('AT170405',N'Trần Thị Ánh ',N'Nữ','2002-03-26',N'Thanh Hóa','L05'),
	('AT170406',N'Nguyễn Minh Ánh',N'Nữ','2002-04-12',N'Thanh Hóa','L05'),
	('AT170407',N'Nguyễn Thị Mai Anh ',N'Nữ','2002-07-30',N'Hà Nội','L03'),
	('AT170415',N'Nguyễn Văn Hải',N'Nam','2002-07-02',N'Hà Nội','L05'),
	('AT170416',N'Nguyễn Trường Giang',N'Nam','2001-11-02',N'Hà Giang','L05'),
	('AT170417',N'Trần Thị Hạnh',N'Nữ','2002-10-11',N'Hưng Yên','L12'),
	('AT170418',N'Vũ Thế Phương',N'Nam','2003-11-02',N'Hà Nội','L11'),
	('AT170419',N'Trần Minh Khải',N'Nam','2002-05-11',N'Tuyên Quang','L05'),
	('AT170420',N'Đỗ Thị Hải',N'Nữ','2002-09-02',N'Hà Nội','L05'),
	('AT170421',N'Nguyễn Văn Hưng',N'Nam','2001-07-02',N'Hà Giang','L05'),
	('AT170422',N'Trần Vũ Nam',N'Nam','2001-01-12',N'Nam Định','L05'),
	('AT170423',N'Vũ Thị Ánh',N'Nữ','2001-11-1',N'Hưng Yên','L12'),
	('AT170424',N'Phạm Văn Tính',N'Nam','2002-05-08',N'Nam Định','L05'),
	('AT170425',N'Phạm Minh Sơn ',N'Nam','2002-11-12',N'Thanh Hóa','L02'),
	('AT170426',N'Nguyễn Văn Hùng',N'Nam','2002-01-2',N'Huế','L07'),
	('AT170427',N'Trịnh Thị Hòa',N'Nữ','2002-11-08',N'Thanh Hóa','L05'),
	('AT170428',N'Đỗ Thị Linh',N'Nữ','2001-01-12',N'Bắc Giang','L05')

--
/*SELECT
	*
FROM
	SinhVien
*/
--
-- create table MonHoc
CREATE TABLE MonHoc (
	MaMH NVARCHAR(250) PRIMARY KEY,
	TenMH NVARCHAR(25) ,
	DVHT INT 
)

-- insert data in to MonHoc
INSERT INTO MonHoc
VALUES 
	('MH1001',N'Lập Trình Căn Bản',3),
	('MH1002',N'Hướng Đối Tượng Java',3),
	('MH1003',N'Hướng Đối Tượng C++',3),
	('MH1004',N'Kỹ Thuật Giấu Tin',2),
	('MH1005',N'Hệ Quản Trị Cơ Sở Dữ Liệu',2),
	('MH1006',N'Mật Mã',2),
	('MH1007',N'Toán Rời Rạc',2),
	('MH1008',N'Thế Chất 3',1),
	('MH1009',N'CTDL',2),
	('MH1010',N'Linux Và Nguồn Mở',3),
	('MH1011',N'An Toàn Cơ Sở Dữ Liệu',4)
--
/*
SELECT
	*
FROM
	MonHoc
*/
--create KetQua
CREATE TABLE KetQua(
	MaKQ INT IDENTITY PRIMARY KEY ,
	MaSV NVARCHAR(250),
	MaMH NVARCHAR(250),
	Diem FLOAT
	CONSTRAINT FK_MaSV FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV),
	CONSTRAINT FK_MaMH FOREIGN KEY(MaMH) REFERENCES MonHoc(MaMH)
)
--insert data in to table KetQua
INSERT INTO KetQua (
	MaSV,
	MaMH,
	Diem
)
VALUES
	('AT170408','MH1001',7.5),
	('AT170409','MH1004',8.5),
	('AT170410','MH1003',7.25),
	('AT170411','MH1001',9.5),
	('AT170412','MH1002',7),
	('AT170413','MH1005',8),
	('AT170414','MH1006',6.75),
	('AT170415','MH1001',9.75),
	('AT170408','MH1002',6),
	('AT170415','MH1001',7.5),
	('AT170409','MH1008',9),
	('AT170410','MH1010',3),
	('AT170414','MH1009',2.5),
	('AT170416','MH1002',3),
	('AT170418','MH1003',1.5),
	('AT170419','MH1004',5.75),
	('AT170408','MH1005',4.5),
	('AT170426','MH1006',5),
	('AT170428','MH1003',2.5),
	('AT170427','MH1002',5.5)
--insert data in to BanDoc
INSERT INTO BanDoc
	(MaBD,HoTenBD,NgaySinh,QueQuan,Lop,SoDT)
VALUES
	('AT170408',N'Nguyễn Thế Hừng','2002-09-12',N'Hà Giang','L05','09127812912'),
	('AT170409',N'Đào Cư Nam','2000-12-02',N'Hà Nội','L01','0912178128'),
	('AT170410',N'Trần Văn Quốc','2002-11-09',N'Nghệ An','L05','0912178128'),
	('AT170411',N'Nguyễn Thị Nhung','2002-11-24',N'Nghệ An','L05','0912178189'),
	('AT170412',N'Trần Thị Ánh Duyên','2002-03-26',N'Thanh Hóa','L05','0921781278'),
	('AT170413',N'Ninh Thị Thùy Trang','2002-04-12',N'Thanh Hóa','L05','0912121278'),
	('AT170414',N'Nguyễn Thảo Vân ','2002-07-30',N'Hà Nội','L03','0912671289'),
	('AT170415',N'Nguyễn Văn Hải','2002-07-02',N'Hà Nội','L05','0912671234'),
	('AT170416',N'Nguyễn Trường Giang','2001-11-02',N'Hà Giang','L05','0322128781'),
	('AT170417',N'Trần Thị Hạnh','2002-10-11',N'Hưng Yên','L12','0987212356'),
	('AT170418',N'Vũ Thế Phương','2003-11-02',N'Hà Nội','L11','0982127890'),
	('AT170419',N'Trần Minh Khải','2002-05-11',N'Tuyên Quang','L05','0388992109'),
	('AT170420',N'Đỗ Thị Hải','2002-09-02',N'Hà Nội','L05','0912671289'),
	('AT170421',N'Nguyễn Văn Hưng','2001-07-02',N'Hà Giang','L05','0912092211'),
	('AT170422',N'Trần Vũ Nam','2001-01-12',N'Nam Định','L05','0987632451'),
	('AT170423',N'Vũ Thị Ánh','2001-11-1',N'Hưng Yên','L12','0982221234'),
	('AT170424',N'Phạm Văn Tính','2002-05-08',N'Nam Định','L05','0988221121'),
	('AT170425',N'Phạm Minh Sơn ','2002-11-12',N'Thanh Hóa','L02','0789127890'),
	('AT170426',N'Nguyễn Văn Hùng','2002-01-2',N'Huế','L07','0912781211'),
	('AT170427',N'Trịnh Thị Hòa','2002-11-08',N'Thanh Hóa','L05','0789902212'),
	('AT170428',N'Đỗ Thị Linh','2001-01-12',N'Bắc Giang','L05','0786221234')
-- insert data in to Sach
INSERT INTO Sach
VALUES
	('SACH1001',N'Lập Trình viên',N'Nguyễn Văn A',2009,N'Kim Đồng'),
	('SACH1002',N'Lập Trình Web',N'Nguyễn Văn B',2001,N'Kim Đồng'),
	('SACH1003',N'Lập Trình Java',N'Nguyễn Văn C',2018,N'Kim Đồng'),
	('SACH1004',N'Lập Trình Python',N'Nguyễn Văn D',2009,N'Kim Đồng'),
	('SACH1005',N'Lập Trình SQL',N'Nguyễn Văn E',2010,N'Kim Đồng'),
	('SACH1006',N'Lập Trình PHP',N'Nguyễn Văn F',2012,N'Kim Đồng'),
	('SACH1007',N'Lập Trình Android',N'Nguyễn Văn G',2016,N'Kim Đồng'),
	('SACH1008',N'Lập Trình IOS',N'Nguyễn Văn H',2018,N'Kim Đồng'),
	('SACH1009',N'Lập Trình C++',N'Nguyễn Văn K',2019,N'Kim Đồng'),
	('SACH1010',N'Lập Trình C#',N'Nguyễn Văn L',2020,N'Kim Đồng'),
	('SACH1011',N'Lập Trình Game',N'Nguyễn Văn M',2017,N'Kim Đồng')
	
-- insert in to PhieuMuon
INSERT INTO PhieuMuon
	(MaBD,Mas,NgayMuon,NgayHenTra,TraSach)
VALUES
	('AT170423','SACH1001','2018-09-05','2018-09-10',0),
	('AT170423','SACH1002','2018-09-05','2018-09-10',0),
	('AT170423','SACH1004','2018-09-05','2018-09-10',0),
	('AT170425','SACH1004','2018-09-05','2018-09-10',0),
	('AT170426','SACH1005','2019-09-05','2019-09-10',0),
	('AT170424','SACH1006','2019-09-05','2019-09-10',0),
	('AT170425','SACH1007','2018-09-05','2018-09-10',0),
	('AT170426','SACH1009','2018-09-05','2018-09-10',0),
	('AT170427','SACH1009','2018-09-05','2018-09-10',0),
	('AT170428','SACH1011','2019-09-05','2019-09-10',0),
	('AT170422','SACH1011','2018-09-05','2018-09-10',0),
	('AT170422','SACH1010','2019-09-05','2019-09-10',0)

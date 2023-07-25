--Tạo bảng products có chứa CHECK
/*
CREATE TABLE
	LearnSQL.dbo.Products(
		PK_ProductId NVARCHAR(50) CONSTRAINT PK_ProductId PRIMARY KEY ,
		Name NVARCHAR(50) NOT NULL ,
		Price FLOAT DEFAULT NULL CONSTRAINT CH_Price CHECK(Price >0 ),
		Quantity INT DEFAULT NULL CONSTRAINT CH_Quantity CHECK(Quantity > 0)
		)
*/
--Thhêm dữ liệu vào cho bảng 
INSERT INTO	
	LearnSQL.dbo.Products(PK_ProductId,Name,Price,Quantity)
VALUES
	('PRO1001',N'Xe Máy ',390000,8),
	('PRO1002',N'Ô Tô ',900000,6),
	('PRO1003',N'Xe Máy Điện ',450000,8),
	('PRO1004',N'Xe HonDa ',410000,9),
	('PRO1005',N'Xe Đạp ',200000,3)
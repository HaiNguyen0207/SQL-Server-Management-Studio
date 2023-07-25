--Tạo bảng Products
/*
CREATE TABLE
	Products(
		PK_Products INT PRIMARY KEY IDENTITY(1000,1) NOT NULL ,
		Name NVARCHAR(200),
		Quantity INT  DEFAULT 0 ,
		Price FLOAT DEFAULT 0
		)
*/
--Chèn dữ liệu vào bảng Products
/*
INSERT INTO	
	Products (Name ,Quantity,Price)
VALUES
	(N'Xe Máy 2 ',12,38900000),
	(N'Xe Máy 3 ',5,36700000),
	(N'Xe Máy 4 ',11,12800000),
	(N'Xe Máy 5 ',10,91200000),
	(N'Xe Máy 6 ',9,54200000),
	(N'Xe Máy 7 ',8,19300000)
*/
--Tạo bảng Provider (các nhà cung cấp )
/*
CREATE TABLE
	Providers(
		PK_Provider NVARCHAR(50) PRIMARY KEY NOT NULL ,
		Name NVARCHAR(50),
		Address NVARCHAR(50),
		PhoneNumber NVARCHAR(50),
		Brand NVARCHAR(50)
		)
*/
--Chèn dữ liệu vào bảng
/*
INSERT INTO		
	Providers(PK_Provider ,Name ,Address,PhoneNumber,Brand)
VALUES
	('PK1' ,'Name1','Address1','0921278121','Brand1'),
	('PK2' ,'Name2','Address2','0921278120','Brand2'),
	('PK3' ,'Name3','Address3','0921278122','Brand3'),
	('PK4' ,'Name4','Address4','0921278123','Brand4'),
	('PK5' ,'Name5','Address5','0921278124','Brand5'),
	('PK6' ,'Name6','Address6','0921278125','Brand6'),
	('PK7' ,'Name7','Address7','0921278126','Brand7'),
	('PK8' ,'Name8','Address8','0921278128','Brand8'),
	('PK9' ,'Name9','Address9','0921278129','Brand9')
	
*/
--Tạo bảng ProductManagement
/*
CREATE TABLE
	ProductManagements(
		Id INT PRIMARY KEY IDENTITY (100,1) NOT NULL,
		FK_Products INT  NULL,
		FK_Providers NVARCHAR(50)  NULL,
		TimeProvide DATETIME DEFAULT GETDATE(),
		CONSTRAINT 
			FK_products 
		FOREIGN KEY
			(FK_Products)
		REFERENCES 
			LearnSQL.dbo.Products(PK_Products)
		ON DELETE CASCADE 
		 ON UPDATE CASCADE,
		CONSTRAINT
			FK_providers
		FOREIGN KEY 
			(FK_Providers)
		REFERENCES 
			LearnSQL.dbo.Providers(PK_Provider)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
		)
*/
--Thêm dữ liệu cho bảng ProductManagements
INSERT INTO
	ProductManagements(FK_Products,FK_Providers)
VALUES
	(1001,'PK2'),
	(1000,'PK3'),
	(1002,'PK1'),
	(1001,'PK9'),
	(1003,'PK8'),
	(1004,'PK2'),
	(1000,'PK1'),
	(1006,'PK7'),
	(1001,'PK6')



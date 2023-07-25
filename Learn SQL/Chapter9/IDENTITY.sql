/*
CREATE TABLE MyDatabase.dbo.Persons(
	Id INT IDENTITY(100,2) PRIMARY KEY,
	fullName NVARCHAR(50),
	Address NVARCHAR(50),
	BirthDate DATE ,
	PhoneNumber NVARCHAR(50)
	)
*/
--chèn dữ liệu vào bảng Persons
INSERT INTO	
	MyDatabase.dbo.Persons
		(FullName,Address,BirthDate,PhoneNumber)
VALUES
	(N'Nguyễn Cảnh Minh ',N'Hà Nội','2002-01-20','0912891021'),
	(N'Nguyễn Quang An ',N'Hà Giang','2001-11-21','0983678219'),
	(N'Trần Danh Minh ',N'Hà Nội','2002-09-12','0982156217'),
	(N'Đỗ Thị Thu Ngân ',N'Hà Nội','2003-01-11','0891290121'),
	(N'Trịnh Văn Cương ',N'Thanh Hóa','2003-04-30','0912812812'),
	(N'Nguyễn Văn An ',N'Hà Nội','2002-12-03','0912128912'),
	(N'Nguyễn Duy Hương ',N'Hà Nội','2000-08-30','0912189120'),
	(N'Vi  Minh Đồng ',N'Hà Tĩnh','2002-01-22','0871218912')
	


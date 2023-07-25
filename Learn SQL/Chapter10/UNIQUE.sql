--Tạo bảng teachers
/*
DROP TABLE
	LearnSQL.dbo.Teachers
CREATE TABLE 
	LearnSQL.dbo.Teachers(
		PK_TeacherId NVARCHAR(50) ,
		FullName NVARCHAR(100) NOT NULL,
		PhoneNumber NVARCHAR(20),
		Email NVARCHAR(50),
		CONSTRAINT PK_TeacherId PRIMARY KEY(PK_TeacherId),
		CONSTRAINT UQ_PhoneNumber UNIQUE(PhoneNumber),
		CONSTRAINT UQ_Email UNIQUE(Email)
		)
*/
--Thêm dữ liệu cho bảng teachers
INSERT INTO	
	LearnSQL.dbo.Teachers
VALUES
	('T1012',N'Trần Minh Khoa','09127732989','khoa@xmail.com'),
	('T1002',N'Nguyễn Thị Ngân','0933281201','ngan@xmail.com'),
	('T1003',N'Nguyễn Thị Thủy','0867128912','thuy@xmail.com'),
	('T1005',N'Nguyễn Minh Ánh','0921228811','anh@xmail.com'),
	('T1006',N'Kiều Thị Dung','0912891291','dungxx@xmail.com'),
	('T1008',N'Ngân Văn Đại','0312127812','dai@xmail.com')
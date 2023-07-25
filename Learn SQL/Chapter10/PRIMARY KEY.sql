--Tạo bảng có khóa chính
/*
CREATE TABLE LearnSQL.dbo.Events (
	PK_Event INT PRIMARY KEY NOT NULL ,
	Name NVARCHAR (200) ,
	StartAT DATETIME,
	EndAT DATETIME,
	)
*/
--Tạo bảng chưa có khóa chinh
/*
CREATE TABLE LearnSQL.dbo.Events1 (
	PK_Event INT NOT NULL ,
	Name NVARCHAR(200),
	StartAt DATETIME,
	EndAt DATETIME
	)
*/
ALTER TABLE
	LearnSQL.dbo.Events1
ADD PRIMARY KEY
	(PK_Event)
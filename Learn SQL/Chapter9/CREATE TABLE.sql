-- tạo bảng subject
/*
CREATE TABLE	
	MyDatabase.dbo.Subject (
		SubjectId NVARCHAR(50) PRIMARY KEY NOT NULL,
		Name NVARCHAR(50),
		Credit INT DEFAULT 0,
		NumberOfLesson INT DEFAULT 0,
		TypeSubject NVARCHAR(50)
		)
*/
--chèn dữ liệu cho bảng subject
/*
INSERT INTO
	MyDatabase.dbo.Subject(SubjectId,Name,Credit,NumberOfLesson,TypeSubject)
SELECT
	sub.SubjectId,sub.Name,sub.Credit,sub.NumOfLesson,sub.Type
FROM	
	LearnSQL.dbo.Subjects sub
*/
-- tạo bảng register
/*CREATE TABLE	
	MydataBase.dbo.Registers(
		Id INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
		StudentId NVARCHAR(50) NOT NULL,
		SubjectId NVARCHAR(50) NOT NULL,
		TimeRegister DATETIME DEFAULT GETDATE(),
		StatusRegister NVARCHAR(50) DEFAULT 'Success' ,
		FOREIGN KEY(StudentId) REFERENCES MydataBase.dbo.Students(StudentId),
		FOREIGN KEY(SubjectId) REFERENCES MydataBase.dbo.Subject(SubjectId)
	)
*/
--chèn dữ liệu cho bảng register
INSERT INTO	
	MyDatabase.dbo.Registers
		(StudentId,SubjectId)
VALUES
	('B25DCCN101','SUBJ1005'),
	('B25DCCN102','SUBJ1006'),
	('B25DCCN101','SUBJ1008'),
	('B25DCCN104','SUBJ1009'),
	('B25DCCN106','SUBJ1201'),
	('B25DCCN108','SUBJ1006'),
	('B25DCCN108','SUBJ1008'),
	('B25DCQT110','SUBJ1009'),
	('B25DCQT110','SUBJ1201'),
	('B25DCCN121','SUBJ1012'),
	('B25DCCN101','SUBJ1201'),
	('B25DCCN102','SUBJ1201'),
	('B25DCCN101','SUBJ1011'),
	('B25DCDT115','SUBJ1005'),
	('B25DCCN108','SUBJ1006'),
	('B25DCCN107','SUBJ1016'),
	('B25DCQT150','SUBJ1010'),
	('B25DCVT101','SUBJ1008'),
	('B25DCHT102','SUBJ1008')


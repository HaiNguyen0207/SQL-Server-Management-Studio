--Tạo trigger giám sát các hành động DELETE, UPDATE, INSERT dữ liệu vào bảng Subjects.
/*
CREATE TABLE SubjectAudits (
	Pk_SubjectAuditId INT IDENTITY PRIMARY KEY ,
	SubjectId NVARCHAR(250) NOT NULL ,
	SubjectName NVARCHAR(250) NOT NULL ,
	Credit INT NOT NULL,
	NumberOfLesson INT NOT NULL ,
	Type NVARCHAR(250) ,
	UpdateTime DATETIME DEFAULT  GETDATE() ,
	Operation NVARCHAR(5) CHECK(Operation = 'INS' OR Operation ='DEL'OR Operation ='UPD')
)
*/

CREATE TRIGGER TR_StudentAudits_AfterInsertAndDeleteUpdate 
ON Subjects
AFTER INSERT, DELETE , UPDATE
AS
BEGIN
	INSERT INTO 
		SubjectAudits (
			SubjectId ,
			SubjectName,
			Credit ,
			NumberOfLesson ,
			Type ,
			Operation
		)
	SELECT
		ins.SubjectId,
		ins.Name,
		ins.Credit,
		ins.NumOfLesson,
		ins.Type,
		'INS'
	FROM 
		inserted ins
	WHERE
		ins.SubjectId NOT IN (
			SELECT
				SubjectId
			FROM
				deleted
			)
	UNION ALL
	SELECT
		del.SubjectId,
		del.Name,
		del.Credit,
		del.NumOfLesson,
		del.Type,
		'DEL'
	FROM
		deleted del
	WHERE
		del.SubjectId NOT IN (
			SELECT	
				SubjectId
			FROM
				inserted
			)
	UNION ALL
	SELECT
		ins.SubjectId,
		ins.Name,
		ins.Credit,
		ins.NumOfLesson,
		ins.Type,
		'UPD'
	FROM
		inserted ins
	WHERE
		ins.SubjectId IN (
			SELECT	
				SubjectId
			FROM
				deleted 
			)
END
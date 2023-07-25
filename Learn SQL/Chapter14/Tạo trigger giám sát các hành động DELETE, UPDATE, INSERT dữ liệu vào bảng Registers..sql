--Tạo trigger giám sát các hành động DELETE, UPDATE, INSERT dữ liệu vào bảng Registers
/*

CREATE TABLE RegisterAudits (
	PK_RegisterAuditId INT IDENTITY PRIMARY KEY ,
	RegisterId INT NOT NULL ,
	StudentId NVARCHAR(250) NOT NULL,
	SubjectId NVARCHAR(250) NOT NULL ,
	RegisterTime DATETIME  ,
	RegisterStatus NVARCHAR(200) ,
	UpdateTime DATETIME DEFAULT GETDATE() ,
	Operation NVARCHAR(5) CHECK(Operation ='INS' OR Operation ='DEL' OR Operation ='UPD')
)
*/
CREATE OR ALTER TRIGGER TR_RegisterAudits_AfterInsertAndDeleteUpdate 
ON Registers
AFTER INSERT ,DELETE ,UPDATE
AS
BEGIN
	INSERT INTO RegisterAudits (
		RegisterId,
		StudentId,
		SubjectId,
		RegisterTime,
		RegisterStatus,
		Operation 
	)
	SELECT 
		ins.RegisterId,
		ins.StudentId,
		ins.SubjectId,
		ins.RegisterTime,
		ins.RegisterStatus,
		'INS'
	FROM 
		inserted ins
	WHERE
		ins.RegisterId NOT IN (
			SELECT
				RegisterId
			FROM
				deleted
			)
	UNION ALL
	SELECT
		del.RegisterId,
		del.StudentId,
		del.SubjectId,
		del.RegisterTime,
		del.RegisterStatus,
	'DEL'
	FROM
		deleted del
	WHERE
		del.RegisterId NOT IN (
			SELECT
				RegisterId 
			FROM
				inserted
			)
	UNION ALL
	SELECT
		ins.RegisterId,
		ins.StudentId,
		ins.SubjectId,
		ins.RegisterTime,
		ins.RegisterStatus,
		'UPD'
	FROM
		inserted ins
	WHERE
		ins.RegisterId IN (
			SELECT
				RegisterId 
			FROM
				deleted
			)
END
--tạo bảng storeAudits để giám sát Stores sau  mỗi lần cập nhật 
/*
CREATE TABLE StoreAudits (
	PK_StoreAuditId INT IDENTITY(100,1) CONSTRAINT PK_StoreId PRIMARY KEY ,
	StoreId INT ,
	StoreName NVARCHAR(250),
	PhoneNumber NVARCHAR(250),
	Email NVARCHAR(250),
	Address NVARCHAR(250) ,
	Street NVARCHAR(250),
	District NVARCHAR(250),
	City NVARCHAR(250) ,
	TimeUpdate DATETIME DEFAULT GETDATE() ,
	Operation NVARCHAR(3),
	CONSTRAINT Check_Operation CHECK (Operation ='INS' OR Operation ='DEL')
	)

CREATE TRIGGER TR_StoreAudits_AfterInsertAndDelete 
ON Stores 
AFTER INSERT ,DELETE
AS 
BEGIN
	SET NOCOUNT ON 
	INSERT INTO StoreAudits(
		StoreId,
		StoreName,
		PhoneNumber,
		Email ,
		Address,
		Street,
		District ,
		City ,
		Operation
	)
	SELECT
		ins.StoreId,
		ins.StoreName,
		ins.Phone,
		ins.Email,
		ins.AddressNumber,
		ins.Street,
		ins.District,
		ins.City,
		'INS'
	FROM
	inserted ins
	UNION ALL
	SELECT
	del.StoreId,
	del.StoreName,
	del.Phone,
	del.Email,
	del.AddressNumber,
	del.Street,
	del.District,
	del.City,
	'DEL'
	FROM 
	deleted del
END
*/
--Tạo trigger giám sát các hành động DELETE, UPDATE, INSERT dữ liệu vào bảng Students.
/*
CREATE TABLE studentAudits (
	PK_StudentAuditsId INT IDENTITY PRIMARY KEY ,
	StudentId NVARCHAR(250),
	FirstName NVARCHAR(250) ,
	LastName NVARCHAR(250) ,
	MidName NVARCHAR(250) ,
	Address NVARCHAR(250) ,
	Major NVARCHAR(250) ,
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT ,
	TimeUpdate  DATETIME DEFAULT GETDATE() ,
	Operation NVARCHAR(3) ,
	CHECK(Operation = 'DEL ' OR Operation = 'INS')
)

*/
CREATE TRIGGER TR_StudentAudits_AfterInsertAndDelete
ON Students
AFTER INSERT ,DELETE
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO StudentAudits (
		StudentId ,
		FirstName ,
		LastName ,
		MidName ,
		Address ,
		Major ,
		BirthDate ,
		PhoneNumber ,
		Gpa ,
		Operation
	)
	SELECT
		ins.StudentId ,
		ins.FirstName,
		ins.LastName,
		ins.MidName,
		ins.Address,
		ins.Major,
		ins.BirthDate,
		ins.PhoneNumber,
		ins.Gpa,
		'INS'
	FROM 
		inserted ins
	UNION ALL
	SELECT
		del.StudentId ,
		del.FirstName,
		del.LastName,
		del.MidName,
		del.Address,
		del.Major,
		del.BirthDate,
		del.PhoneNumber,
		del.Gpa,
		'DEL'
	FROM
		deleted del
END
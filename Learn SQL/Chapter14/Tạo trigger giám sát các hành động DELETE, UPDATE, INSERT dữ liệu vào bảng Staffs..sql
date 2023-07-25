--Tạo trigger giám sát các hành động DELETE, UPDATE, INSERT dữ liệu vào bảng Staffs

/*
CREATE TABLE StaffAudits (
	PK_StaffAudtitId INT IDENTITY PRIMARY KEY ,
	StaffId INT NOT NULL ,
	FirstName NVARCHAR(250) NOT NULL,
	LastName NVARCHAr(250) NOT NULL ,
	Email NVARCHAR(250) NOT NULL ,
	PhoneNumber NVARCHAR(250) NOT NULL ,
	Active NVARCHAR(250) DEFAULT 'True' ,
	StoreId NVARCHAR(250) NOT NULL ,
	ManagerId NVARCHAR(250) ,
	UpdateTime DATETIME DEFAULT GETDATE(),
	Operation NVARCHAR(5) CHECK(Operation='DEL' OR Operation ='INS' OR Operation='UPD')
)
*/
CREATE TRIGGER TR_StaffAudits_AfterInsertAndDeleteUpdate 
ON Staffs
AFTER INSERT ,DELETE , UPDATE
AS
BEGIN
	
	INSERT INTO StaffAudits (
			StaffId ,
			FirstName,
			LastName ,
			Email,
			PhoneNumber,
			StoreId,
			ManagerId,
			Operation 
		)
	SELECT
		ins.StaffId,
		ins.FirstName ,
		ins.LastName,
		ins.Email,
		ins.PhoneNumber,
		ins.StoreId,
		ins.ManagerId,
		'INS'
	FROM
		inserted ins
	WHERE
		ins.StaffId NOT IN (
			SELECT
				StaffId 
			FROM
				deleted
			)
	UNION ALL
	SELECT
		del.StaffId,
		del.FirstName,
		del.LastName,
		del.Email,
		del.PhoneNumber,
		del.StoreId,
		del.ManagerId,
		'DEL'
	FROM
		deleted del
	WHERE
		del.StaffId NOT IN (
			SELECT	
				StaffId 
			FROM
				inserted
			)
	UNION ALL
	SELECT
		ins.StaffId,
		ins.FirstName,
		ins.LastName,
		ins.Email,
		ins.PhoneNumber,
		ins.StoreId,
		ins.ManagerId,
		'UPD'
	FROM 
		inserted ins
	WHERE
		ins.StaffId IN (
			SELECT
				StaffId
			FROM
				deleted
			)
END
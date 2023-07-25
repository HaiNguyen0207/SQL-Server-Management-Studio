--Tạo INSTEAD OF trigger cho hành động sửa thông tin một sinh viên trong bảng Students.
--Dữ liệu cần được lưu vào bảng StudentUpdateApprovals trước khi chính thức được cập nhật vào bảng Students.

--Tạo bảng StudentUpdateApprovals
/*
CREATE TABLE StudentUpdateApprovals (
	PK_StudenUpdateId INT IDENTITY PRIMARY KEY,
	StudentId NVARCHAR(250),
	FirstName NVARCHAR(250) ,
	LastName NVARCHAR(250) ,
	MidName NVARCHAR(250) ,
	Address NVARCHAR(250) ,
	Major NVARCHAR(250),
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT ,
	UpdateTime DATETIME DEFAULT GETDATE(),
	Operation NVARCHAR(5) DEFAULT 'UPD'

)

*/

--Tạo view StudentUpdate
/*
CREATE VIEW vw_StudentUpdateApprovals
AS
SELECT
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.MidName,
	Students.Address,
	Students.Major,
	Students.BirthDate,
	Students.PhoneNumber,
	Students.Gpa,
	'Approved' ApprovalStatus
FROM
	Students
UNION ALL
SELECT
	StudentUpdateApprovals.StudentId,
	StudentUpdateApprovals.FirstName,
	StudentUpdateApprovals.LastName,
	StudentUpdateApprovals.MidName,
	StudentUpdateApprovals.Address,
	StudentUpdateApprovals.Major,
	StudentUpdateApprovals.BirthDate,
	StudentUpdateApprovals.PhoneNumber,
	StudentUpdateApprovals.Gpa,
	StudentUpdateApprovals.ApprovalStatus
FROM
	StudentUpdateApprovals
*/

--Tao trigger

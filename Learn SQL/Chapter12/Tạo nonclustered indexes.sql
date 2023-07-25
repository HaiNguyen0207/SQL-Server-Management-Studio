/*
CREATE INDEX IX_Students_PhoneNumber
ON Students (PhoneNumber)

SELECT
	*
FROM
	Students
WHERE
	Students.Gpa =3.36

--Ví dụ 2: tạo chỉ mục không phân cụm gồm 2 cột.

CREATE INDEX IX_Students_FullName
ON Students(LastName ,MidName,Firstname)

SELECT
	*
FROM
	Students
WHERE
	Students.LastName =N'Trần'
*/
--Tạo chỉ mục không phân cụm cho cột email,
--số điện thoại của nhân viên trong bảng Staffs và tiến hành truy vấn theo hai cột này.
/*
CREATE INDEX IX_Staffs_EmailAndPhoneNumberEmp
ON Staffs(Email,PhoneNumber)

SELECT
	*
FROM
	Staffs
WHERE
	Staffs.PhoneNumber = '0978655644'
	AND
	Staffs.Email =N'hongle@xmail.com'
*/
--Tạo chỉ mục không phân cụm cho cột ManagerId trong bảng Staffs và truy vấn theo cột này.
/*
CREATE INDEX IX_Staffs_ManagerId
ON Staffs(ManagerId)

SELECT
	*
FROM
	Staffs
WHERE
	Staffs.ManagerId = 15
*/
-- đổi tên 
/*
EXEC sp_rename 
	@objname = N'dbo.Staffs.IX_Staffs_EmailAndPhoneNumberEmp',
	@newname = N'IX_Staffs_PhoneNumber',
	@objtype = N'INDEX'
*/
--Vô hiệu hóa index
/*
ALTER INDEX index_name 
ON table_name 
DISABLE;
--

ALTER INDEX ALL ON  Staffs DISABLE
*/

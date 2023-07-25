--Tạo view chứa thông tin về các khách hàng:
/*
CREATE VIEW CustomerInfor
AS
SELECT
	*
FROM
	Customers
*/

-- Xem thông tin trong bảng customerInfor
/*
SELECT
	*
FROM
	CustomerInfor
*/

--Ví dụ sau tạo view chứa thông tin đăng ký của từng sinh viên:
/*
CREATE VIEW VW_StudentsRegister
AS
SELECT
	s.StudentId ,
	s.lastName +' ' + s.FirstName fullName,
	s.Address ,
	sub.SubjectId,
	sub.Name,
	r.RegisterTime
FROM	
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
	JOIN
	Subjects sub
	ON
	sub.SubjectId = r.SubjectId
*/
--xem thông tin bảng StudentsRegister
/*
SELECT
	*
FROM
	VW_StudentsRegister
ORDER BY
	StudentId
*/
--Tạo view chứa thông tin các môn học trong bảng Subjects.
/*
CREATE VIEW 
	SubjectsInfor
AS
SELECT
	*
FROM
	Subjects

--Xem

SELECT
	*
FROM
	SubjectsInfor
*/
--Tạo view chứa thông tin các cửa hàng trong bảng Stores.
/*
CREATE VIEW
	VW_StoresInfor
AS
SELECT
	*
FROM
	Stores

--Xem
SELECT
	*
FROM
	VW_StoresInfor
*/
--Tạo view cho biết tên nhân viên quản lý và danh sách nhân viên dưới quyền của họ.
/*
CREATE VIEW
	VW_ManagersStaffs
AS
SELECT
	s1.StaffId ManagerId,
	s1.LastName+' ' +s1.FirstName NameManager,
	s2.StaffId StaffId,
	s2.LastName+' ' +s2.FirstName NameStaff
FROM
	Staffs s1
	JOIN
	Staffs s2
	ON
	s1.StaffId = s2.ManagerId
*/
--Xem thông tin bảng VW_ManagersStaffs
/*
SELECT
	*
FROM
	VW_ManagersStaffs
*/
--Tạo view cho biết số lượng môn học đăng ký của từng sinh viên.
/*
CREATE VIEW
	VW_NumberOfSubjectsRegister
AS
SELECT
	s.StudentId,
	s.LastName+' ' +s.Midname+' ' +s.FirstName fullName,
	COUNT(r.subjectId)	numberOfSubject
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
GROUP BY
	s.StudentId,
	s.LastName+' ' +s.Midname+' ' +s.FirstName 

	--XEm thoong tin
SELECT
	*
FROM
	VW_NumberOfSubjectsRegister
ORDER BY
	numberOfSubject
*/
--Tạo view cho biết số lượng đăng ký của từng môn học.
/*
CREATE VIEW
	VW_NumberOfStudensRegister
AS
SELECT
	sub.SubjectId,
	sub.name,
	COUNT(r.StudentId) numberOfStudent
FROM	
	Subjects sub
	JOIN
	Registers r
	ON
	sub.subjectId = r.SubjectId
GROUP BY
	sub.SubjectId,
	sub.name
*/
--Tạo view cho biết sinh viên nào đăng ký môn học sớm nhất.
/*
CREATE VIEW
	VW_RegisterStudentsEarly
AS
SELECT TOP 1 WITH TIES
	s.StudentId,
	s.LastName+' ' +s.Midname+' ' +s.FirstName fullName,
	r.subjectId,
	sub.name NameSubject,
	r.RegisterTime
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
	JOIN
	Subjects sub
	ON
	sub.SubjectId = r.SubjectId
ORDER BY
	r.RegisterTime

SELECT
	*
FROM
	VW_RegisterStudentsEarly
*/
--Tạo view cho biết môn học nào được đăng ký sớm nhất.
--Tạo view cho biết sinh viên nào không đăng ký môn học.
/*
CREATE VIEW
	VW_StudentsNotRegister
AS
SELECT
	s.*
FROM
	Students s
WHERE
	s.StudentId NOT IN	(
		SELECT	
			r.StudentId
		FROM
			Registers r
			)
*/--Tạo view cho biết môn học nào không có sinh viên đăng ký.
/*
CREATE VIEW
	VW_SubjectNotRegister
AS
SELECT
	sub.*
FROM
	Subjects sub
WHERE
	sub.SubjectId NOT IN(
		SELECT	
			r.SubjectId
		FROM
			Registers r
		)
*/
--Tạo view tính hoa hồng, tổng lương cho các nhân viên có mặt trong bảng Salaries.
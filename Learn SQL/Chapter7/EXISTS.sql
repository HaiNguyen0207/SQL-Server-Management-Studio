--Hãy cho biết các sinh viên đã đăng ký nhiều hơn 2 môn học và số lượng đăng ký tương ứng:
/*
SELECT
	s.*,
	r.*
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
*/
/*
SELECT
	s.StudentId,
	s.LastName +' '+ s.MidName +' '+ s.FirstName fullName,
	(
		SELECT	
			COUNT(r.studentId)
			FROM
				Registers r
			GROUP BY
				r.StudentId
			HAVING
				COUNT(r.studentId) >2
				AND
				s.StudentId = r.StudentId
	) numberOfStudent
FROM
	Students s
WHERE	
	EXISTS(SELECT  NULL)
*/
--Hãy cho biết các sinh viên đã đăng ký nhiều hơn 2 môn học và số lượng đăng ký tương ứng:
/*
SELECT
	s.StudentId,
	s.LastName +' '+ s.MidName+' '+ s.firstName fullName,
	COUNT(r.subjectId) numberOfSubject
FROM
	Students s
	jOIN
	Registers r
	ON
	s.StudentId = r.StudentId
GROUP BY
	s.StudentId,
	s.LastName +' '+ s.MidName+' '+ s.firstName 
HAVING
	COUNT(r.SubjectId) > 2
ORDER BY
	COUNT(r.SubjectId)
*/
/*
SELECT
    StaffId,
    LastName + ' ' + FirstName AS FullName,
    PhoneNumber
FROM
    Staffs
ORDER BY
    StaffId
*/
--Từ bảng Staffs, hãy cho biết tên các nhân viên làm việc tại Hà Nội.
/*
SELECT
	sta.*,
	sto.City Workplace
FROM
	Staffs sta
	JOIN
	Stores sto
	ON
	sta.StoreId= sto.StoreId
WHERE
	sto.City =N'Hà Nội '
*/
/*
SELECT
	sta.*
FROM
	Staffs sta
WHERE
	EXISTS(
		SELECT	
			sta.StoreId
		FROM
			Stores sto
		WHERE	
			sto.City =N'Hà Nội '
			AND
			sto.StoreId = sta.StoreId
	)
*/
--Từ bảng Stores, hãy cho biết các cửa hàng có địa chỉ ở quận Cầu Giấy hoặc Nam Từ Liêm hoặc Quận 6.
/*
SELECT
	sto.*
FROM
	Stores sto
WHERE
	EXISTS(SELECT NULL)
	AND
	sto.District =N'Nam Từ Liêm '
	OR
	sto.District =N'Cầu Giấy '
	OR
	sto.District =N' Quận 6'
*/

/*
SELECT
	sto.*
FROM
	Stores sto
WHERE
	EXISTS(
		SELECT	
			sto.StoreId
		WHERE
			sto.District =N'Nam Từ Liêm '
			OR
			sto.District =N'Cầu Giấy '
			OR
			sto.District =N'Quận 6'
				
	)
*/
--Từ bảng Subject, Register, hãy cho biết những môn học nào có số lượng sinh viên đăng ký > 2.
/*
SELECT
	sub.SubjectId,
	sub.Name,
	COUNT(r.studentId) numberOfStudent
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
GROUP BY
	sub.SubjectId,
	sub.Name
HAVING
	COUNT(r.studentId) >2
*/
--Từ bảng Student, Register, Subject, hãy cho biết những sinh viên nào đăng ký từ 2 môn học trở lên 
--và cho biết đó là những môn học nào?
/*
SELECT
	s.StudentId,
	s.LastName +' '+ s.MidName+' ' +s.FirstName fullName,
	sub.SubjectId,
	sub.Name subjectName
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
	JOIN
	Subjects sub
	ON
	r.SubjectId =sub.SubjectId
WHERE	
	s.StudentId IN(
		SELECT	
			Students.StudentId
		FROM
			Students 
			JOIN
			Registers
			ON
			Students.StudentId = Registers.StudentId
			JOIN
			Subjects
			ON
			Subjects.SubjectId = Registers.SubjectId
		GROUP BY
			Students.StudentId
		HAVING
			COUNT(Registers.SubjectId ) >2		
			)
ORDER BY
	s.StudentId

*/
--Từ bảng Staffs và Stores hãy cho biết tên cửa hàng, tên quản lý và số lượng nhân viên dưới quyền của quản lý đó
--nếu người đó quản lý từ 3 nhân viên trở lên.
SELECT	
	sto.Storename,
	sta.StaffId ,
	sta.Lastname +' ' + sta.Firstname nameManager
FROM
	Stores sto
	JOIN
	Staffs sta
	ON
	sto.StoreId = sta.StoreId
WHERE
	EXISTS(
		SELECT
			s1.StaffId
		FROM
			Staffs s1
			JOIN
			Staffs s2
			ON
			s1.StaffId =s2.ManagerId
		GROUP BY
			s1.StaffId
		HAVING
			COUNT(s2.ManagerId) > 2
			AND
			sta.StaffId =s1.StaffId
		)
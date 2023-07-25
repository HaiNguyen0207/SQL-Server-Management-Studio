--Hãy cho biết các tháng sinh có từ 2 sinh viên trở lên.
--Kết quả sắp xếp giảm dần theo số lượng sinh viên.
/*
SELECT	
	MONTH(s.BirthDate) MonthDate,
	COUNT(s.StudentId) numberOfStudent
FROM
	Students s
GROUP BY
	MONTH(s.BirthDate)
HAVING
	COUNT(s.StudentId) >= 2
ORDER BY
	COUNT(s.StudentId) DESC
*/

	
--Hãy cho biết thông tin các sinh viên đăng ký từ 2 môn học trở lên.
--Kết quả sắp xếp giảm dần theo số lượng môn học đã đăng ký.
/*
SELECT
	Students.*
FROM
	Students
WHERE
	EXISTS(
			SELECT
			s.StudentId,
			s.LastName +' '+ s.MidName+' ' + s.FirstName fullName,
			COUNT(r.SubjectId) numberOfSubject
		FROM
			Students s
			JOIN
			Registers r
			ON
			s.StudentId = r.StudentId
			JOIN
			Subjects sub
			ON
			r.SubjectId = sub.SubjectId
		GROUP  BY
			s.StudentId,
			s.LastName +' '+ s.MidName+' ' + s.FirstName
		HAVING
			COUNT(r.SubjectId ) >= 2 
			AND
			Students.StudentId = s.StudentId
		)
*/
--Hãy cho biết thông tin các sinh viên chỉ đăng ký 1 môn học
/*
SELECT
	s.StudentId,
	s.LastName +' '+ s.MidName+' ' + s.FirstName fullName
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId = r.StudentId
	JOIN
	Subjects sub
	ON
	r.SubjectId = sub.SubjectId
GROUP BY
	s.StudentId,
	s.LastName +' '+ s.MidName+' ' + s.FirstName
HAVING
	COUNT(r.SubjectId) = 1
*/
--Hãy cho biết thông tin các sinh viên không đăng ký môn học.
/*
SELECT
	Students.*
FROM
	Students
WHERE
	Students.StudentId NOT IN (
		SELECT
			s.StudentId
		FROM
			Students s
			JOIN
			Registers r
			ON
			s.StudentId = r.StudentId
			JOIN
			Subjects sub
			ON
			r.SubjectId = sub.SubjectId
			)
*/
--Hãy cho biết thông tin các nhân viên làm cùng cửa hàng có mã cửa hàng là 5.
/*
SELECT
	sta.*
FROM
	Staffs sta
WHERE
	sta.StoreId = 5
*/
--
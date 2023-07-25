--Hãy cho biết mã, họ, tên các sinh viên đã đăng ký ít nhất một môn học. Kết quả không được phép trùng lặp.
/*
SELECT DISTINCT
	s.Id,
	s.LastName,
	s.FirstName
FROM
	Student s
	JOIN
	Register r
	ON	
	s.Id =r.StudentId
*/
--Hãy cho biết mã, tên các sinh viên không đăng ký bất kỳ môn học nào. Kết quả không hiển thị trùng lặp
/*
SELECT	DISTINCT
	s.Id,
	s.FirstName
From
	Student s
WHERE
	s.Id NOT IN(
		SELECT DISTINCT	
			s.Id
		FROM
			Student s
			JOIN
			Register r
			ON
			s.Id = r.StudentId
	)
*/

-- Hãy cho biết sinh viên Trần Dũng mã B25DCCN101 đăng ký những môn học nào.
/*
SELECT DISTINCT
	s.Id,
	s.LastName,
	s.FirstName,
	sub.Name SubjectName
FROM
		Student s
		JOIN
		Register r
		ON
		s.Id =r.StudentId
		JOIN
		Subject sub	
		ON
		sub.Id =r.SubjectId
WHERE
	s.Id='B25DCCN101 '
*/

--Hãy cho biết số lượng môn học từng sinh viên đăng ký. Sắp xếp giảm dần theo số lượng đăng ký.
/*
SELECT DISTINCT	
	s.Id,
	s.LastName,
	s.FirstName,
	COUNT(sub.ID) NumberRegisted
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id =r.StudentId
	JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
GROUP BY
	s.Id,
	s.LastName,
	s.FirstName
ORDER BY
	COUNT(sub.Id) DESC

*/

--Hãy cho biết thông tin các môn học có sinh viên đăng ký.
/*
SELECT DISTINCT
	sub.*
FROM
	Register r
	JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id

*/
-- Hãy cho biết thông tin các môn học không có bất kỳ sinh viên nào đăng ký.
/*

SELECT DISTINCT
	sub.*
FROM
	Subject sub
WHERE
	 sub.id NOT IN(
		SELECT DISTINCT
			sub.Id
		FROM
			Subject sub
			JOIN
			Register r
			ON
			r.SubjectId		=sub.Id
	)
*/

--Hãy cho biết thông tin những sinh viên đăng ký môn học X. như C#
/*
SELECT DISTINCT 
	s.*,
	sub.Name  subjectName
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId 
	JOIN
	Subject sub
	ON
	r.SubjectId =sub.id
WHERE
	sub.Name ='C#'

*/

--Hãy cho biết thông tin sinh viên đăng ký nhiều môn học nhất.
/*
SELECT DISTINCT	
	s.Id,
	sub.Name
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id =r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id =r.SubjectId

WHERE
	s.Id='B25DCCN101'
	OR
	s.Id='B25DCQT150'

*/
--Hãy cho biết thông tin môn học được đăng ký nhiều nhất.
/*
SELECT TOP 1 WITH TIES
	sub.Id,
	sub.Name,
	COUNT(sub.Id)
FROM
	Student s
	JOIN 
	Register r 
	ON 
	s.Id =r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id =r.SubjectId
GROUP BY
	sub.Id,
	sub.Name
ORDER BY
	COUNT(sub.Id) DESC
*/

SELECT DISTINCT	
	s.*,
	sub.Name
FROM
	Student s
	JOIN
	Register r 
	ON
	s.Id =r.StudentId 
	JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
WHERE
	sub.Name ='C++'


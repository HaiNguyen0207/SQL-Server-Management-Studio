--Lệnh truy vấn sau cho biết các sinh viên đã đăng ký môn học, 
--chưa đăng ký môn học nào và cả mã môn học chưa được đăng ký bởi bất kì sinh viên nào:
/*
SELECT	
	s.Id,
	s.LastName,
	s.FirstName,
	sub.ID,
	sub.Name,
	r.StudentId,
	r.SubjectId
FROM
	Student s
	FULL OUTER JOIN
	Register r
	ON
	s.Id =r.StudentId
	FULL OUTER JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
*/

--Hãy cho biết các môn học không có sinh viên đăng ký?
/**
SELECT
	sub.*,
	r.SubjectId
FROM	
	Register r
	FULL OUTER JOIN 
	Subject sub
	ON
	r.SubjectId = sub.Id
WHERE
	r.SubjectId IS NULL
*/

--Hãy cho biết các sinh viên không đăng ký môn học?
/*
 SELECT
	s.*,
	r.StudentId
FROM
	Student s
	FULL OUTER JOIN
	Register r
	ON
	r.StudentId =s.Id
WHERE
	r.StudentId IS NULL

*/
--Hãy cho biết tên, mã các môn học không có sinh viên đăng ký và tên, mã các sinh viên không đăng ký môn học.
/*

SELECT 
	sub.Id,
	sub.Name,
	s.id,
	s.FirstName
FROM
	Student s
	FULL OUTER JOIN
	Register r
	ON
	s.Id =r.StudentId
	FULL OUTER JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
WHERE
	r.SubjectId IS NULL
	AND
	r.StudentId IS NULL
*/

--Hãy cho biết mã, tên sinh viên, mã, tên môn học các sinh viên đã đăng ký.
SELECT
	s.Id,
	s.LastName,
	s.MidName,
	s.FirstName,
	sub.ID,
	sub.Name,
	r.studentID,
	r.subjectID
FROM
	Student s
	FULL OUTER JOIN
	Register r 
	ON
	s.Id =r.StudentId 
	FULL OUTER JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
WHERE
	r.StudentId IS NOT NULL
	AND
	r.SubjectId IS NOT NULL
--Hãy cho biết những sinh viên nào đăng ký ít nhất một môn học:
/*
SELECT DISTINCT
	 s.*
FROM
	Register r
	LEFT JOIN
	Student s
	ON
	r.StudentId =s.Id

--
SELECT DISTINCT
	s.*
FROM
	Student s
	LEFT JOIN
	Register r
	ON
	r.StudentId =s.Id
WHERE
	r.StudentId IS NOT NULL
*/
--Hãy cho biết những sinh viên nào không đăng ký bất kì môn học nào:
/*
SELECT DISTINCT
	s.*
FROM
	Student s
	LEFT JOIN
	Register r
	ON
	s.Id=r.StudentId
WHERE
	r.StudentId IS NULL
*/

--Hãy cho biết thông tin sinh viên mã B225DCCN101 và
--thông tin các môn học sinh viên đó đăng ký xếp theo thứ tự đăng ký từ sớm đến muộn.
/*
SELECT DISTINCT
	s.Id,
	s.LastName,
	s.firstName,
	sub.*,
	r.RegisterTime
FROM
	Student s
	LEFT JOIN
	Register r
	ON
	s.Id = r.StudentId
	LEFT JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
WHERE
	s.Id = 'B25DCCN101'
ORDER BY
	r.RegisterTime ASC
 */
 --Hãy cho biết các môn học có ít nhất 1 sinh viên đăng ký.
 /*
 SELECT DISTINCT
	sub.*,
	r.SubjectId
FROM
		Register r
		LEFT JOIN 
		Subject sub
		ON
		r.SubjectId =sub.Id
*/

--Hãy cho biết số lượng sinh viên đăng ký của từng môn học.
/*
SELECT DISTINCT
	sub.Id,
	sub.Name,
	COUNT(sub.Id) NumberStudentRegister
FROM	
	Student s 
	LEFT JOIN 
	Register r 
	ON	
	s.Id =r.StudentId
	LEFT JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
WHERE
	r.StudentId IS NOT NULl
	AND
	r.SubjectId IS NOT NULL
GROUP BY
	sub.Id,
	sub.Name
*/
--Hãy cho biết danh sách các sinh viên đăng ký môn học SUBJ1001.

SELECT DISTINCT
	s.*,
	sub.Id,
	r.StudentId
FROM
	Student s
	LEFT JOIN
	Register r
	ON
	s.Id =r.StudentId 
	LEFT JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
WHERE
	r.SubjectId IS NOT NULL
	AND
	r.StudentId IS NOT NULL
	AND
	sub.Id ='SUBJ1001'



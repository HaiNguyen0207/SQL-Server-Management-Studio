--Ví dụ sau sẽ liệt kê kết quả RIGHT JOIN giữa bảng Register và Subject:
/*
SELECT 
	sub.*,
	r.*
FROM	
	Register r
	RIGHT JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
*/
--Hãy cho biết các môn học không có sinh viên nào đăng ký.
/*
SELECT DISTINCT
	sub.*
FROM
	Register r
	RIGHT JOIN
	Subject sub
	ON
	r.SubjectId = sub.Id
WHERE 
	r.SubjectId IS  NULL
*/
--Hãy cho biết các môn học có ít nhất 1 sinh viên đăng ký. Kết quả không được phép trùng lặp.
/*
SELECT DISTINCT
	sub.*
FROM
	Register r
	RIGHT JOIN
	Subject sub
	ON
	r.SubjectId = sub.Id
WHERE 
	r.SubjectId IS NOT NULL
*/

--Hãy cho biết số lượng sinh viên đăng ký của từng môn học sắp xếp theo số lượng đăng ký giảm dần.
/*
SELECT DISTINCT
	s.ID,
	s.LastName,
	s.FirstName,
	COUNT(s.Id) numerStudents
FROM
	Student s
	RiGHT JOIN
	Register r
	ON
	s.id =r.StudentId
	RIGHT JOIN
	Subject sub
	ON
	sub.Id =r.SubjectId

WHERE
	r.SubjectId IS NOT NULL
	AND
	r.StudentId IS NOT NULL
GROUP BY
	s.ID,
	s.LastName,
	s.FirstName
ORDER BY
	COUNT(s.ID) DESC

*/
--Hãy cho biết môn học SUBJ1001 có những sinh viên nào đăng ký. Sắp xếp theo thời gian đăng ký từ sớm->muộn.
/*
SELECT 
	s.*,
	sub.Id,
	r.RegisterTime
FROM	
	Student s
	RIGHT JOIN
	Register r
	ON
	s.Id =r.StudentId
	RIGHT JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId 
WHERE	
	r.StudentId IS NOT NULL
	AND
	r.SubjectId IS NOT NULL
	AND
	sub.id ='SUBJ1001'
ORDER BY
	r.RegisterTime
*/
--Hãy cho biết những sinh viên nào không đăng ký môn học.
/*
SELECT DISTINCT
	s.*,
	r.StudentID
FROM
	Student s
	RIGHT JOIN
	Register r
	ON
	s.Id =r.StudentId
WHERE
	r.StudentId IS NOT NULL
*/
--Hãy cho biết những sinh viên nào đăng ký từ 2 môn học trở lên.
SELECT 
	s.Id,
	s.LastName,
	s.FirstName,
	sub.Id
FROM
	Student s
	RIGHT JOIN
	Register r 
	ON
	s.Id =r.StudentId 
	RIGHT JOIN
	Subject sub
	ON
	r.SubjectId =sub.Id
WHERE
	r.SubjectId IS NOT NULL
	AND
	r.StudentId IS NOT NULL
ORDER BY
	s.Id
	
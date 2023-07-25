/*
SELECT
	s.StudentId
INTO
	#ITStudent
FROM
	Students s
WHERE
	Major ='CNTT'
*/
--truy xuat du lieu
/*
SELECT
	*
FROM
	#ITStudent
*/
SELECT
	Students.*
FROM
	Students
	JOIN
	#ITSTudent
	ON
	Students.StudentId = #ITStudent.StudentId
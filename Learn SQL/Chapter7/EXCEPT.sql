--Hãy cho biết thông tin các sinh viên không đăng ký môn học
/*
SELECT
	*
FROM
	Students
WHERE
	Students.StudentId IN(
		SELECT
			s.studentId
		FROM
			Students s
		EXCEPT
		SELECT
			r.studentId
		FROM
			Registers r
			)
*/
--Hãy cho biết tên các quận của khách hàng không có cửa hàng công nghệ?
/*
SELECT
	ctu.District
FROM
	 Customers ctu
EXCEPT
SELECT
	sto.District
FROM
	 Stores sto
*/
--Hãy cho biết các môn học không có sinh viên đăng ký?
/*
SELECT
	*
FROM
	Subjects
WHERE
	Subjects.SubjectId IN(
		SELECT
			sub.SubjectId
		FROM
			Subjects sub
		EXCEPT
		SELECT
			r.subjectId
		FROM
			Registers r
			)
*/
--Hãy cho biết sinh viên nào đã đăng ký nhưng không đăng ký môn học C++?
/*
SELECT
	*
FROM
	Students
WHERE
	Students.StudentId IN(
	SELECT
		r.StudentId
	FROM
		Registers r
	EXCEPT
	SELECT
		r1.studentId
	FROM
		Registers r1
	WHERE
		r1.SubjectId = (
			SELECT	
				sub.subjectId
			FROM
				Subjects sub
			WHERE
				sub.Name ='C++ '
				)
			)
*/
--Hãy cho biết các khách hàng nào không có cửa hàng công nghệ trong cùng quận?
/*
SELECT
	 *
FROM
	Customers
WHERE
	Customers.District IN(
	SELECT
		ctu.District
	FROM
		Customers ctu
	EXCEPT
	SELECT
		sto.District
	FROM
		Stores sto
		)
*/
--Hãy cho biết những sinh viên nào đã đăng ký từ 3 môn học trở lên?
--Sắp xếp giảm dần theo số lượng môn học đã đăng ký?
SELECT
	s.StudentId,
	s.LastName+' '+ s.MidName +' '+s.FirstName fullName,
	COUNT(r.subjectId) numberOfSubject
FROM
	Students s
	JOIN
	Registers r
	ON
	s.StudentId =r.StudentId
GROUP BY
	s.StudentId,
	s.LastName+' '+ s.MidName +' '+s.FirstName
HAVING
	s.StudentId NOT IN (
	SELECT
		r.studentId
	FROM
		Registers r
	GROUP BY
		r.StudentId
	HAVING
		COUNT(r.subjectId) > 0
	EXCEPT
	SELECT
		r1.studentId
	FROM
		Registers r1
	GROUP BY
		r1.StudentId
	HAVING
		COUNT(r1.subjectId) >=3
		)
ORDER BY
	COUNT(r.SubjectId) DESC
	
		


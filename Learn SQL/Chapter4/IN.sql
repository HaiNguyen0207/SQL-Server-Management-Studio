/*
Cho biết thông tin môn học có số tín chỉ là 3.
Cho biết thông tin môn học được đăng ký bởi sinh viên mã X và thời gian đăng ký tương ứng.
Cho biết thông tin các sinh viên đăng ký các môn học có 3 tín chỉ.
Cho biết thông tin các sinh viên có điểm TB >= 3.2 và đăng ký các môn học có số tín chỉ >= 3.
Cho biết các sinh viên không đăng ký môn học nào.
Cho biết các môn học không được sinh viên nào đăng ký.

 -- Task 1 : Cho biết thông tin môn học có số tín chỉ là 3.
 
 SELECT
	*
FROM
	Subject
WHERE	
	Subject.Id IN(
		SELECT
			Subject.Id
		FROM	
			Subject
		WHERE	
			Subject.Credit  =3
	)
*/

--Cho biết thông tin môn học được đăng ký bởi sinh viên mã X và thời gian đăng ký tương ứng.
/*
SELECT
	Subject.*,
	Register.RegisterTime
FROM
	Subject,
	Register

WHERE
	Subject.Id IN(
		SELECT
				Register.SubjectId
		FROM	
				Register
		WHERE	
			Register.StudentId ='B25DCCN101'
			)
*/
/*
SELECT
	Subject.*,
	Register.RegisterTime
FROM
	Subject,
	Register
WHERE	
	Register.StudentId='B25DCCN101'
	AND
	Register.SubjectId = Subject.Id
*/

--Cho biết thông tin các sinh viên đăng ký các môn học có 3 tín chỉ.
/*
SELECT
	Student.*
FROM
	Student
WHERE
	Student.Id IN(
		SELECT
			Register.StudentId
		FROM	
			Register,
			Subject
		WHERE
			Register.SubjectId =Subject.Id
		AND
			Subject.Credit =3
					)
*/

--Cho biết các sinh viên không đăng ký môn học nào.
/*
SELECT	
	Student.*
FROM
	Student
WHERE
	Student.Id NOT IN(
		SELECT 
			Register.StudentId
		FROM
			Register
				)
*/
--Cho biết các môn học không được sinh viên nào đăng ký.
SELECT	
	Subject.*
FROM
	Subject
WHERE
	Subject.Id NOT IN(
		SELECT 
			Register.SubjectId
		FROM
			Register
				)


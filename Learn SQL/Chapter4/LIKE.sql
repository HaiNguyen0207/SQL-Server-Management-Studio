/*
Cho biết thông tin các môn học trong tên có chữ ‘c’.
Cho biết mã, tên các sinh viên đăng ký môn C++ mà trong tên sinh viên có chữ ‘n’.
Cho biết mã, tên, điểm TB các sinh viên trong danh sách có họ không bắt đầu với chữ ‘h’, ‘n’ hoặc ‘t’.
Cho biết thông tin các sinh viên đăng ký môn SQL mà học CNTT, trong tên có chữ ‘h’ và có điểm TB dạng 3.6x với x từ 0-9.
*/

--Task 1: Cho biết thông tin các môn học trong tên có chữ ‘c’.
/*
SELECT 
	Subject.*
FROM
	Subject
WHERE	
	Subject.Name LIKE N'%c%'
*/
--Cho biết mã, tên các sinh viên đăng ký môn C++ mà trong tên sinh viên có chữ ‘n’.
/*
SELECT	
	Student.Id,
	Student.FirstName
FROM
	Student
WHERE 
	Student.Id IN(
	
			SELECT	
				Register.StudentId
			FROM
				Register,
				Student,
				Subject
			WhERE
				Register.StudentId =Student.Id
			AND
				Register.SubjectID=Subject.Id
			AND
				Subject.Name =N'C++'
					)
	AND
	Student.FirstName LIKE N'%n%'

*/

--Task 3 : Cho biết mã, tên, điểm TB các sinh viên trong danh sách có họ không bắt đầu với chữ ‘h’, ‘n’ hoặc ‘t’.
/*
SELECT
	Student.Id,
	Student.FirstName,
	Student.LastName,
	Student.MidName,
	Student.Gpa
FROM
	Student
WHERE
	Student.LastName NOT LIKE N'h%'
	OR
	Student.LastName NOT LIKE N'n%'
	OR
	Student.LastName NOT LIKE N't%'
*/

--Task 4 : Cho biết thông tin các sinh viên đăng ký môn SQL mà học CNTT, trong tên có chữ ‘h’ và 
--có điểm TB dạng 3.6x với x từ 0-9.
SELECT
	Student.*
FROM	
	Student
WHERE
	Student.Id IN(
			SELECT
				Register.StudentId
			FROM
				Student,
				Register,
				Subject
			WHERE	
				Register.StudentId =Student.Id
			AND
				Register.SubjectId =Subject.Id
			AND
				Subject.Name =N'SQL'
				)
		AND
		Student.FirstName LIKE N'%h%'

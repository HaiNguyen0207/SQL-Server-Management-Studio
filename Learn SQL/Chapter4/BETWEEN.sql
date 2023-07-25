/*
where datepart(hour,thoigian)=00 and datepart(minute,thoigian) between 00 and 59
where datepart(hour,thoigian)=01 and datepart(minute,thoigian) between 00 and 59

Cho biết các sinh viên đăng ký môn học trong khoảng thời gian từ 00:00 đến  00:59.
Cho biết các môn học được đăng ký trong thời gian từ 01:00 đến 01:59.
Cho biết các sinh viên không đăng ký môn học trong thời gian từ 00:00 đến 01:59.
Cho biết các môn học không được sinh viên nào đăng ký trong khoảng thời gian từ 01:00 đến 01:59.

*/
--Task 1:Cho biết các sinh viên đăng ký môn học trong khoảng thời gian từ 00:00 đến  00:59.
/*
SELECT
	Student.*
FROM
	Student
WHERE 
	Student.Id IN(
			SElECT	
				Register.StudentId
			FROM
				Register
			WHERE	
				DATEPART(HOUR ,Register.RegisterTime)=00 
				AND
				DATEPART(MINUTE ,Register.RegisterTime)  BETWEEN 00 AND 59
				)

*/
--Task2 :Cho biết các môn học được đăng ký trong thời gian từ 01:00 đến 01:59.
/*
SELECT
	Student.*
FROM
	Student
WHERE 
	Student.Id IN(
			SElECT	
				Register.StudentId
			FROM
				Register
			WHERE	
				DATEPART(HOUR ,Register.RegisterTime)=1
				AND
				DATEPART(MINUTE ,Register.RegisterTime)  BETWEEN 00 AND 59
				)
*/
--Task 3: Cho biết các sinh viên không đăng ký môn học trong thời gian từ 00:00 đến 01:59.
/*
SELECT
	Student.*
FROM
	Student
WHERE 
	Student.Id NOT IN(
			SElECT	
				Register.StudentId
			FROM
				Register
			WHERE	
				DATEPART(HOUR ,Register.RegisterTime) BETWEEN 0 AND 1
				AND
				DATEPART(MINUTE ,Register.RegisterTime)  BETWEEN 00 AND 59
				)
*/
--Task4 :Cho biết các môn học không được sinh viên nào đăng ký trong khoảng thời gian từ 01:00 đến 01:59.
SELECT
	Subject.*
FROM
	Subject
WHERE 
	Subject.Id NOT IN(
			SElECT	
				Register.SubjectId
			FROM
				Register
			WHERE	
				DATEPART(HOUR ,Register.RegisterTime) =1
				AND
				DATEPART(MINUTE ,Register.RegisterTime)  BETWEEN 00 AND 59
				)
--Cho biết điểm Gpa lớn nhất và nhỏ nhất của các sinh viên trong danh sách theo tháng sinh.
/*
SELECT DISTINCT
	s.Id,
	s.LastName +' ' +s.MidName+' '+ s.FirstName fullName,
	MONTH(s.BirthDate)  Birth_Month,
	MIN(s.Gpa) minGPa,
	MAX (s.Gpa) maxGpa
FROM
	Student s
GROUP BY
	s.id,
	s.LastName +' ' +s.MidName+' '+ s.FirstName,
	MONTH(s.BirthDate)
ORDER BY
	MONTH(s.BirthDate)
 */
 --Cho biết số lượng sinh viên ở mỗi địa chỉ. Kết quả sắp xếp giảm dần theo số lượng sinh viên
 /*
 SELECT DISTINCT
	s.Address ,
	COUNT(s.Id) numberOfStudent
FROM
	Student s
GROUP BY
	Address
ORDER BY
	COUNT(s.ID) DESC
 */
 -- Cho biết số lượng sinh viên theo từng tháng sinh. Sắp xếp kết quả theo số lượng sinh viên giảm dần.
 /*
 SELECT DISTINCT
	MONTH (s.BirthDate) birthMonth,
	COUNT(s.id) numberOfStudent
FROM
	Student s
GROUP BY
	MONTH(s.BirthDate)
ORDER BY
	COUNT(s.Id) DESC
*/

--Hãy cho biết điểm TB cộng của các sinh viên tổng hợp theo các tháng sinh của sinh viên trong danh sách.
/*
SELECT DISTINCT
	MONTH(s.BirthDate) monthDate,
	AVG(s.gpa) avg
FROM
	Student s
GROUP BY
	MONTH(s.BirthDate)
ORDER BY
	MONTH(s.BirthDate)

*/

--Hãy cho biết số lượng môn học ở mỗi giá trị tín chỉ là bao nhiêu?
/*
SELECT
	sub.Credit,
	COUNT(sub.Id) numberOfSubject
FROM
	Subject sub
GROUP BY	
	sub.Credit
ORDER BY
	sub.Credit
*/
--Hãy cho biết số lượng sinh viên đăng ký theo từng môn học.
/*
SELECT
	r.SubjectId,
	COUNT(r.StudentId) numberOfStudent
FROM
	Register r
GROUP BY
	r.SubjectId
*/
/*
SELECT
	sub.Id,
	sub.Name,
	COUNT(r.studentId)
FROM
	Subject sub
	JOIN
	Register r
	ON
	r.SubjectId = sub.Id
GROUP BY
	sub.Id,
	sub.Name
*/
--Hãy cho biết số lượng môn học mà mỗi sinh viên đăng ký.
SELECT DISTINCT
	s.ID,
	s.LastName +' '+ s.MidName+' '+ s.FirstName fullName,
	COUNT(r.subjectId) numberOfSubject
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
GROUP BY
	s.Id,
	s.LastName +' '+ s.MidName+' '+ s.FirstName
ORDER BY
	COUNT(r.subjectId)
	
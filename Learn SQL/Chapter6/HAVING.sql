--Cho biết điểm Gpa lớn nhất và nhỏ nhất của các sinh viên trong danh sách theo tháng sinh.
--Trong đó tháng sinh là các tháng chẵn.
/*
SELECT
	MONTH(s.BirthDate) birthMonth,
	MIN(s.Gpa) minGpa,
	MAX(s.Gpa) maxGpa
FROM
	Student s
GROUP BY
	MONTH(s.BirthDate)
HAVING
	MONTH(s.BirthDate) %2 =0
*/

--Cho biết số lượng sinh viên ở mỗi địa chỉ. Kết quả sắp xếp giảm dần theo số lượng sinh viên.
--Trong đó chỉ xét các địa chỉ có từ 2 sinh viên trở lên.
/*
SELECT
	s.Address,
	COUNT(s.Id) numberOfStudent 
FROM
	Student s
GROUP BY
	s.Address
HAVING
	COUNT(s.ID) >=2
ORDER BY
	COUNT(s.Id) 
*/
--Cho biết số lượng sinh viên theo từng tháng sinh.
--Sắp xếp kết quả theo số lượng sinh viên giảm dần. 
--Trong đó tháng sinh là các tháng lẻ.
/*
 SELECT
	MONTH(s.BirthDate) monthDate,
	COUNT(s.Id) numberOfStudent
FROM
	Student s
GROUP BY
	MONTH(s.BirthDate)
HAVING
	MONTH(s.BirthDate ) %2 != 0
ORDER BY
	MONTH(s.BirthDate)

*/

--Cho biết số lượng sinh viên theo mỗi giá trị của cột họ.
--Trong đó họ phải bắt đầu bằng chữ cái ‘t’, ‘h’, hoặc ‘n’.
/*
SELECT
	s.LastName ,
	COUNT(s.Id) numberOfStudent
FROM
	Student s
GROUP BY
	s.LastName
HAVING
	s.LastName LIKE N't%'
	OR
	s.LastName LIKE N'h%'
	OR
	s.LastName LIKE N'n%'
ORDER BY
	COUNT(s.Id) 
*/

--Hãy cho biết điểm TB cộng của các sinh viên tổng hợp theo các tháng sinh 
--từ 6-12 của sinh viên trong danh sách.
/*
SELECT
	MONTH(s.BirthDate) monthDate,
	AVG(s.Gpa) avgGPa
FROM
	Student s
GROUP BY
	MONTH(s.BirthDate)
HAVING
	MONTH(s.BirthDate ) >= 6
	AND
	MONTH(s.BirthDate ) <= 12
*/
--Hãy cho biết số lượng môn học ở mỗi giá trị tín chỉ >= 3 là bao nhiêu?
/*
SELECT
	sub.Credit,
	COUNT(sub.Id) numberOfSubject
FROM
	Subject sub
GROUP BY
	sub.Credit
HAVING
	sub.Credit >=3 
*/

--Hãy cho biết số lượng sinh viên đăng ký theo từng môn học. 
--Trong đó tên môn học phải có độ dài từ 5 kí tự trở lên.
/*
SELECT
	sub.Id,
	sub.Name,
	COUNT(s.Id) numberOfStudent
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY
	sub.id,
	sub.Name
HAVING
	LEN(sub.Name) >=5
ORDER BY
	COUNT(s.Id)
*/
--Hãy cho biết số lượng môn học mà mỗi sinh viên đăng ký. 
--Chỉ xét các sinh viên đăng ký từ 3 môn học trở lên.
/*
SELECT
	s.Id,
	s.LastName+' '+ s.MidName+' ' + s.FirstName fullName,
	COUNT(sub.Id) numberOfSubject
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id =r.StudentId
	JOIN 
	Subject sub
	ON
	r.SubjectId = sub.Id
GROUP BY
	s.Id,
	s.LastName+' '+ s.MidName+' ' + s.FirstName
HAVING
	COUNT(sub.Id) >= 3
ORDER BY
	COUNT(sub.Id)
*/
--Hãy cho biết thông tin các môn học trong bảng Subjects có sinh viên đăng ký. 
--Không xét trạng thái đăng ký.
/*
SELECT
	sub.*
FROM
	Subject sub
	JOIN
	Register r
	ON
	r.SubjectId = sub.Id
GROUP BY
	sub.Id,
	sub.Name,
	sub.Credit,
	sub.NumOfLesson,
	sub.Type
*/

--Hãy cho biết thông tin các môn học trong bảng Subjects không có bất kỳ sinh viên nào đăng ký.
/*
SELECT
	sub.*
FROM
	Subject sub
WHERE
	sub.Id NOT IN(
		SELECT	
			sub.Id
		FROM
		Subject sub
		JOIN
			Register r
		ON
			sub.Id = r.SubjectId
		)
*/
--Hãy cho biết thông tin những sinh viên đăng ký môn học C++. Không xét trạng thái đăng ký.
/*
SELECT
	s.*,
	sub.Name
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
	JOIN
	Subject sub
	ON
	r.SubjectId = sub.Id
WHERE
	sub.Name = ' C++'
*/
	
--Hãy cho biết mỗi sinh viên đăng ký bao nhiêu môn học. Không xét trạng thái đăng ký.
/*
SELECT
	s.Id,
	s.LastName +' '+ s.MidName+' ' + s.FirstName fullName,
	COUNT(sub.ID) numberOfSubject
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY	
	s.Id,
	s.LastName +' '+ s.MidName+' ' + s.FirstName 
*/
--Hãy cho biết mỗi môn học có bao nhiêu sinh viên đăng ký. Không xét trạng thái đăng ký.
/*
SELECT
	sub.Id,
	sub.Name,
	COUNT( s.Id) numberOfStudent
FROM	
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId 
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY
	sub.Id,
	sub.Name
*/
--Hãy cho biết thông tin các sinh viên trong bảng Students đăng ký nhiều môn học nhất. 
--Không xét trạng thái đăng ký.
/*
SELECT TOP 1 WITH TIES
	s.*,
	COUNT(sub.Id) numberOfSubject
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY
	s.Id,
	s.LastName,
	s.MidName,
	s.FirstName,
	s.Address,
	s.Major,
	s.PhoneNumber,
	s.Gpa,
	s.BirthDate
ORDER BY
	COUNT(sub.Id) DESc
*/
--Hãy cho biết thông tin các môn học trong bảng Subjects được đăng ký nhiều nhất. 
--Không xét trạng thái đăng ký.
/*
SELECT TOP 1 WITH TIES
	sub.*,
	COUNT(s.Id) numberOfStudent
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId 
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY
	sub.Id,
	sub.Name,
	sub.Credit,
	sub.NumOfLesson,
	sub.Type
ORDER BY
	 COUNT(s.Id) DESC
	*/
--Hãy cho biết thông tin các sinh viên đăng ký môn học nhiều thứ hai.
--Không xét trạng thái đăng ký**.
SELECT DISTINCT 
	s.*,
	COUNT(sub.Id) numberOfSubject
FROM
	Student s
	JOIN
	Register r
	ON
	s.Id = r.StudentId
	JOIN
	Subject sub
	ON
	sub.Id = r.SubjectId
GROUP BY
	s.Id,
	s.LastName,
	s.MidName,
	s.FirstName,
	s.Address,
	s.Major,
	s.PhoneNumber,
	s.Gpa,
	s.BirthDate
ORDER BY
	COUNT(sub.Id) DESC
OFFSET 1 ROW
FETCH  NEXT 1 ROW ONLY

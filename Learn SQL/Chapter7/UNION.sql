--Hãy cho biết thông tin các sinh viên đăng ký môn học nhiều thứ hai.
--Không xét trạng thái đăng ký
/*
SELECT
	Students.StudentId,
	Students.LastName +' ' + Students.MidName+' ' + Students.FirstName fullName,
	Registers.SubjectId
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
WHERE
	Registers.StudentId IN(
		SELECT DISTINCT
			s.StudentId
		FROM
			Students s
			JOIN
			Registers r
			ON
			s.StudentId = r.StudentId
		GROUP BY
			s.StudentId
		HAVING 
			COUNT(r.SubjectId ) = (
				SELECT  DISTINCT 
					COUNT(r1.SubjectId)
				FROM
					Students s1
					JOIN
					Registers r1
					ON
					s1.StudentId = r1.StudentId
				GROUP BY
					r1.StudentId
				ORDER BY
					COUNT(r1.SubjectId) DESC
				OFFSET 1 ROWS
				FETCH NEXT 1 ROWS ONLY
				)
		)
ORDER BY
	Registers.StudentId

*/
--Hãy cho biết tên, số điện thoại của tất cả các sinh viên, 
--nhân viên và khách hàng không tính các bản ghi trùng lặp.
SELECT
	LastName,
	FirstName
FROM
	Students
UNION 
SELECT
	LastName,
	FirstName
FROM
	Staffs
UNION 
SELECT
	LastName,
	FirstName
FROM
	Customers
ORDER BY
	FirstName
-- danh sách sinh viên có điểm TB lớn hơn hoặc bằng điểm TB tất cả các ngành học:
/*
SELECT
	Students.*
FROM
	Students
WHERE
	Students.Gpa >= ALL(
			SELECT
			AVG(s.Gpa)
		FROM
			Students s
		GROUP  BY
			s.Major
			)
*/
--Hãy cho biết mã, họ và tên các sinh viên có ngày sinh không trùng với ngày sinh của sinh viên nào. 
--Chỉ xét ngày, không xét tháng, năm.
/*
SELECT
	*
FROM
	Students
WHERE
	DAY(Students.BirthDate) IN(
			SELECT
			DAY(s.BirthDate) DayDate
		FROM
			Students s
		GROUP BY
			DAY(s.BirthDate)
		HAVING
			COUNT(s.StudentId) = 1
				)
--

SELECT
	s.StudentId [Mã SV],
	s.FirstName [Tên],
	s.MidName [Đệm],
	s.LastName [Họ],
	DAY(s.BirthDate) AS [Ngày sinh]
FROM
	Students s
WHERE
	DAY(s.BirthDate) <> ALL(
		SELECT DISTINCT
			DAY(s1.BirthDate)
		FROM
			Students s1 
			INNER JOIN Students s2
			ON s1.StudentId < s2.StudentId
		WHERE
			DAY(s1.BirthDate) = DAY(s2.BirthDate)
	);
*/
--Hãy cho biết mã, họ, tên các nhân viên có họ không trùng với họ của các nhân viên khác.
--Sắp xếp kết quả tăng dần theo tên a-z.
/*
SELECT
	*
FROM
	Students
WHERE
	Students.LastName IN(
		SELECT
			s.LastName
		FROM
			Students s
		GROUP BY
			S.LastName
		HAVING	
			COUNT(s.StudentId) = 1
		)
*/
--Hãy cho biết thông tin các cửa hàng có địa chỉ quận không trùng với địa chỉ quận của các cửa hàng khác.
SELECT
	*
FROM
	Stores
WHERE
	Stores.District <> ALL  (
		SELECT
			sto.District
		FROM
			Stores sto
		GROUP BY
			 sto.District
		HAVING
			COUNT(sto.StoreId) > 1
			)
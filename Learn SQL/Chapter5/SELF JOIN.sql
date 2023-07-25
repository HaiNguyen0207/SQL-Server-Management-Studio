--Tìm người quản lí của  các nhân viên
/*
SELECT
	s.StaffId AS ManagerId,
	s.FirstName +' ' +s.LastName AS NameManager,
	m.FirstName+' '+ m.LastName AS NameStaff,
	m.StaffId 
FROM
	Staffs s 
	INNER JOIN
	Staffs m
	ON
	s.StaffId = m.ManagerId
*/
/*
SELECT
	s.*,
	m.*
FROM
	Staffs s 
	INNER JOIN
	Staffs m
	ON
	s.StaffId = m.ManagerId
*/

--Từ bảng Student, hãy cho biết các sinh viên ở cùng thành phố.
/*
SELECT DISTINCT
	s.Address,
	s.LastName +' '+ s.MidName +' '+ s.FirstName AS NameStudent1,
	s1.LastName +' '+ s1.MidName +' '+ s1.FirstName AS NameStudent2
FROM
	Student s
	INNER JOIN
	Student s1
	ON
	s.Address = s1.Address
	AND
	s.Id > s1.Id

*/
--Từ bảng Subject, hãy cho biết tên các môn học cùng số tín chỉ.
/*
SELECT 
	sub.Id subjectId1,
	sub.Name subjectName1,
	sub1.Id subjectId2,
	sub1.Name SubjectName2,
	sub.Credit
FROM
	Subject sub
	JOIN
	Subject sub1
	ON
	sub.Credit =sub1.Credit
	AND	
	sub.Id <sub1.Id
ORDER BY
	sub.Credit
*/
--Từ bảng Student hãy cho biết tên các sinh viên có cùng điểm TB.
/*
SELECT
	s.Id studentId1,
	s.LastName +' '+ s.Midname +' '+ s.Firstname NameStudent1,
	s1.Id studentId2,
	s1.LastName +' '+ s1.Midname +' '+ s1.Firstname NameStudent2,
	s.Gpa Gpa
FROM
	Student s
	JOIN
	Student s1
	ON
	s.Gpa =s1.Gpa
	AND 
	s.Id > s1.Id
ORDER BY
	s.Gpa
*/
--Từ bảng Stores hãy cho biết các cửa hàng ở cùng thành phố.
/*
SELECT
	s.StoreId ID1,
	s.StoreName StoreName1,
	s1.StoreId ID2,
	s1.StoreName StoreName2,
	s.City
FROM
	Stores 
	JOIN
	Stores s1
	ON
	s.City =s1.City
	AND	
	s.StoreId >s1.StoreId
*/
--Từ bảng Staffs và Stores hãy cho biết các nhân viên làm cùng cửa hàng.
SELECT
	sta.LastName +' '+sta.FirstName NameStaff1,
	sta1.LastName +' '+ sta1.FirstName NameStaff2,
	sta.StoreId storeId
FROM
	Staffs sta
	JOIN
	Staffs sta1
	ON
	sta.StoreId = sta1.StaffId
	AND
	sta.StaffId	> sta1.StaffId

ORDER BY
	sta.StoreId


--Xóa thông tin sinh viên có mã ‘B25DCCN101’ khỏi bảng Student.
/*
DELETE
FROM	
	Registers
WHERE
	Registers.StudentId ='B25DCCN101'

DELETE
FROM	
	Students
WHERE
	StudentId = 'B25DCCN101'
*/
--Xóa tất cả sinh viên có địa chỉ ở Hà Nội khỏi bảng.
/*
DELETE 
	Registers
FROM	
	Registers
	JOIN
	Students
	ON
	Registers.StudentId  =Students.StudentId
WHERE
	Students.Address =N'Hà Nội '

DELETE
FROM	
	Students
WHERE
	Students.Address=N'Hà Nội '
*/
--Xóa các môn học có số tín chỉ bằng 4 trong bảng Subjects.
/*
DELETE
FROM	
	Subjects
WHERE
	Subjects.Credit=4
*/
--Xóa toàn bộ dữ liệu trong bảng Subjects.
/*
DELETE 
FROM	
	Subjects 
*/
--Xóa các sinh viên sinh vào tháng chẵn, ngày chẵn khỏi bảng Students.
/*
DELETE
FROM	
	Students
WHERE
	MONTH(Students.BirthDate) % 2 = 0 
*/
--Xóa các sinh viên học CNTT và có điểm TB >= 3.6 khỏi bảng Students
DELETE
FROM
	Students
WHERE
	Students.Major='CNTT'
	AND
	Students.Gpa >= 3.6
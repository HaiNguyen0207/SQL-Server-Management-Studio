--Viết hàm tìm khách hàng tên dài nhất trong bảng Customers.
CREATE FUNCTION fn_FindMaxLengthName()
RETURNS INT
AS
BEGIN
	DECLARE @max NVARCHAR(250)
	SELECT
		@max=LEN(Customers.FirstName)
	FROM	
		Customers
	RETURN @max
END
-- Gọi
SELECT
	*
FROM
	Customers
WHERE
	LEN(Customers.FirstName) =dbo.fn_FindMaxLengthName()


--2 .Viết hàm phân loại học lực cho từng sinh viên trong bảng Students.
CREATE FUNCTION fn_ClassifyCapacity(
	@gpa FLOAT
)
RETURNS NVARCHAR(250)
AS
BEGIN
	DECLARE @capacity NVARCHAR(250)
	IF @gpa >= 3.6 AND @gpa <= 4.0
		BEGIN
			SET @capacity = N'Xuất Xắc'
		END
	ELSE IF @gpa >= 3.2
		BEGIN
			SET @capacity = N'Giỏi'
		END
	ELSE IF @gpa >= 2.5
		BEGIN
			SET @capacity =N'Khá'
		END
	ELSE IF @gpa >= 2.0
		BEGIN
			SET @capacity = N'Trung Bình'
		END
	ELSE
		BEGIN
			SET @capacity =N'Yếu'
		END
	RETURN @capacity
END
---
SELECT
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.Gpa,
	dbo.fn_ClassifyCapacity(Students.Gpa) Capacity
FROM
	Students
GROUP BY
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.Gpa

--C3: Viết hàm tìm sinh viên đăng ký nhiều môn học nhất.
CREATE OR ALTER FUNCTION fn_FindStudentMaxRegister()
RETURNS INT
AS
BEGIN
	DECLARE @value INT
	SELECT TOP 1
		@value = COUNT(Registers.SubjectId)
	FROM	
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId = Registers.SubjectId
	GROUP BY
		Registers.StudentId	
	ORDER BY
		COUNT(Registers.SubjectId) DESC
	RETURN @value
END

---
SELECT
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.MidName
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
	JOIN
	Subjects
	ON 
	Subjects.SubjectId = Registers.SubjectId
GROUP BY
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.MidName
HAVING
	COUNT(Registers.SubjectId ) = dbo.fn_FindStudentMaxRegister()

--Viết hàm tìm môn học được đăng ký nhiều nhất.
CREATE OR ALTER FUNCTION fn_FindSubjectMaxRegister()
RETURNS INT
AS 
BEGIN
	DECLARE @max INT
	SELECT TOP 1
		@max= COUNT(Registers.StudentId)
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId =Registers.SubjectId
	GROUP BY
		Registers.SubjectId
	ORDER BY
		COUNT(Registers.StudentId) DESC
	RETURN @max
END
--
SELECT
	Subjects.*
FROM
	Subjects 
	JOIN
	Registers
	ON
	Subjects.SubjectId = Registers .SubjectId
	JOIN 
	Students
	ON
	Registers.StudentId = Students.StudentId
GROUP BY
	Subjects.SubjectId,
	Subjects.Name,
	Subjects.Credit,
	Subjects.NumOfLesson,
	Subjects.Type
HAVING 
	COUNT(Registers.StudentId) = dbo.fn_FindSubjectMaxRegister()

--Viết hàm tìm sinh viên đăng ký môn học sớm nhất.
CREATE FUNCTION fn_FindStudentMinRegisterTime()
RETURNS NVARCHAR(250)
AS
BEGIN
	DECLARE @studentId NVARCHAR(250)
	SELECT TOP 1
		@studentId =Students.StudentId
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId =Registers.StudentId
	WHERE
		Registers.RegisterStatus=N'Thành công'
	ORDER BY
		Registers.RegisterTime
RETURN @studentId
END
--
SELECT
	*
FROM
	Students
WHERE
	Students.StudentId = dbo.fn_FindStudentMinRegisterTime()
--Viết hàm tìm môn học được đăng ký sớm nhất.
CREATE FUNCTION fn_FindSubjectMinRegisterTime()
RETURNS NVARCHAR(250)
AS
BEGIN
	DECLARE @subjectId NVARCHAR(250)
	SELECT TOP 1
		@subjectId =Subjects.SubjectId
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId =Registers.SubjectId
	WHERE
		Registers.RegisterStatus=N'Thành công'
	ORDER BY
		Registers.RegisterTime
RETURN @subjectId
END
--
SELECT
	*
FROM
	Subjects
WHERE
	Subjects.SubjectId = dbo.fn_FindSubjectMinRegisterTime()
--Viết hàm tìm số lượng nhân viên mà mỗi quản lý đang nắm giữ.
CREATE OR ALTER FUNCTION fn_NumberEmpManagement (
	@managerId INT
)
RETURNS INT
AS
BEGIN
	DECLARE @numberEmp INT
	SELECT
		@numberEmp = COUNT(s1.ManagerId)
	FROM
		Staffs m1
	JOIN 
		Staffs s1
	ON 
		m1.StaffId = s1.ManagerId
	GROUP BY
		m1.StaffId
	HAVING
		m1.StaffId =@managerId
RETURN @numberEmp
END
-- 
SELECT 
	2 ManagerId,
	dbo.fn_NumberEmpManagement(2) NumberEmp
--Viết hàm tìm sinh viên đăng ký môn học nhiều thứ hai.
CREATE FUNCTION fn_FindStudentRegister2nd()
RETURNS INT
AS
BEGIN
	DECLARE @value INT
	SELECT DISTINCT
		@value = COUNT(Registers.SubjectId)
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId = Registers.StudentId
	GROUP BY
		Registers.StudentId
	ORDER BY
		COUNT(Registers.SubjectId) DESC
	OFFSET 1 ROWS
	FETCH NEXT 1 ROWS ONLY
RETURN @value
END
--
SELECT
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.MidName
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
GROUP BY
	Students.StudentId,
	Students.FirstName,
	Students.LastName,
	Students.MidName
HAVING
	COUNT(Registers.SubjectId) = dbo.fn_FindStudentRegister2nd()

--Viết hàm tìm môn học được đăng ký nhiều thứ hai.
CREATE FUNCTION fn_FindSubjectRegister2nd()
RETURNS INT
AS
BEGIN
	DECLARE @value INT
	SELECT DISTINCT
		 @value = COUNT(Registers.StudentId)
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId = Registers.SubjectId
	GROUP BY
		Registers.SubjectId
	ORDER BY
		COUNT(Registers.StudentId) DESC
	OFFSET 1 ROWS
	FETCH NEXT 1 ROWS ONLY
RETURN @value
END
--
SELECT
	Subjects.*
FROM
	Subjects
	JOIN
	Registers
	ON
	Subjects.SubjectId = Registers.SubjectId
GROUP BY
	Subjects.SubjectId,
	Subjects.Name,
	Subjects.Credit,
	Subjects.NumOfLesson,
	Subjects.Type
HAVING
	COUNT(Registers.StudentId) = dbo.fn_FindSubjectRegister2nd()
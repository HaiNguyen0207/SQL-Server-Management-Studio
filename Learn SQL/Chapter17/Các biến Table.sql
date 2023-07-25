--2.Viết hàm tìm khách hàng tên dài nhất trong bảng Customers.
CREATE OR ALTER FUNCTION fn_CustomerMaxFirstName()
RETURNS @tblCustomers TABLE (
	CustomerId INT PRIMARY KEY,
	FirstName NVARCHAR(250) ,
	LastName NVARCHAR(250) ,
	PhoneNumber NVARCHAR(250) ,
	Email NVARCHAR(250) ,
	Street NVARCHAR(250),
	District NVARCHAR(250) ,
	City NVARCHAR(250)
)
AS
BEGIN
	INSERT INTO @tblCustomers
	SELECT
	Customers.CustomerId,
	Customers.FirstName,
	Customers.LastName,
	Customers.PhoneNumber,
	Customers.Email,
	Customers.Street,
	Customers.District,
	Customers.City
	FROM
		Customers
	WHERE
		LEN(Customers.FirstName ) = (
			SELECT 	TOP 1
				LEN(Customers.FirstName)
			FROM 
				Customers
			GROUP BY
				
				Customers.FirstName
			ORDER BY
				LEN(FirstName) DESC
			)
	RETURN
END
--
SELECT 
	*
FROM
	dbo.fn_CustomerMaxFirstName()
--3.Viết hàm phân loại học lực cho từng sinh viên trong bảng Students.
CREATE OR ALTER FUNCTION fn_GetStudentCapacity()
RETURNS @tblStudentCapacity TABLE (
	StudentId NVARCHAR(250) PRIMARY KEY,
	FullName NVARCHAR(250) ,
	Address NVARCHAR(250),
	Major NVARCHAR(250) ,
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT ,
	Capacity NVARCHAR(250)
)
AS 
BEGIN
	INSERT INTO @tblStudentCapacity
	SELECT
		Students.StudentId,
		Students.LastName +' '+Students.MidName+' ' +Students.FirstName,
		Students.Address,
		Students.Major,
		Students.BirthDate,
		Students.PhoneNumber,
		Students.Gpa,
		dbo.fn_ClassifyCapacity(Students.Gpa)
	FROM
		Students
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_GetStudentCapacity()
--4.Viết hàm tìm sinh viên đăng ký nhiều môn học nhất.
CREATE OR ALTER FUNCTION fn_StudentMaxRegister()
RETURNS @tblStudent TABLE (
	StudentId NVARCHAR(250) PRIMARY KEY,
	FullName NVARCHAR(250) ,
	Address NVARCHAR(250),
	Major NVARCHAR(250) ,
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT
)
AS
BEGIN
	INSERT INTO @tblStudent
	SELECT
		Students.StudentId,
		Students.LastName +' '+Students.MidName+' ' +Students.FirstName,
		Students.Address,
		Students.Major,
		Students.BirthDate,
		Students.PhoneNumber,
		Students.Gpa
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId = Registers.StudentId
	GROUP BY
		Students.StudentId,
		Students.LastName +' '+Students.MidName+' ' +Students.FirstName,
		Students.Address,
		Students.Major,
		Students.BirthDate,
		Students.PhoneNumber,
		Students.Gpa
	HAVING 
		COUNT(Registers.SubjectId) = (
			SELECT TOP 1
				COUNT(Registers.SubjectId)
			FROM
				Students
				JOIN
				Registers
				ON
				Students.StudentId = Registers.StudentId
			GROUP BY
				Students.StudentId
			)
				
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_StudentMaxRegister()
--5.Viết hàm tìm môn học được đăng ký nhiều nhất.
CREATE OR ALTER FUNCTION fn_GetSubjectMaxRegisters()
RETURNS @tblSubjects TABLE (
	SubjectId NVARCHAR(250) PRIMARY KEY,
	SubjectName NVARCHAR(250) ,
	Credit INT ,
	NumberOfLesson INT ,
	Type NVARCHAR(250)
)
AS
BEGIN
	INSERT INTO @tblSubjects
	SELECT
		Subjects.SubjectId,
		Subjects.Name,
		Subjects.Credit,
		Subjects.NumOfLesson,
		Subjects.Type
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
		COUNT(Registers.StudentId) = (
			SELECT DISTINCT TOP 1
				COUNT(Registers.StudentId)
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
			)
	RETURN
				
END
--
SELECT
	*
FROM
	dbo.fn_GetSubjectMaxRegisters()
--6.Viết hàm tìm sinh viên đăng ký môn học sớm nhất.
CREATE OR ALTER FUNCTION fn_GetStudentMinRegisterTime()
RETURNS @tblStudent TABLE (
	StudentId NVARCHAR(250) PRIMARY KEY,
	FullName NVARCHAR(250) ,
	Address NVARCHAR(250),
	Major NVARCHAR(250) ,
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT
)
AS
BEGIN
	INSERT INTO @tblStudent
	SELECT
		Students.StudentId,
		Students.LastName+' '+ Students.MidName+' ' +Students.FirstName ,
		Students.Address,
		Students.Major,
		Students.BirthDate,
		Students.PhoneNumber,
		Students.Gpa
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId = Registers.StudentId
	WHERE
		Registers.RegisterTime = (
			SELECT
				MIN(Registers.RegisterTime)
			FROM
				Registers
			
			)
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_GetStudentMinRegisterTime()
--7.Viết hàm tìm môn học được đăng ký sớm nhất.
CREATE OR ALTER FUNCTION fn_GetSubjectMinRegisterTime()
RETURNS @tblSubjects TABLE (
	SubjectId NVARCHAR(250) PRIMARY KEY,
	SubjectName NVARCHAR(250) ,
	Credit INT ,
	NumberOfLesson INT ,
	Type NVARCHAR(250),
	TimeRegister DATETIME
)
AS
BEGIN
	INSERT INTO @tblSubjects
	SELECT
		Subjects.SubjectId,
		Subjects.Name,
		Subjects.Credit,
		Subjects.NumOfLesson,
		Subjects.Type,
		Registers.RegisterTime
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId = Registers.SubjectId
	WHERE
		Registers.RegisterTime = (
			SELECT
				MIN(Registers.RegisterTime)
			FROM
				Registers
			)
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_GetSubjectMinRegisterTime()

--8.Viết hàm tìm số lượng nhân viên mà mỗi quản lý đang nắm giữ.
--9.Viết hàm tìm sinh viên đăng ký môn học nhiều thứ hai.
CREATE OR ALTER FUNCTION fn_GetStudentRegister2rd()
RETURNS @tblStudent TABLE (
	StudentId NVARCHAR(250) PRIMARY KEY,
	FullName NVARCHAR(250) ,
	Address NVARCHAR(250),
	Major NVARCHAR(250) ,
	BirthDate DATE ,
	PhoneNumber NVARCHAR(250) ,
	Gpa FLOAT
)
AS
BEGIN
	INSERT INTO @tblStudent
	SELECT DISTINCT
		Students.StudentId,
		Students.LastName+' '+ Students.MidName+' ' +Students.FirstName ,
		Students.Address,
		Students.Major,
		Students.BirthDate,
		Students.PhoneNumber,
		Students.Gpa
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId = Registers.StudentId
	WHERE
		Students.StudentId IN (
			SELECT
				Registers.StudentId
			FROM
				Registers
			GROUP BY
				Registers.StudentId
			HAVING
			COUNT(Registers.SubjectId) = (
				SELECT DISTINCT 
					COUNT(Registers.SubjectId)
				FROM
					Registers	
				GROUP BY
					Registers.StudentId
				ORDER BY
					COUNT(Registers.SubjectId) DESC
				OFFSET 1 ROWS
				FETCH NEXT 1 ROWS ONLY
				
			)
		)
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_GetStudentRegister2rd()
-- 10.Viết hàm tìm môn học được đăng ký nhiều thứ hai.
CREATE OR ALTER FUNCTION fn_GetSubjectRegister2rd()
RETURNS @tblSubjects TABLE (
	SubjectId NVARCHAR(250) PRIMARY KEY,
	SubjectName NVARCHAR(250) ,
	Credit INT ,
	NumberOfLesson INT ,
	Type NVARCHAR(250)
)
AS
BEGIN
	INSERT INTO @tblSubjects
	SELECT DISTINCT
		Subjects.SubjectId,
		Subjects.Name,
		Subjects.Credit,
		Subjects.NumOfLesson,
		Subjects.Type
	FROM
		Subjects
	WHERE
		Subjects.SubjectId IN (
			SELECT	
				Registers.SubjectId
			FROM
				Registers
			GROUP BY
				Registers.SubjectId
			HAVING
				COUNT(Registers.StudentId ) = (
					SELECT DISTINCT
						COUNT(Registers.StudentId)
					FROM
						Registers
					GROUP BY
						Registers.SubjectId
					ORDER BY
						COUNT(Registers.StudentId) DESC
					OFFSET 1 ROWS
					FETCH NEXT 1 ROWS ONLY
					)
				)
	RETURN
END
--
SELECT
	*
FROM
	dbo.fn_GetSubjectRegister2rd()
--
SELECT
	*
FROM
	Registers
WHERE
	Registers.SubjectId ='SUBJ1005'





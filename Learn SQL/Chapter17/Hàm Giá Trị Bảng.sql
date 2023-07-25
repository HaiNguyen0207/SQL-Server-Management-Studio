--1.Viết hàm tìm điểm thấp nhất của các sinh viên theo từng chuyên ngành trong bảng Students.
CREATE OR  ALTER FUNCTION fn_GetStudentMinGpa(
	@major NVARCHAR(250)
)
RETURNS TABLE
AS
RETURN 
	SELECT
		Students.StudentId,
		Students.FirstName,
		Students.LastName,
		Students.MidName,
		Students.Major,
		Students.Gpa
	FROM
		Students
	GROUP BY
		Students.StudentId,
		Students.FirstName,
		Students.LastName,
		Students.MidName,
		Students.Major,
		Students.Gpa
	HAVING
		Students.Major = @major
		AND
		Students.Gpa = (
			SELECT
				MIN(Students.Gpa)
			FROM
				Students
			)
--
SELECT
	*
FROM
	fn_GetStudentMinGpa('CNTT')

--2.Viết hàm tìm khách hàng tên dài nhất trong bảng Customers.
CREATE OR ALTER FUNCTION fn_GetCustomerMaxLen()
RETURNS TABLE
AS
RETURN
	SELECT
		*
	FROM
		Customers
	WHERE
		LEN(Customers.FirstName) = (	
			SELECT	
				MAX(LEN(Customers.FirstName))
			FROM
				Customers
			)

--
SELECT
	*
FROM
	fn_GetCustomerMaxLen()
-- 3.Viết hàm phân loại học lực cho từng sinh viên trong bảng Students.
CREATE OR ALTER FUNCTION fn_JudgeStudentCapacity()
RETURNS TABLE
AS
RETURN
	SELECT
		*,
		dbo.fn_CapacityStudents(Students.Gpa) Capacity
	FROM
		Students

--
SELECT
	*
FROM
	fn_JudgeStudentCapacity()
-- 4. Viết hàm tìm sinh viên đăng ký nhiều môn học nhất.
CREATE OR ALTER FUNCTION fn_GetStudentMaxRegister()
RETURNS TABLE
AS
RETURN
	SELECT
		Students.StudentId,
		Students.FirstName ,
		Students.LastName ,
		Students.MidName,
		Students.Major,
		Students.Gpa
	FROM
		Students
		JOIN
		Registers
		ON
		Students.StudentId = Registers.StudentId
	GROUP BY
		Students.StudentId,
		Students.FirstName ,
		Students.LastName ,
		Students.MidName,
		Students.Major,
		Students.Gpa
	HAVING
		COUNT(Registers.SubjectId) = (
			SELECT TOP 1
				COUNT(Registers.SubjectId)
			FROM
				Registers
			GROUP BY
				Registers.StudentId
			ORDER BY
				COUNT(Registers.SubjectId) DESC
			)
--
SELECT
	*
FROM
	fn_GetStudentMaxRegister()

--5.Viết hàm tìm môn học được đăng ký nhiều nhất.
CREATE OR ALTER FUNCTION fn_GetSubjectMaxRegister()
RETURNS TABLE
AS
RETURN
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
		COUNT(Registers.StudentId) = (
			SELECT TOP 1
				COUNT(Registers.StudentId)
			FROM
				Registers
			GROUP BY
				Registers.SubjectId
			ORDER BY
				COUNT(Registers.StudentId) DESC
			)
--
SELECT
	*
FROM
	fn_GetSubjectMaxRegister()
--6.
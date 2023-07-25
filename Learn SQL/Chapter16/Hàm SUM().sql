--Tính tổng điểm TB các sinh viên có trong bảng Student.
SELECT
	SUM(Gpa) ToltalGpa
FROM
	Students
--Tính tổng số tiết học của các môn học trong bảng Subject.
SELECT
	SUM(NumOfLesson) ToltalNumberOfLesson
FROM
	Subjects
--Tính tổng điểm TB của các sinh viên trong bảng Student mà sinh vào tháng chẵn.
SELECT
	SUM(Gpa) ToltalGpa
FROM
	Students
WHERE
	MONTH(Students.BirthDate) %2 = 0
--Tính tổng số tín chỉ các môn học có trong bảng Subject.
SELECT
	SUM(Credit) ToltalCredit
FROM
	Subjects
--Tính tổng điểm TB các sinh viên sinh vào tháng lẻ
SELECT
	SUM(Gpa) ToltalGpa
FROM
	Students
WHERE
	MONTH(Students.BirthDate) %2 != 0
--Tính tổng số sinh viên đăng ký các môn học 4 tín chỉ.
SELECT
	SUM(Results.NumberOfStudent) ToltalStudent
FROM (
	SELECT DISTINCT
		Registers.StudentId StudentId ,
		1 AS NumberOfStudent
	FROM
		Registers
		JOIN
		Subjects
		ON
		Registers.SubjectId = Subjects.SubjectId
	WHERE
		Subjects.Credit = 4
		) Results
--Cho biết số môn học chỉ có 1 sinh viên  đăng ký.
SELECT
	SUM(Results.NumberOfStudent) ToltalSubject
FROM(
	SELECT DISTINCT
		Subjects.SubjectId ,
		1 NumberOfStudent
	FROM
		Registers
		JOIN
		Subjects
		ON
		Registers.SubjectId = Subjects.SubjectId
	GROUP BY
		Subjects.SubjectId
	HAVING
		COUNT(Registers.StudentId) = 1
		)Results
--Cho biết tổng số tiết học mà 1 sinh viên đã đăng ký(B25DCCN101)
CREATE OR ALTER PROC usp_ToltalNumberOfLesson (
	@studentId NVARCHAR(250),
	@result INT OUT
)
AS
BEGIN
	SELECT
		Registers.StudentId,
		Subjects.SubjectId,
		Subjects.Name,
		Subjects.Credit,
		Subjects.NumOfLesson
	
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId = Registers.SubjectId
		WHERE
		Registers.StudentId=@studentId
	--
	SELECT
		@result =SUM(Subjects.NumOfLesson)
	
	FROM
		Subjects
		JOIN
		Registers
		ON
		Subjects.SubjectId = Registers.SubjectId
	GROUP BY
		Registers.StudentId
	HAVING
		Registers.StudentId=@studentId
END
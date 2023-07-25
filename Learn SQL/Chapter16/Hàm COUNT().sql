--Hãy cho biết số lượng dòng hiện có trong bảng Students.
SELECT
	COUNT(*) NumberOfStudent
FROM
	Students
-- Hãy cho biết có bao nhiêu sinh viên sinh vào tháng 6.
--C1 
SELECT	
	COUNT(Students.StudentId ) NumberOfStudent
FROM
	Students
GROUP BY
	MONTH(Students.BirthDate)
HAVING
	MONTH(Students.BirthDate) = 6
--C2
SELECT
	COUNT(Students.BirthDate) NumberOfStudent
FROM
	Students
WHERE
	MONTH(Students.BirthDate) = 6
--Hãy cho biết có bao nhiêu sinh viên họ ‘Nguyễn’.
--C1 
SELECT	
	COUNT(Students.StudentId ) NumberOfStudent
FROM
	Students
GROUP BY
	Students.LastName
HAVING
	Students.LastName =N'Nguyễn'
--C2
SELECT
	COUNT(Students.LastName) NumberOfStudent
FROM
	Students
WHERE
	Students.LastName =N'Nguyễn'

--Hãy cho biết có bao nhiêu bản ghi trong bảng Registers?
SELECT
	COUNT(*) NumberOfRegister
FROM
	Registers
--Hãy cho biết có bao nhiêu môn học có 4 tín chỉ trong bảng Subjects.
--C1
SELECT
	COUNT(DISTINCT Subjects.SubjectId) NumberofSubject
FROM
	Subjects
WHERE
	Subjects.Credit = 4
--C2
SELECT
	COUNT( Subjects.Credit) NumberofSubject
FROM
	Subjects
WHERE
	Subjects.Credit = 4
--Hãy cho biết có bao nhiêu sinh viên đăng ký môn học có 3 tín chỉ?
--C1
SELECT
	COUNT(DISTINCT Registers.StudentId ) NumberOfStudent
FROM
	Subjects
	JOIN
	Registers
	ON
	Registers.SubjectId= Subjects.SubjectId
	JOIN
	Students
	ON
	Students.StudentId = Registers.StudentId
WHERE
	Subjects.Credit = 3
--C2
SELECT
	COUNT(DISTINCT Registers.StudentId ) NumberOfStudent
FROM
	Subjects
	JOIN
	Registers
	ON
	Registers.SubjectId= Subjects.SubjectId
	JOIN
	Students
	ON
	Students.StudentId = Registers.StudentId
GROUP BY
	Subjects.Credit 
HAVING
	Subjects.Credit =3

--
SELECT DISTINCT
	Students.StudentId
FROM
	Subjects
	JOIN
	Registers
	ON
	Registers.SubjectId= Subjects.SubjectId
	JOIN
	Students
	ON
	Students.StudentId = Registers.StudentId
WHERE
	Subjects.Credit = 3
--Hãy cho biết có bao nhiêu sinh viên trong tên có chữ ‘n’?
SELECT
	COUNT(*)
FROM
	Students
WHERE
	Students.FirstName LIKE'%n%'
--Hãy cho biết sinh viên mã X đăng ký bao nhiêu môn học?
SELECT
	Students.StudentId,
	COUNT(Registers.SubjectId) NumberOfSubject
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
GROUP BY 
	Students.StudentId
HAVING
	Students.StudentId ='B25DCCN101'
--
SELECT
	Students.StudentId,
	Registers.SubjectId
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
WHERE
	Students.StudentId ='B25DCCN101'
--
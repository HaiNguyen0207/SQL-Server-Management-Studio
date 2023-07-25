--Tìm sinh viên có điểm cao nhất trong bảng Students.
SELECT
	MAX(Gpa) MaxGpa
FROM
	Students
-- Tìm môn học có số sinh viên đăng ký nhiều nhất.
-- C1
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
		SELECT	
			MAX(Results.NumberOfStudent)
		FROM
			(
			SELECT	
				Subjects.SubjectId,
				COUNT(Registers.StudentId ) NumberOfStudent
			FROM
				Subjects
				JOIN
				Registers
				ON
				Subjects.SubjectId = Registers.SubjectId
			GROUP BY
				Subjects.SubjectId
			) Results
)
--C2
SELECT 
	Subjects.*
FROM
	Registers
	JOIN
	Subjects
	ON
	Registers.SubjectId = Subjects.SubjectId
GROUP BY
	Subjects.SubjectId,
	Subjects.Name,
	Subjects.Credit,
	Subjects.NumOfLesson,
	Subjects.Type
HAVING
	COUNT(Subjects.SubjectId ) = (
		SELECT TOP 1
			COUNT(Registers.StudentId)
		FROM
			Registers,Subjects
		WHERE
			Registers.SubjectId = Subjects.SubjectId
		GROUP BY
			Subjects.SubjectId
		ORDER BY
			COUNT(Registers.StudentId) DESC
)
--Tìm các môn học có tên dài nhất.
SELECT
	*
FROM
	Subjects
WHERE
	LEN(Subjects.Name) =(
		SELECT
			MAX(LEN(Subjects.Name))
		FROM
			Subjects
		)
--Tìm các môn học có số sinh viên đăng ký nhiều nhất.
--Tìm điểm cao nhất của các sinh viên sinh vào các tháng chẵn.
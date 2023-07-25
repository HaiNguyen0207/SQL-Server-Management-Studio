--Tìm sinh viên có điểm thấp nhất trong bảng Students.
SELECT
	*
FROM
	Students
WHERE
	Students.Gpa = (
		SELECT	
			MIN(Gpa)
		FROM
			Students
		)
--Tìm môn học có số sinh viên đăng ký ít nhất.

SELECT
	Subjects.*
FROM
	Subjects
	JOIN
	Registers
	ON
	Subjects.SubjectId =Registers.SubjectId
GROUP BY
	Subjects.SubjectId,
	Subjects.Name,
	Subjects.Credit,
	Subjects.NumOfLesson,
	Subjects.Type
HAVING
	COUNT(Registers.StudentId) = (
		SELECT
			MIN(Results.NumberOfStudent)
		FROM
			(
				SELECT
					Subjects.SubjectId,
					COUNT(Registers.StudentId) NumberOfStudent
				FROM
					Subjects
					JOIN
					Registers
					ON
					Subjects.SubjectId =Registers.SubjectId
			GROUP BY
					Subjects.SubjectId

			) Results
		)
--Tìm sinh viên đăng ký ít môn học nhất.
SELECT
	Students.StudentId
FROM
	Students
	JOIN
	Registers
	ON
	Students.StudentId = Registers.StudentId
GROUP BY
	Students.StudentId
HAVING
	COUNT(Registers.SubjectId) = (
		SELECT
			MIN(Results.NumberOfSubject)
		FROM (
			SELECT
				COUNT(Registers.SubjectId) NumberOfSubject
			FROM
				Students
				JOIN
				Registers
				ON
				Students.StudentId = Registers.StudentId
			GROUP BY
				Students.StudentId
			) Results
	)
--Tìm các môn học có số sinh viên đăng ký ít nhất. Chỉ xét các môn học có sinh viên đăng ký.

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
	COUNT(Registers.StudentId) = (
		SELECT
			MIN(Results.NumberOfStudent)
		FROM (
			SELECT
				COUNT(Registers.StudentId) NumberOfStudent
			FROM
				Registers
				JOIN
				Subjects
				ON
				Registers.SubjectId = Subjects.SubjectId
			GROUP BY
				Subjects.SubjectId
		) Results
)
SELECT
	Registers.SubjectId,
	Registers.StudentId
FROM
	Registers
WHERE
	Registers.SubjectId ='SUBJ1006'
	OR
	Registers.SubjectId ='SUBJ1009'
	OR
	Registers.SubjectId ='SUBJ1010'
	OR
	Registers.SubjectId ='SUBJ1206'
	
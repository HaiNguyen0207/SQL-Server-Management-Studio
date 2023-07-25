INSERT INTO	
	LearnSQL.dbo.ITStudents(PK_ITStudents,FirstName,LastName,BirthDate,Major,Gpa)
SELECT
	Students.StudentId,Students.FirstName,Students.LastName,Students.BirthDate,
	Students.Major,Students.Gpa
FROM
	LearnSQL.dbo.Students
WHERE
	Students.Major='CNTT'
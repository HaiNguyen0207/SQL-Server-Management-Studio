SELECT
	*
INTO
	LearnSQL.dbo.GoodITStudents
FROM
	LearnSQL.dbo.Students
WHERE
	Major ='CNTT'
	AND
	Gpa >= 3.5
-- Ví dụ sau sẽ tạo stored procedure 1 tham số:
/*
DROP PROC usp_Students_FindByGpa

CREATE PROC usp_Students_FindByGpa(@MinGpa FLOAT,@MaxGpa FLOAT)
AS
BEGIN
SELECT
	*
FROM
	Students
WHERE
	Students.Gpa >= @MinGpa
	AND
	Students.Gpa <= @MaxGpa
ORDER BY
	Students.Gpa
END
*/
/*
DECLARE @gpa FLOAT = 3.5
PRINT @gpa


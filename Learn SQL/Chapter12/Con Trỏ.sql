--Hiển thị danh sách mã sinh viên và điểm GPA tương ứng:
/*
SELECT
	Students.StudentId,
	Students.Gpa
FROM
	Students
*/
--
DECLARE @studentId NVARCHAR(50)
DECLARE @gpa FLOAT

DECLARE cursorStudent CURSOR 
FOR
	SELECT
		Students.StudentId,
		Students.Gpa
	FROM
		Students

OPEN cursorStudent

FETCH NEXT FROM cursorStudent	
INTO
	@studentId,
	@gpa

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @studentId +'-' +CAST(@gpa AS NVARCHAR(50))
	FETCH NEXT FROM cursorStudent	
	INTO
		@studentId,
		@gpa
END
CLOSE cursorStuent
DEALLOCATE cursorStudent
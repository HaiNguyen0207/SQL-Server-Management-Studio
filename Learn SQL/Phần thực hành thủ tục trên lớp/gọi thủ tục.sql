/*
EXEC usp_StudentByBirthDate 2007
EXEC usp_DeleteStudentById 'B25DCCN124'

DECLARE @studentId1 NVARCHAR(250)
DECLARE @studentId2 NVARCHAR(250)
DECLARE @result NVARCHAR(250) 
SET @studentId1 ='B25DCCN105'
SET @studentId2 ='B25DCCN106'
EXEC usp_CheckStudentByYearOfBirth 
	@studentId1 = @studentId1,
	@studentId2 = @studentId2 ,
	@result = @result OUT

PRINT @result
*/
--
DECLARE @studentId1 NVARCHAR(250)
DECLARE @studentId2 NVARCHAR(250)
DECLARE @result NVARCHAR(250) 
SET @studentId1 ='B25DCCN101'
SET @studentId2 ='B25DCCN104'
EXEC usp_CompareStudentById 
	@studentId1 = @studentId1,
	@studentId2 = @studentId2 ,
	@result = @result OUT

PRINT @result
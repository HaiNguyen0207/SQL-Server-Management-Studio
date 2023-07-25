-- Viết một thủ tục đưa ra các sinh viên có năm sinh bằng với năm sinh được 
--nhập vào (lấy năm sinh bằng hàm datepart(yyyy,ngaysinh))/*CREATE PROC usp_StudentByBirthDate (	@year INT )ASBEGINSELECT	*FROM	StudentsWHERE	YEAR(Students.BirthDate ) =@yearEND*/-- Viết thủ tục xóa dữ liệu của sinh viên theo mã sinh viênCREATE PROC usp_DeleteStudentById (	@studentId NVARCHAR(250))ASBEGIN	DELETE	FROM		Students	WHERE		StudentId = @studentIdEND--Viết một thủ tục kiểm tra xem hai sinh viên có cùng năm sinh hay không/*CREATE PROC usp_CheckStudentByYearOfBirth(	@studentId1 NVARCHAR(250),	@studentId2 NVARCHAR(250) ,	@result NVARCHAR(250) OUT)ASBEGIN	DECLARE @yearOfBirth1 INT 	DECLARE @yearOfBirth2 INT  	SELECT		 @yearOfBirth1 =YEAR(Students.BirthDate)	FROM		Students	WHERE	StudentId = @studentId1	SELECT		 @yearOfBirth2=YEAR(Students.BirthDate)	FROM		Students	WHERE		StudentId = @studentId2	IF @yearOfBirth1 = @yearOfBirth2		BEGIN			SET @result ='TRUE'		END	ELSE		BEGIN			SET @result ='FALSE'		ENDEND*/--Viết thủ tục so sánh 2 sinh viên có mã được nhập vào xem sinh viên nào 
--được sinh trước
CREATE PROC usp_CompareStudentById(
	@studentId1 NVARCHAR(250) ,
	@studentId2 NVARCHAR(250),
	@result NVARCHAR(250) OUT 
)
AS
BEGIN
	DECLARE @birthDateStu1 DATE 
	DECLARE @birthDateStu2 DATE 
--
	SELECT
		@birthDateStu1 = Students.BirthDate
	FROM
		Students
	WHERE
		StudentId =@studentId1
--
	SELECT
		@birthDateStu2 = Students.BirthDate
	FROM
		Students
	WHERE
		StudentId =@studentId2
--
	IF @birthDateStu1 > @birthDateStu2
		BEGIN
			SET @result = @studentId2 +N' sinh trước' + @studentId1
		END
	ELSE IF @birthDateStu1 < @birthDateStu2
		BEGIN
			SET @result = @studentId1 +N' sinh trước' + @studentId2
		END
	ELSE 
		BEGIN
			SET @result = @studentId1 +N' và'+ @studentId2 +N' sinh cùng ngày'
		END
END
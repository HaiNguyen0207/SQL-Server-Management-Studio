CREATE PROC usp_DeleteStudentById (
	@studentId NVARCHAR(250)
)
AS
BEGIN
	DELETE FROM SinhVien
	WHERE SinhVien.MaSV = @studentId
END

--
EXEC usp_DeleteStudentById 'AT170530'
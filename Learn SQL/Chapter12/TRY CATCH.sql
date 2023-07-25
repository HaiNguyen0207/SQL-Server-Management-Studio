--TRY CATCH 
--Ví dụ sau minh họa bắt và xử lý ngoại lệ chia cho 0:
CREATE OR ALTER PROC usp_Divide (
	@a FLOAT ,
	@b FLOAT ,
	@c FLOAT(2) OUT
)
AS
BEGIN
	BEGIN TRY
		SET @c = @a / @b
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_LINE() ErrorLine,
			ERROR_STATE() ErrorState,
			ERROR_NUMBER() ErrorNumber,
			ERROR_PROCEDURE() ErrorProcedure,
			ERROR_MESSAGE() ErrorMessage,
			ERROR_SEVERITY() ErrorSeverity
	END CATCH
END
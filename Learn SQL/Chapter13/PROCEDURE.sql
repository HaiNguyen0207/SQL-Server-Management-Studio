--Tạo mới stored procedure.
/*
CREATE PROCEDURE usp_Customers_Select
AS
BEGIN
	SELECT
		*
	FROM
		Customers
END
*/
--Chạy một stored procedure.
/*
EXEC usp_Customers_Select
*/
--Sửa một stored procedure.
/*
ALTER PROC usp_Customers_Select
AS
BEGIN
	SELECT
		Customers.CustomerId,
		Customers.LastName +' ' + Customers.FirstName fullName ,
		Customers.PhoneNumber,
		Customers.City
	FROM
		Customers
END

EXEC usp_Customers_Select
*/
--Xóa một stored procedure.
DROP PROC usp_Customers_Select
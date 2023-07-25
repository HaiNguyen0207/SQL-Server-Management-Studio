--khai báo một biến bạn sử dụng keyword DECLARE với cú pháp sau:
/*
DECLARE @Gpa FLOAT
SET @Gpa = 3.75
PRINT @Gpa
*/

--Ví dụ sau sử dụng biến với câu lệnh SELECT:
/*
DECLARE @district NVARCHAR(50)
SET  @district =N'Nam Từ Liêm'
SELECT
	*
FROM
	Stores
WHERE
	Stores.District =@district
*/
--Lưu trữ kết quả truy vấn trong một biến
/*
DECLARE @numberOfStudent INT
SET @numberOfStudent = (
	SELECT	
		COUNT(*)
	FROM
	Students	
	)

PRINT @numberOfStudent
SELECT  @numberOfStudent NumberOfStudent
*/
--Lấy danh sách toàn bộ khách hàng trong bảng Customers:
/*
CREATE  OR ALTER PROC usp_Customers_GetCustomerList
AS
BEGIN
	DECLARE @customerList NVARCHAR(MAX)
	SET @customerList ='';
	SELECT
		@customerList = @customerList +STR(Customers.CustomerId)+' - ' +
		Customers.LastName +' ' + Customers.FirstName +' - ' +
		Customers.Email + CHAR(10)
	FROM
		Customers
	ORDER BY
		Customers.FirstName
	--Hien thi ket qua
	PRINT @customerList
END

--Ham thuc thi
EXEC  usp_Customers_GetCustomerList
*/
--Khai báo biến lưu giá trị điểm Gpa thấp nhất của sinh viên trong bảng Students.
--Hiển thị giá trị này ra màn hình.

--làm theo cách thủ công cách 1
/*
SELECT TOP 1 WITH TIES
	*
FROM
	Students
ORDER BY
	Students.Gpa
*/
--Cách 2 :
/*
DECLARE @minGpa FLOAT;
SET @minGpa = (
	SELECT
		MIN(Students.Gpa)
	FROM
		Students
	)

SELECT
	*
FROM
	Students
WHERE
	Students.Gpa =@minGpa
*/
--Khai báo biến lưu trữ giá trị điểm Gpa cao nhất của sinh viên trong bảng Students.
--Hiển thị kết quả ra màn hình
--Cach 1
/*
SELECT TOP 1 
	*
FROM
	Students
ORDER BY
	Students.Gpa DESC
*/
--Cach 2 
/*
DECLARE @maxGpa FLOAT;
SET @maxGpa = (
	SELECT
		MIN(Students.Gpa)
	FROM
		Students
	)

SELECT
	*
FROM
	Students
WHERE
	Students.Gpa =@maxGpa
*/
--Khai báo biến lưu trữ giá trị điểm Gpa trung bình của các sinh viên trong bảng Students.
--Hiển thị kết quả ra màn hình.
/*
DECLARE @avgGpa FLOAT
SET @avgGpa = (
	SELECT	
		AVG(Gpa)
	FROM
		Students
	)

SELECT @avgGpa [Điểm Trung Bình ]
*/
--Khai báo biến đếm số lượng sinh viên có điểm TB từ 3.50 trở lên trong bảng Students.
--Hiển thị kết quả ra màn hình.
/*
DECLARE @gpa FLOAT
SET @gpa = (
	SELECT	
		COUNT(*)
	FROM
		Students
	WHERE
		Students.Gpa >= 3.5
	)

SELECT	 @gpa NumberOfStudent
*/
--Khai báo biến đếm số lượng sinh viên trong bảng Students sinh vào tháng chẵn. 
--Hiển thị kết quả ra màn hình.
DECLARE @monthEver INT
SET @monthEver = (
	SELECT	
		COUNT(*)
	FROM
		Students
	WHERE
		MONTH(Students.BirthDate ) % 2  = 0
	)

SELECT @monthEver NumberOfStudent
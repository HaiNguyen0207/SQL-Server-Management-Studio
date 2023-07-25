/*
CREATE INDEX IX_Customers_PhoneNumber
ON Customers(PhoneNumber)
INCLUDE(LastName, FirstName, City, District)
WHERE PhoneNumber >= '0900000000';

SELECT
	Customers.FirstName,
	Customers.LastName,
	Customers.City,
	Customers.PhoneNumber
FROM
	Customers
WHERE
	Customers.PhoneNumber >= '090'
*/
/*
DROP INDEX IX_Customers_PhoneNumber 
ON Customers

CREATE INDEX IX_Customers_PhoneNumber
ON Customers(PhoneNumber)
INCLUDE (LastName, FirstName, City, District)
WHERE PhoneNumber >= '0900000000'
*/
/*
SELECT
	Customers.FirstName,
	Customers.LastName,
	Customers.City,
	Customers.PhoneNumber
FROM
	Customers
WHERE
	Customers.PhoneNumber >= '090'
*/
--Tạo một cột mới đặt tên là EmailLocalPart chứa phần tên người dùng của emai(phần trước @).
/*
ALTER TABLE Customers
ADD LocalEmail
AS SUBSTRING(
	Email,
	0,
	CHARINDEX('@',email,0)
	)

CREATE INDEX IX_Customers_LocalEmail
ON Customers(LocalEmail)
*/
SELECT
	*
FROM
	Customers
WHERE
	Customers.LocalEmail =N'khanhnguyen'
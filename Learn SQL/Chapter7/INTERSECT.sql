--Xét bảng Students và bảng Customers. 
--Hãy cho biết họ và tên những người ở cùng thành phố? Đó là thành phố nào?

--
/*
SELECT
	s.LastName,
	s.FirstName,
	s.Address
FROM
	Students s
WHERE
	s.Address IN(
		SELECT	
			Students.Address
		FROM
			Students
		INTERSECT
		SELECT	
			Customers.City
		FROM
			Customers
		)
UNION
SELECT
	ctu.lastName,
	ctu.FirstName,
	ctu.City
FROM
	Customers ctu
WHERE
	ctu.City IN(
		SELECT
			Customers.City
		FROM
			Customers
		INTERSECT
		SELECT	
			Students.Address
		FROM
			Students
		)
*/
--Xét bảng Customers và Stores.
--Hãy cho biết tên các cửa hàng cùng quận với khách hàng, cho biết đó là quận nào?
/*
SELECT
	Stores.StoreName,
	Stores.District
FROM
	Stores
WHERE
	Stores.District IN(
		SELECT
			cus.District
		FROM
			Customers cus
		INTERSECT
		SELECT
			sto.District
		FROM
		Stores sto
		)

*/
--Xét bảng Customers và Stores. 
--Hãy cho biết tên các khách hàng cùng quận với quận có cửa hàng công nghệ đang mở, cho biết đó là quận nào?
/*
SELECT
	Customers.LastName +' ' +Customers.FirstName nameCustomer,
	Customers.District
FROM
	Customers
WHERE
	Customers.District = ANY (
		SELECT
			cus.District
		FROM
			Customers cus
		INTERSECT
		SELECT
			sto.District
		FROM
		Stores sto
		)

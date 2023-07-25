--Hãy cho biết các nhân viên làm việc tại các cửa hàng có địa chỉ ở thành phố Hà Nội?
/*
SELECT
	Stores.City,
	Staffs.StaffId,
	Staffs.LastName +' ' + Staffs.FirstName fullName
FROM
	Staffs,
	Stores
WHERE
	Staffs.StoreId = Stores.StoreId
	AND
	Staffs.StoreId IN(
		SELECT
			sto.StoreId
		FROM
			Stores sto
		WHERE
			sto.City =N'Hà Nội '
		)
*/
-- Hãy cho biết tên người quản lý và số nhân viên dưới quyền được quản lý bởi người đó.
/*
SELECT
	sta.StaffId,
	sta.LastName +' '+ sta.FirstName nameManager,
	(
		SELECT
			COUNT(s.ManagerId)
		FROM
			Staffs s
		WHERE
			s.ManagerId = sta.staffId
		) NumberOffStaff

FROM
	Staffs sta
WHERE
	sta.ManagerId iS NULL 
*/
--Cho biết thông tin các nhân viên làm việc tại các cửa hàng có địa chỉ không ở Hà Nội:
/*
SELECT
	Stores.City,
	Staffs.StaffId,
	Staffs.LastName +' ' + Staffs.FirstName fullName
FROM
	Staffs,
	Stores
WHERE
	Staffs.StoreId = Stores.StoreId
	AND
	Staffs.StoreId NOT IN(
		SELECT
			sto.StoreId
		FROM
			Stores sto
		WHERE
			sto.City =N'Hà Nội '
		)
*/
--
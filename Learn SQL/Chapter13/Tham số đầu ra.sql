--Các tham số đầu ra / kết quả
/*
CREATE OR ALTER PROC usp_Students_MinMaxGpa(
	@major NVARCHAR(200),
	@minGpa FLOAT OUT,
	@maxGpa FLOAT OUT 
)
AS
BEGIN
SELECT
	@minGpa = MIN(Gpa),
	@maxGpa = MAX(Gpa)
FROM
	Students
WHERE
	Major =@major
END
*/
--Hãy cho biết sinh viên nào có điểm cao nhất học ngành CNTT.
/*
CREATE PROC usp_Students_studentByMaxGpa(
	@studentId NVARCHAR(50) OUT,
	@fullName NVARCHAR(50) OUT,
	@major NVARCHAR(50) OUT,
	@gpa FLOAT OUT
)
AS
BEGIN
	SELECT
		@gpa =MAX(Students.Gpa)
	FROM
		Students
	--
	SELECT
		@studentId =Students.StudentId,
		@fullName =Students.LastName +' ' +Students.MidName +' ' +Students.FirstName,
		@major = Students.Major
	FROM	
		Students
	WHERE
		Students.Gpa =@gpa
END

*/
--Hãy cho biết tên, ngày sinh, điểm TB của các sinh viên trong bảng Student. 
--Chỉ rõ thông tin sinh viên có điểm thấp nhất?
/*
CREATE PROC usp_Students_studentsList(
	@studentId NVARCHAR(50)  OUT,
	@fullName NVARCHAR(50) OUT,
	@major NVARCHAR(50) OUT ,
	@gpa FLOAT OUT 
)
AS
BEGIN
	SELECT
		@gpa =MIN(Students.Gpa)
	FROM
		Students
	SELECT
		@studentId =Students.StudentId,
		@fullName =Students.LastName +' ' +Students.MidName +' ' +Students.FirstName,
		@major = Students.Major,
		@gpa = Students.Gpa
	FROM	
		Students
	WHERE
		Students.Gpa =@gpa
	
END

*/
--Hãy cho biết tên người quản lý và cửa hàng nơi làm việc của nhân viên mã X cho trước

CREATE PROC usp_Stores_StaffById (
	@StaffId INT,
	@NameStaff NVARCHAR(50) OUT,
	@managerId NVARCHAR(50) OUT,
	@nameManager NVARCHAR(50) OUT,
	@storeId NVARCHAR(50) OUT,
	@nameStore NVARCHAR(50) OUT
)
AS
BEGIN
	SELECT
		@NameStaff =s1.LastName +' ' +s1.FirstName,
		@managerId = s2.StaffId,
		@nameManager = s2.LastName +' ' +s2.FirstName,
		@storeId =sto.StoreId,
		@nameStore =sto.StoreName
	FROM
		Staffs s1
		JOIN
		Staffs s2
		ON
		S1.ManagerId = s2.StaffId
		JOIN
		Stores sto
		ON
		s2.StoreId =sto.StoreId
WHERE
	s1.StaffId =@StaffId
END


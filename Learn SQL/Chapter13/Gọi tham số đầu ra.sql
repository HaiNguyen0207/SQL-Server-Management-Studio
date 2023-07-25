/*
DECLARE @major NVARCHAR(200)
DECLARE @minGpa FLOAT
DECLARE @maxGpa FLOAT 
SET @major ='CNTT'
EXEC  usp_Students_MinMaxGpa 
	@major =@major,
	@minGpa = @minGpa OUT,
	@maxGpa = @maxGpa OUT

SELECT
	@major Major,
	@minGpa minGpa,
	@maxGpa maxGPa
*/
--
/*
DECLARE @studentId NVARCHAR(50) 
DECLARE	@fullName NVARCHAR(50) 
DECLARE @major NVARCHAR(50) 
DECLARE @gpa FLOAT

EXEC usp_Students_StudentsList 
	@studentId =@studentId OUT,
	@fullName = @fullName OUT,
	@major = @major OUT,
	@gpa = @gpa OUT

SELECT
	@studentId StudentId,
	@fullName FullName,
	@major Major,
	@gpa Gpa

*/
DECLARE @managerId NVARCHAR(50) 
DECLARE @nameManager NVARCHAR(50)
DECLARE @storeId NVARCHAR(50)
DECLARE @nameStore NVARCHAR(50) 
DECLARE @idStaff INT
DECLARE @nameStaff NVARCHAR(50)
SET @idStaff =6
EXEC usp_Stores_StaffById 
	@staffId  = @idStaff,
	@nameStaff =@nameStaff OUT,
	@managerId =@managerId OUT,
	@nameManager = @nameManager OUT,
	@storeId =@StoreId OUT,
	@nameStore = @nameStore OUT

SELECT
	@idStaff StaffId,
	@nameStaff NameStaff,
	@managerId ManagerId,
	@nameManager NameManager,
	@storeId StoreId,
	@nameStore NameStore
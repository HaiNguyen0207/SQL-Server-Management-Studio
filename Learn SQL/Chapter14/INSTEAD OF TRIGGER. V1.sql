--Tạo INSTEAD OF trigger cho hành động thêm mới một sinh viên vào view StudentApprovalInfo. 
--Dữ liệu cần được lưu vào bảng StudentApprovals trước khi chính thức được đưa vào bảng Students.
CREATE TRIGGER TR_StudentApprovals_Insert 
ON vw_StudentsInfo
INSTEAD OF INSERT ,DELETE
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		StudentId
	INTO
		#StudentId
	FROM
		vw_StudentsInfo

	---

	SET NOCOUNT ON
	INSERT INTO StudentApprovals (
		StudentId,
		FirstName,
		LastName,
		MidName,
		Address,
		Major,
		BirthDate,
		PhoneNumber,
		Gpa
	)

	--
	
	SELECT
		ins.StudentId,
		ins.FirstName,
		ins.LastName,
		ins.MidName,
		ins.Address,
		ins.Major,
		ins.BirthDate,
		ins.PhoneNumber,
		ins.Gpa
	FROM
		inserted ins
	WHERE
		ins.StudentId NOT IN (
			SELECT
				StudentId
			FROM
				#StudentId
			)
END
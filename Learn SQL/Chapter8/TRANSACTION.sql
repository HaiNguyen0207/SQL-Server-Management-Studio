--Thêm mới môn học vào bảng môn học sau đó sửa số tín chỉ và số tiết học thành 4 và 48.
--Chú ý mã môn học không được trùng nhau.
/*
BEGIN TRAN
	INSERT INTO
		Subjects(SubjectId,Name,Type)
	VALUES
		('SUBJ1208',N'Cơ sở dữ liệu ',N'Nâng Cao')
	UPDATE
		Subjects
	SET
		Credit =4,
		NumOfLesson = 48
	WHERE
		SubjectId = 'SUBJ1208'
COMMIT

*/
--thêm mới bản đăng ký của sinh viên vào bảng Register:
BEGIN TRAN
	INSERT INTO	
		Subjects(SubjectId ,Name, Type)
	VALUES
		('SUBJ1310',N'Mật Mã Học ',N'Chuyên Ngành ')
	UPDATE
		Subjects
	SET
		Credit = 4,
		NumOfLesson = 48
	WHERE
		SubjectId = 'SUBJ1310'
	INSERT INTO
		Registers(StudentId ,SubjectId ,RegisterStatus )
	VALUES 
		('B25DCDT108','SUBJ1207' ,N'Thành Công ')
COMMIT
/*
UPDATE
	LearnSQL.dbo.ITStudents
SET
	Gpa = 3.36
WHERE
	PK_ITStudents ='B25DCCN101'
*/
--Cập nhật điểm các sinh viên ở Hà Nội tăng thêm 0.1 điểm.
/*
UPDATE
	LearnSQL.dbo.Students
SET
	Gpa +=0.1
WHERE
	Address=N'Hà Nội '
*/
/*
UPDATE
	LearnSQL.dbo.Students
SET
	Gpa=3.39
WHERE
	StudentId = 'B25DCHT100'
*/
--Cộng 0.2 điểm cho các sinh viên sinh vào tháng chẵn.
/*
UPDATE
	LearnSQL.dbo.Students
SET
	Gpa+= 0.2
WHERE
	MONTH(BirthDate) % 2 =0
*/
--Cộng 0.3 điểm cho các sinh viên sinh vào ngày chia hết cho 3.
/*
UPDATE
	LearnSQL.dbo.Students
SET
	Gpa = 3.21
WHERE
	Month(BirthDate) % 2 =0
*/
--Đổi địa chỉ các sinh viên ở ‘Đà Nẵng’ thành ‘Bình Định’.

UPDATE
	LearnSQL.dbo.Students
SET
	Address=N'Bình Định '
WHERE
	Address =N'Đà Nẵng '
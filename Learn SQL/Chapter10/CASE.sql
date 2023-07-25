--Hãy cho biết số lượng bản ghi ở từng trạng thái đăng ký 
--của các sinh viên trong bảng đăng ký môn học?
/*
SELECT
	Register.RegisterStatus ,
	COUNT(Register.RegisterStatus) RegisterCount
FROM
	Register
GROUP BY
	Register.RegisterStatus
*/
--Bây giờ ta chuyển trạng thái đăng ký từ tiếng Việt sang tiếng Anh:
/*
SELECT
	CASE 
		Register.RegisterStatus
		WHEN N'Đã hủy' THEN 'Canceled'
		WHEN N'Lỗi đăng ký' THEN 'Error'
		WHEN N'Thành công' THEN 'Success '
	END RegisterStatus,
	COUNT(Register.RegisterStatus) RegisterCount
FROM
	Register
GROUP BY
	Register.RegisterStatus
*/
--Ví dụ sử dụng biểu thức CASE trong hàm tổng hợp để đếm số lượng các bản đăng ký theo từng trạng thái:
/*
SELECT
	SUM(CASE 
		Register.RegisterStatus
			WHEN N'Thành công' THEN 1 ELSE 0
		END) Success,
	SUM(CASE 
		Register.RegisterStatus
			WHEN N'Đã hủy' THEN 1 ELSE 0
		END) Canceled,
	SUM(CASE 
		Register.RegisterStatus
			WHEN N'Lỗi đăng ký' THEN 1 ELSE 0
		END) Error,
		COUNT(*) Total
FROM
	Register
*/
--Ví dụ: Phân loại học lực cho các sinh viên trong bảng Student:
SELECT
	s.*,
	CASE 
		WHEN s.Gpa >= 3.6 AND s.Gpa <= 4.0 THEN N'Xuất Xắc '
		WHEN s.Gpa >= 3.2THEN N'Giỏi'
		WHEN s.Gpa >= 2.8THEN N'Khá'
		WHEN s.Gpa >= 2.5THEN N'Trung Bình'
		WHEN s.Gpa >= 2.0THEN N'TB Yếu'
		WHEN s.Gpa >= 0THEN N'Yếu'
		ELSE N'Điểm không hợp lệ '
		END Capacity 

FROM
	Student s
ORDER BY
	s.Gpa DESC
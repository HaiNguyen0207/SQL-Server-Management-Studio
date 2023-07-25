/*
Hãy cho biết thông tin các sinh viên sinh vào tháng 6 hoặc tháng 10 sắp xếp tăng dần theo mã sinh viên.
Hãy cho biết thông tin các môn học có số tín chỉ > 3 hoặc có số tiết học từ 45 trở lên.
Hãy cho biết thông tin các sinh viên thỏa mãn điều kiện: hoặc có tên dài nhất hoặc có điểm TB cao nhất
*/

--Hãy cho biết thông tin các sinh viên sinh vào tháng 6 hoặc tháng 10 sắp xếp tăng dần theo mã sinh viên.
/*
SELECT 
	*
FROM
	Student
WHERE
	MONTH(Student.BirthDate) =6
	OR
	MONTH(Student.BirthDate) =10
ORDER BY
	Student.Id
*/

--Hãy cho biết thông tin các môn học có số tín chỉ > 3 hoặc có số tiết học từ 45 trở lên.
/*
SELECT	
	*
FROM
	Subject
WHERE
	Subject.Credit >3
	OR
	Subject.NumOfLesson >=45
*/

--Hãy cho biết thông tin các sinh viên thỏa mãn điều kiện: hoặc có tên dài nhất hoặc có điểm TB cao nhất

SELECT TOP 1 WITH TIES
	*
FROM
	Student
 ORDER BY
	Student.Gpa DESC 
	
	
	



			

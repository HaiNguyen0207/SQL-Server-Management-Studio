/*Cho biết top 10% sinh viên có ngày sinh nhỏ nhất.
SELECT TOP 10  WITH TIES 
	*
FROM
	Student
ORDER BY
	Day(BirthDate) DESC
*/

/*Cho biết top 5 sinh viên có tên dài nhất. Hiển thị cả các sinh viên tên cùng độ dài thỏa mãn
SELECT TOP 5 WITH TIES
	*
FROM
	Student
ORDER BY
len(FullName) DESC
*/

/*
Cho biết top 3 môn học có số tiết học nhiều nhất.

SELECT TOP 3 WITH TIES
	*
FROM
	Subject
ORDER BY
NumOfLesson DESC
*/

/*
Cho biết top 20% các môn học có số tín chỉ nhiều nhất.
*/
SELECT TOP 20 PERCENT WITH TIES
	*
FROM
	Subject
ORDER BY
	Credit DESC
/*
Lấy 4 môn học có số tín chỉ cao nhất.
SELECT 
	*
FROM
	Subject
ORDER BY
	Credit DESC
OFFSET 0 ROW
FETCH NEXT 4 ROW ONLY
*/

/*
Lấy 5 môn học sau 5 môn học đầu tiên có số tiết học cao nhất.
SELECT 
	*
FROM
	Subject
ORDER BY
	NumOfLesson DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY
*/

/*
Lấy 5 môn học từ vị trí k bất kỳ theo thứ tự tên môn học từ ngắn nhất đến dài nhất.
*/

SELECT 
	*
FROM
	Subject
ORDER BY
	len(Name)
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY
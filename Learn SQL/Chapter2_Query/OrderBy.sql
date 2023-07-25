/*Sắp xếp danh sách môn học theo độ dài tên môn học tăng dần.
SELECT 
	*
FROM
	Subject
ORDER BY
Len(Name)
*/

/*
Sắp xếp danh sách môn học theo số tín chỉ giảm dần, tên tăng dần.
SELECT
	*
FROM
	Subject
ORDER BY
	Credit DESC ,Name ASC
*/


/*Cho biết mã, tên môn học trong đó sắp xếp theo số tiết tăng dần.
SELECT
	Id,Name
FROM
	Subject
ORDER BY
	 NumOfLesson
	 */

 /*Cho biết mã, tên môn học, số tín chỉ của các môn học sắp xếp theo thứ tự từ điển(*) của loại môn học.
 */
 SELECT 
	Name,Credit
FROM
	Subject	
ORDER BY
 Type
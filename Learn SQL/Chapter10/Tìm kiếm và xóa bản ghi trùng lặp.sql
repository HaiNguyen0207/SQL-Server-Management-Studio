--Tạo bảng Test 1
/*
CREATE TABLE
	LearnSQL.dbo.Test1(
		Id INT PRIMARY KEY IDENTITY(100,1) ,
		Col1 INT NOT NULL,
		Col2 INT NOT NULL,
	)
*/
--Thêm dữ liệu vào 
/*
INSERT INTO	
	LearnSQL.dbo.Test1
		(Col1 ,Col2)
VALUES
	(1,1),
	(2,1),
	(1,1),
	(3,1),
	(1,2),
	(2,1),
	(3,1),
	(4,1),
	(1,2),
	(1,6),
	(1,9),
	(7,1),
	(1,1)
*/
--Tìm kiếm các bản ghi trùng lặp
/*
SELECT
	Col1,
	Col2,
	COUNT(Id) numberOfOccurren
FROM
	Test1
GROUP BY
	Col1,
	Col2
*/
-- xóa bản ghi trùng lặp
--đầu tiên .tìm min Id của các bản trùng lặp
/*
SELECT
	MIN(Id)
FROM
	Test1
GROUP BY
	Col1,
	Col2
*/
--xóa bản ghi trùng lặp
DELETE
FROM	
	LearnSQL.dbo.Test1
WHERE
	Id NOT IN(
	SELECT
		MIN(Id)
	FROM
		Test1
	GROUP BY
		Col1,
		Col2
	)
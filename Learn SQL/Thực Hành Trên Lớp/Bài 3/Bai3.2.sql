--phần 2
--1. Cho biết mã môn học, tên môn học, điểm thi tất cả các môn của sinh viên tên Thức
--c1
SELECT
	MonHoc.MaMH,
	MonHoc.TenMH,
	KetQua.Diem
FROM
	MonHoc 
	JOIN
	KetQua 
	ON
	MonHoc.MaMH = KetQua.MaMH
	JOIN
	SinhVien
	ON
	KetQua.MaSV =SinhVien.MaSV
WHERE
	SinhVien.TenSV LIKE N'%Thức'
--c2 :
SELECT
	MonHoc.MaMH,
	MonHoc.TenMH,
	KetQua.Diem
FROM
	MonHoc,KetQua,SinhVien
WHERE
	SinhVien.TenSV LIKE N'%Thức'
	AND
	KetQua.MaMH = MonHoc.MaMH
	AND
	KetQua.MaSV =SinhVien.MaSV
--c3
SELECT
	MonHoc.MaMH,
	MonHoc.TenMH,
	KetQua.Diem
FROM
	KetQua
	JOIN
	Monhoc
	ON
	KetQua.MaMH =MonHoc.MaMH
WHERE
	KetQua.MaSV IN (
		SELECT
			SinhVien.MaSV
		FROM
			SinhVien
		WHERE
			SinhVien.TenSV LIKE N'%Thức'
		)

--2.Cho biết mã môn học, tên môn và điểm thi ở những môn mà sinh viên tên Dung phải thi lại 
--(điểm<5)
SELECT
	MonHoc.MaMH,
	MonHoc.TenMH,
	KetQua.Diem
FROM
	MonHoc 
	JOIN
	KetQua 
	ON
	MonHoc.MaMH = KetQua.MaMH
	JOIN
	SinhVien
	ON
	KetQua.MaSV =SinhVien.MaSV
WHERE
	SinhVien.TenSV LIKE N'%DUNG'
	AND
	KetQua.Diem < 5

--3.cho biết mã sinh viên, tên những sinh viên đã thi ít nhất là 1 trong 3 môn Lý thuyết Cơ sở dữ
--liệu, Tin học đại cương, mạng máy tính.
SELECT DISTINCT
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV =KetQua.MaSV
	JOIN
	MonHoc
	ON
	MonHoc.MaMH = KetQua.MaMH
WHERE
	MonHoc.TenMH =N'Lý Thuyết Cơ Sở Dữ Liệu'
	OR
	MonHoc.TenMH =N'Tin Học Đại Cương'
	OR 
	MonHoc.TenMH =N'Mạng Máy Tính'

--4. Cho biết mã môn học, tên môn mà sinh viên có mã số 1 chưa có điểm (đổi AT170401)

SELECT
	MonHoc.MaMH,
	MonHoc.TenMH
FROM
	MonHoc
WHERE
	MonHoc.MaMH NOT IN (
		SELECT
			KetQua.MaMH
		FROM
			KetQua
		WHERE
			KetQua.MaSV =  'AT170401'
			)
--5 . Cho biết điểm cao nhất môn 1 mà các sinh viên đạt được
-- ở đây cho là môn học có mã MH1001
SELECT
	MAX(KetQua.Diem) MaxGpa
FROM
	KetQua
WHERE
	KetQua.MaMH ='MH1001'
--6.Cho biết mã sinh viên, tên những sinh viên có điểm thi môn 2 không thấp nhất (mã môn học MH1002)
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	KetQua
	JOIN
	SinhVien
	ON
	KetQua.MaSV = SinhVien.MaSV
WHERE
	KetQua.Diem > (
		SELECT
			MIN(KetQua.Diem)
		FROM
			KetQua
		WHERE
			KetQua.MaMH='MH1002'
		)
	AND
	KetQua.MaMH ='MH1002'
--7.Cho biết mã sinh viên và tên những sinh viên có điểm thi môn 1(MH1001) lớn hơn điểm thi môn 1(MH1001) của 
--sinh viên có mã số (AT170403)
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV =KetQua.MaSV
WHERE
	KetQua.Diem >= (
		SELECT
			KetQua.Diem
		FROM
			KetQua
		WHERE
			KetQua.MaMH ='MH1001'
			AND
			KetQua.MaSV ='AT170403'
		)
	AND
	KetQua.MaMH ='MH1001'

--8. Cho biết số sinh viên phải thi lại môn Toán Cao cấp
SELECT
	COUNT(SinhVien.MaSV) [Số sinh viên thi lại ]
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV = KetQua.MaSV
	JOIN 
	MonHoc
	ON
	KetQua.MaMH = MonHoc.MaMH
WHERE
	MonHoc.TenMH = N'Toán Cao Cấp '
	AND
	KetQua.Diem <5
--9.Đối với mỗi môn, cho biết tên môn và số sinh viên phải thi lại môn đó mà số sinh viên thi lại 
-->=2
--c1
SELECT
	MonHoc.MaMH ,
	MonHoc.TenMH,
	COUNT(Result.Diem) [Số lượng Thi lại] 
FROM
	MonHoc
	 LEFT JOIN
	( SELECT
		KetQua.MaMH MaMH,
		KetQua.Diem Diem
	FROM
		KetQua
	WHERE
		KetQua.Diem <= 5
	) result
	ON
	result.MaMH = MonHoc.MaMH
GROUP BY
	MonHoc.MaMH,
	MonHoc.TenMH
--9.Đối với mỗi môn, cho biết tên môn và số sinh viên phải thi lại môn đó mà số sinh viên thi lại 
-- c2
SELECT
	MonHoc.MaMH,
	MonHoc.TenMH,
	COUNT(KetQua.MaSV) [Số lượng thi lại ]
FROM
	MonHoc
	JOIN
	KetQua
	ON
	MonHoc.MaMH =KetQua.MaMH
WHERE
	KetQua.Diem < 5
GROUP BY
	MonHoc.MaMH,
	MonHoc.TenMH

-- 10. Cho biết mã sinh viên, tên và lớp của sinh viên đạt điểm cao nhất môn Tin đại cương

SELECT
	SinhVien.MaSV,
	SinhVien.TenSV,
	SinhVien.Lop
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV = KetQua.MaSV
	JOIN 
	MonHoc
	ON
	MonHoc.MaMH =KetQua.MaMH
WHERE
	MonHoc.TenMH =N'Tin Đại Cương'
	AND
	KetQua.Diem = (
		SELECT
			MAX(KetQua.Diem)
		FROM
			MonHoc
			JOIN
			KetQua
			ON
			MonHoc.MaMH = KetQua.MaMH
		WHERE
			MonHoc.TenMH =N'Tin Đại Cương'
			)
	


--11. Cho biết mã số và tên của những sinh viên tham gia thi tất cả các môn. (Giả sử cần thi tất cả các 
--môn có trong bảng Môn học)
--C1
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	SinhVien
WHERE
	SinhVien.MaSV IN (
		SELECT
			KetQua.MaSV
		FROM
			KetQua
		GROUP BY
			KetQua.MaSV
		HAVING
			COUNT(KetQua.MaMH) = (
				SELECT	
					COUNT(*)
				FROM
					MonHoc
				)
		)

--12 : Cho biết mã sinh viên và tên của sinh viên có điểm trung bình chung học tập >=6
SELECT
	KetQua.MaSV,
	SinhVien.TenSV,
	ROUND(SUM(Diem *DVHT) / SUM(DVHT),2) AvgGpa
FROM
	SinhVien
	JOIN
	KetQua
	ON
	KetQua.MaSV = SinhVien.MaSV
	JOIN
	MonHoc
	ON
	MonHoc.MaMH = KetQua.MaMH

GROUP BY
	KetQua.MaSV,
	SinhVien.TenSV
HAVING 
	AVG(ketQua.Diem) >= 6
-- 13. Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của toàn
--khóa.
SELECT
	KetQua.MaSV,
	SinhVien.TenSV,
	ROUND(SUM(DVHT * Diem) / SUM(DVHT),2) AvgGpa
FROM
	MonHoc
	JOIN
	KetQua
	ON
	MonHoc.MaMH = KetQua.MaMH
	JOIN
	SinhVien
	ON
	KetQua.MaSV = SinhVien.MaSV
GROUP BY
	KetQua.MaSV,
	SinhVien.TenSV
HAVING 
	AVG(ketQua.Diem) >= (
		SELECT
			ROUND(SUM(DVHT * Diem) / SUM(DVHT),2)
		FROM
			KetQua
			JOIN
			MonHoc
			ON
			KetQua.MaMH = MonHoc.MaMH
		)

--14.*Cho biết mã sinh viên và tên những sinh viên phải thi lại ở ít nhất là những môn mà sinh viên
--có mã số 3 (AT170403) phải thi lại
SELECT DISTINCT
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV =KetQua.MaSV
WHERE
	KetQua.Diem < 5
	AND
	SinhVien.MaSV != 'AT170403'
	AND
	KetQua.MaMH IN (
		SELECT
			KetQua.MaMH
		FROM
			KetQua
		WHERE
			KetQua.Diem <5
			AND
			KetQua.MaSV ='AT170403'
	)

--15 : *Cho mã sinh viên và tên của những sinh viên có hơn nửa số điểm >=5. 
--c1
SELECT
	result.MaSV,
	result.TenSV
FROM (
	SELECT	
		SinhVien.MaSV,
		SinhVien.TenSV,
		KetQua.Diem
	FROM
		KetQua
		JOIN
		SinhVien
		ON
		KetQua.MaSV = SinhVien.MaSV
	WHERE
		KetQua.Diem >= 5
	)  result
	JOIN
	(
	SELECT
		KetQua.MaSV,
		COUNT(KetQua.MaMh)/2 Soluong
	FROM
		KetQua
	GROUP BY
		KetQua.MaSV
	) result1
	ON
	result.MaSV =result1.MaSV
GROUP BY
	result.MaSV,
	result.TenSV,
	result1.Soluong
HAVING
	COUNT(result.Diem) >= result1.Soluong
ORDER BY
	result.MaSV
--c2
SELECT
	sv.MaSV,
	sv.TenSV
FROM
	SinhVien sv
	JOIN
	KetQua
	ON
	sv.MaSV =KetQua.MaSV
WHERE
	KetQua.Diem >= 5
GROUP BY
	sv.MaSV,
	sv.TenSV
HAVING
	COUNT(KetQua.Diem) >= (
		SELECT
			COUNT(KetQua.Diem) /2
		FROM
			KetQua
		GROUP BY
			KetQua.MaSV
		HAVING
			KetQua.MaSV = sv.MaSV
		)
--
--16 : Cho danh sách mã sinh viên, tên sinh viên có điểm môn Tin đại cương cao nhất của mỗi lớp.
/*
CREATE OR ALTER PROC usp_StudentMaxGpa (
	@class NVARCHAR(250),
	@studentId NVARCHAR(250) OUT,
	@fullName NVARCHAR(250) OUT,
	@gpa FLOAT OUT
)
AS
BEGIN
	SELECT TOP 1
		@studentId =SinhVien.MaSV,
		@fullName =SinhVien.TenSV,
		@gpa = KetQua.Diem
	FROM
		SinhVien
		JOIN 
		KetQua
		ON 
		SinhVien.MaSV = KetQua.MaSV
		JOIN 
		MonHoc
		ON
		MonHoc.MaMH = KetQua.MaMH
	WHERE
		SinhVien.Lop =@class
		AND
		MonHoc.TenMH=N'Tin Học Đại Cương'
	ORDER BY
		KetQua.Diem	 DESC
END


-- Lời Gọi
DECLARE @maSV NVARCHAR(250)
DECLARE @ten NVARCHAR(250)
DECLARE @diem NVARCHAR (250)
DECLARE @lop NVARCHAR(250)

DECLARE cursorGpa CURSOR
FOR
	SELECT
		SinhVien.Lop
	FROM
		SinhVien
--
OPEN cursorGpa
--
FETCH NEXT FROM cursorGpa INTO @lop
--
WHILE  @@FETCH_STATUS = 0 
	BEGIN
		EXEC usp_StudentMaxGpa
			@class = @lop ,
			@studentId =@maSV OUT,
			@fullName = @ten OUT,
			@gpa = @diem OUT		

			SELECT
				@lop LOP,
				@maSV MaSV,
				@ten Ten,
				@diem Diem
			
		FETCH NEXT FROM cursorGpa INTO @lop
	END
CLOSE cursorGpa
DEALLOCATE cursorGpa

*/
--16 : Cho danh sách mã sinh viên, tên sinh viên có điểm môn Tin đại cương cao nhất của mỗi lớp.
/*
DECLARE @class NVARCHAR(250)
SET @class ='L05'
SELECT TOP 1
	SinhVien.MaSV,
	SinhVien.TenSV
FROM
	SinhVien
	JOIN 
	KetQua
	ON 
	SinhVien.MaSV = KetQua.MaSV		
	JOIN 
	MonHoc
	ON
	MonHoc.MaMH = KetQua.MaMH
WHERE
	SinhVien.Lop = @class-- lớp khác thay tên
	AND
	MonHoc.TenMH=N'Tin Học Đại Cương'
ORDER BY
	KetQua.Diem	 DESC
*/
--17. *Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của lớp 
--sinh viên đó theo học
DECLARE @class NVARCHAR(250)
SET @class = 'L01'
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV,
	AVG(KetQua.Diem) avgGpa
FROM
	SinhVien
	JOIN
	KetQua
	ON
	SinhVien.MaSV = KetQua.MaSV
GROUP BY
	SinhVien.MaSV,
	SinhVien.TenSV,
	SinhVien.Lop
HAVING
	SinhVien.Lop =@class
	AND
	AVG(KetQua.Diem) >= (
		SELECT
			AVG(KetQua.Diem) avgGpa
		FROM
			SinhVien
			JOIN
			KetQua
			ON
			SinhVien.MaSV = KetQua.MaSV
		WHERE
			SinhVien.Lop = @class
		)
 --18.Đối với mỗi lớp, lập bảng điểm gồm mã sinh viên, tên sinh viên và điểm trung bình chung học 
--tập. 
--c1 sử dụng hàm

CREATE OR ALTER FUNCTION fn_TableAvgGpa (
	@class NVARCHAR(250)
)
RETURNS TABLE
AS
RETURN
	SELECT
		SinhVien.MaSV,
		SinhVien.TenSV,
		ROUND(AVG(KetQua.Diem),2) [Điểm trung bình]
	FROM
		SinhVien
		JOIN
		KetQua
		ON
		SinhVien.MaSV = KetQua.MaSV
	GROUP BY
		SinhVien.MaSV,
		SinhVien.TenSV,
		SinhVien.Lop
	HAVING
		SinhVien.Lop= @class
-- goị hàm 
-- giả dụ xem lớp L05
SELECT
	*
FROM
	dbo.fn_TableAvgGpa('L05')

--c2 : sử dụng proc
CREATE PROC usp_avgGpa(
	@class NVARCHAR(250)
)
AS
BEGIN
	SELECT
		SinhVien.MaSV,
		SinhVien.TenSV,
		ROUND(AVG(KetQua.Diem),2) [Điểm trung bình]
	FROM
		SinhVien
		JOIN
		KetQua
		ON
		SinhVien.MaSV = KetQua.MaSV
	GROUP BY
		SinhVien.MaSV,
		SinhVien.TenSV,
		SinhVien.Lop
	HAVING
		SinhVien.Lop= @class
END
-- gọi thủ tục
--giả dụ xem L05
EXEC usp_avgGpa 'L05'

--19. Đối với mỗi lớp, cho biết mã sinh viên và tên những sinh viên phải thi lại từ 2 môn trở lên
--c1 sử dụng hàm
CREATE FUNCTION fn_StudentReTest (
	@class NVARCHAR(250)
)
RETURNS TABLE
AS
RETURN
	SELECT
		result.lop,
		result.MaSV,
		result.TenSV
	FROM (
			SELECT
				SinhVien.MaSV,
				SinhVien.TenSV,
				SinhVien.Lop,
				KetQua.Diem
			FROM
				SinhVien
				JOIN
				KetQua
				ON
				SinhVien.MaSV =KetQua.Masv
			WHERE
				KetQua.Diem <5
		) AS result
	GROUP BY
		result.lop,
		result.MaSV,
		result.TenSV
	HAVING
		COUNT(result.Diem ) >= 2
		AND 
		result .Lop = @class

-- gọi hàm
SELECT
	*
FROM
	dbo.fn_StudentReTest('L05')
--c2 : sử dụng thủ tục
CREATE PROC usp_StudentReTest(
	@class NVARCHAR(250)
)
AS
BEGIN
	SELECT
		result.lop,
		result.MaSV,
		result.TenSV
	FROM (
			SELECT
				SinhVien.MaSV,
				SinhVien.TenSV,
				SinhVien.Lop,
				KetQua.Diem
			FROM
				SinhVien
				JOIN
				KetQua
				ON
				SinhVien.MaSV =KetQua.Masv
			WHERE
				KetQua.Diem <5
		) AS result
	GROUP BY
		result.lop,
		result.MaSV,
		result.TenSV
	HAVING
		COUNT(result.Diem ) >= 2
		AND 
		result .Lop = @class
END
-- GỌi thủ tục
EXEC usp_StudentReTest'L05'
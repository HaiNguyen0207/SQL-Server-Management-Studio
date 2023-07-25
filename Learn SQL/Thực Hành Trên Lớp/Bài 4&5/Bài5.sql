--1. Cho biết thông tin về các nhân viên có lương nhỏ hơn 10000
SELECT
	*
FROM
	NhanVien
WHERE
	Luong < 10000
--2. Cho biết thông tin về các chuyến bay có độ dài đường bay nhỏ hơn 10000km và lớn 
--hơn 8000km
SELECT
	*
FROM
	ChuyenBay
WHERE
	DoDai <10000 AND DoDai >8000
--3. Cho biết thông tin về các chuyến bay xuất phát từ Sài Gòn (SGN) đi Ban Mê Thuột 
--(BMV)
SELECT
	*
FROM
	ChuyenBay
WHERE
	GaDi ='SGN'
	AND
	GaDen ='BMV'
--4. Có bao nhiêu chuyến bay xuất phát từ Sài Gòn (SGN)
SELECT
	COUNT(*) [Số Lượng Chuyến Bay]
FROM
	ChuyenBay
WHERE
	GaDi ='SGN'
--5. Có bao nhiêu loại máy bay Boeing
SELECT
	COUNT(*) [Số Lượng]
FROM
	MayBay
WHERE
	Hieu LIKE'Boeing%'
--6. Cho biết tổng số lương phải trả cho các nhân viên
SELECT
	SUM(Luong) [Tổng Lương]
FROM
	NhanVien
--7. Cho biết mã số và tên của các phi công lái máy bay Boeing
SELECT DISTINCT
	NhanVien.MaNV,
	NhanVien.Ten
FROM
	MayBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	NhanVien.MaNV = ChungNhan.MaNV
WHERE
	MayBay.Hieu LIKE'Boeing%'
--8. Cho biết mã số và tên của các phi công có thể lái được máy bay có mã số là 747
SELECT DISTINCT
	NhanVien.MaNV,
	NhanVien.Ten
FROM	
	ChungNhan
	JOIN
	NhanVien
	ON
	NhanVien.MaNV = ChungNhan.MaNV
WHERE
	ChungNhan.MaMB =747
--9. Co biết mã số của các loại máy bay mà nhân viên có họ Nguyễn có thể lái
SELECT DISTINCT
	ChungNhan.MaMB
FROM	
	ChungNhan
	JOIN
	NhanVien
	ON
	NhanVien.MaNV = ChungNhan.MaNV
WHERE
	NhanVien.Ten LIKE'Nguyen%'
--10.Cho biết mã số của các phi công vừa lái được Boeing vừa lại được Airbus A320
SELECT DISTINCT
	ChungNhan.MaNV
FROM	
	MayBay 
	JOIN
	ChungNhan
	ON
	ChungNhan.MaMB = MayBay.MaMB
WHERE
	MayBay.Hieu LIKE'Boeing%'
INTERSECT
SELECT DISTINCT
	ChungNhan.MaNV
FROM	
	MayBay 
	JOIN
	ChungNhan
	ON
	ChungNhan.MaMB = MayBay.MaMB
WHERE
	MayBay.Hieu LIKE'Airbus A320'
--11.Cho biết các loại máy bay có thể thực hiện được chuyến bat VN280
SELECT
	MayBay.*
FROM
	MayBay
	JOIN
	ChuyenBay
	ON
	MayBay.TamBay >= ChuyenBay.DoDai
WHERE
	MaCB ='VN280'
--12.Cho biết các chuyến bay có thể thực hiện bởi máy bay Airbus A320
--c1
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay,MayBay
WHERE
	MayBay.Hieu='Airbus A320'
	AND
	MayBay.TamBay >= ChuyenBay.DoDai
--c2
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	MayBay.TamBay >= ChuyenBay.DoDai
WHERE
	MayBay.Hieu='Airbus A320'

--13.Với mỗi loại máy bay có phi công lái, cho biết mã số, loại máy bay và tổng số phi 
--công có thể lái loại máy bay đó
SELECT
	MayBay.MaMB,
	MayBay.Hieu,
	COUNT(DISTINCT ChungNhan.MaNV) [Số lượng phi công]
FROM
	MayBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
GROUP BY
	MayBay.MaMB,
	MayBay.Hieu
--14.Giả sử một hành khách muốn đi thẳng từ ga A đến ga B rồi quay trở về ga A. Cho biết 
--các đường bay nào có thể đáp ứng yêu cầu này. 
-- hiểu  theo đề là máy  bay nào có thể đáp ứng dc yêu cầu này
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay,MayBay
WHERE
	2 *ChuyenBay.DoDai <= MayBay.TamBay

--15.Với mỗi ga có chuyến bay xuất phát từ đó, cho biết có bao nhiêu chuyến bay khởi 
--hành từ ga đó và cho biết tổng chi phí phải trả chi phi công lái các chuyến bay khởi 
--hành từ ga đó.
SELECT	
	ChuyenBay.GaDi,
	COUNT(ChuyenBay.MaCB) [Số lượng chuyến bay],
	SUM(ChiPhi)[Tổng chi phí]
FROM
	ChuyenBay
GROUP BY
	ChuyenBay.GaDi
--16.Với mỗi ga xuất phát, cho biết có bao nhiêu chuyến bay có thể khởi hành trước 12:00
SELECT	
	ChuyenBay.GaDi,
	COUNT(ChuyenBay.MaCB) [Số lượng chuyến bay]
FROM
	ChuyenBay
WHERE
	ChuyenBay.GioDi <= '12:00:00'
GROUP BY
	ChuyenBay.GaDi
--17.Với mỗi phi công có thể lái nhiều hơn 3 loại máy bay, cho biết mã số phi công và tầm 
--bay lớn nhất của các loại máy bay mà phi công đó có thể lái
SELECT
	ChungNhan.MaNV,
	MAX(TamBay) [Tầm bay]
FROM
	ChungNhan
	JOIN
	MayBay
	ON
	ChungNhan.MaMB = MayBay.MaMB
GROUP BY
	ChungNhan.MaNV
HAVING
	COUNT(ChungNhan.MaMB) >=3
--18.Cho biết mã số của các phi công có thể lái được nhiều loại máy bay nhất
SELECT
	MaNV
FROM
	ChungNhan
GROUP BY
	ChungNhan.MaNV
HAVING
	COUNT(MaMB ) = (
		SELECT TOP 1
			COUNT( DISTINCT ChungNhan.MaMB)
		FROM
			ChungNhan
		GROUP BY
			ChungNhan.MaNV
		ORDER BY
			COUNT(ChungNhan.MaMB) DESC
			)
--19.Cho biết mã số của các phi công có thể lái được ít loại máy bay nhất.
SELECT
	MaNV
FROM
	ChungNhan
GROUP BY
	ChungNhan.MaNV
HAVING
	COUNT(MaMB ) = (
		SELECT  TOP 1
			COUNT( DISTINCT ChungNhan.MaMB)
		FROM
			ChungNhan
		GROUP BY
			ChungNhan.MaNV
		ORDER BY
			COUNT(ChungNhan.MaMB) ASC
			)
--20.Tìm các chuyến bay có thể được thực hiện bởi tất cả các loại máy bay Boeing
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay,MayBay
WHERE
	MayBay.Hieu LIKE'Boeing%'
	AND
	MayBay.TamBay >= ChuyenBay.DoDai
--c2
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	MayBay.TamBay >= ChuyenBay.DoDai
WHERE
	MayBay.Hieu LIKE'Boeing%'
--21.Tìm các chuyến bay có thể được lái bởi các phi công có lương lớn hơn 100.000
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	ChuyenBay.DoDai <= MayBay.TamBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV = NhanVien.MaNV
WHERE
	NhanVien.Luong >= 100000
--22.Cho biết tên các phi công có lương nhỏ hơn chi phí thấp nhất của đường bay từ Sài 
--Gòn (SGN) đến Buôn mê Thuột (BMV)
SELECT DISTINCT
	NhanVien.Ten
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	ChuyenBay.DoDai <= MayBay.TamBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV = NhanVien.MaNV
WHERE
	GaDi='SGN'
	AND
	GaDen='BWV'
	AND
	Luong <= ChuyenBay.ChiPhi
--23.Cho biết mã số của các phi công có lương cao nhất
SELECT
	MaNV
FROM
	NhanVien
WHERE
	NhanVien.Luong = (
		SELECT
			MAX(Luong)
		FROM
		NhanVien
	)
--24.Cho biết mã số của các nhân viên có lương cao thứ nhì
SELECT
	MaNV
FROM
	NhanVien
WHERE
	NhanVien.Luong = (
		SELECT DISTINCT
			Luong
		FROM
			NhanVien
		ORDER BY
			Luong DESC
		OFFSET 1 ROWS
		FETCH NEXT  1  ROWS ONLY
	)
--25.Cho biết tên và lương của các nhân viên không phải là phi công và có lương lớn hơn 
--lương trung bình của tất cả các phi công.
SELECT
	Ten,
	Luong
FROM
	NhanVien
WHERE
	NhanVien.MaNV NOT IN (
		SELECT
			ChungNhan.MaNV
		FROM
			ChungNhan
		)
GROUP BY
	Ten,
	Luong
HAVING
	Luong >= (
		SELECT
			AVG(Luong)
		FROM
			NhanVien
		)
--26.Cho biết tên các phi công có thể lái các máy bay có tầm bay lớn hơn 4.800km nhưng 
--không có chứng nhận lái máy bay Boeing
SELECT DISTINCT
	NhanVien.Ten
FROM	
	NhanVien
	JOIN 
	ChungNhan
	ON
	NhanVien.MaNV = ChungNhan.MaNV
	JOIN
	MayBay
	ON
	ChungNhan.MaMB = MayBay.MaMB
WHERE
	MayBay.TamBay >= 4800
	AND
	MayBay.Hieu NOT LIKE'Boeing%'
--27.Cho biết tên các phi công lái ít nhất 3 loại máy bay có tầm xa hơn 3200km
SELECT DISTINCT
	NhanVien.MaNV,
	NhanVien.Ten
FROM	
	NhanVien
	JOIN 
	ChungNhan
	ON
	NhanVien.MaNV = ChungNhan.MaNV
	JOIN
	MayBay
	ON
	ChungNhan.MaMB = MayBay.MaMB
WHERE
	TamBay >= 3200
GROUP BY
	NhanVien.MaNV,
	NhanVien.Ten
HAVING
	COUNT(MayBay.MaMB ) >= 3
--28.Với mỗi nhân viên, cho biết mã số, tên nhân viên và tổng số loại máy bay Boeing mà 
--nhân viên đó có thể lái
SELECT 
	NhanVien.MaNV,
	NhanVien.Ten,
	COUNT(MayBay.MaMB) [Số Lượng Máy Bay]
FROM	
	NhanVien
	JOIN 
	ChungNhan
	ON
	NhanVien.MaNV = ChungNhan.MaNV
	JOIN
	MayBay
	ON
	ChungNhan.MaMB = MayBay.MaMB
WHERE
	MayBay.Hieu LIKE'Boeing%'
GROUP BY
	NhanVien.MaNV,
	NhanVien.Ten
--29.Với mỗi loại máy bay, cho biết loại máy bay và tổng số phi công có thể lái loại máy 
--bay đó.
SELECT
	MaMB,
	COUNT(DISTINCT MaNV) [Số lượng phi công]
FROM
	ChungNhan
GROUP BY
	MaMB
--30.Với mỗi chuyến bay, cho biết mã số chuyến bay và tổng số phi công không thể lái 
--chuyến đó.
SELECT
	MaMB,
	(
		SELECT 
			COUNT(DISTINCT MaNV)
		FROM
			ChungNhan
		) -COUNT(DISTINCT MaNV) [Số lượng không phi công]
FROM
	ChungNhan
GROUP BY
	MaMB

--31.Với mỗi loại máy bay, cho biết loại máy bay và tổng số chuyến bay không thể thực 
--hiện bởi loại máy bay đó
SELECT
	MayBay.MaMB,
	COUNT(MaCB) [Tổng chuyến bay không thực hiện]
FROM
	MayBay
	JOIN
	ChuyenBay
	ON
	MayBay.TamBay < ChuyenBay.DoDai
GROUP BY
	MayBay.MaMB
--32.Với mỗi chuyến bay, hãy cho biết mã số chuyến bay và tổng số loại máy bay có thể 
--thực hiện chuyến bay đó
SELECT
	MayBay.MaMB,
	COUNT(MaCB) [Tổng chuyến bay không thực hiện]
FROM
	MayBay
	JOIN
	ChuyenBay
	ON
	MayBay.TamBay >= ChuyenBay.DoDai
GROUP BY
	MayBay.MaMB
--33.Với mỗi loại máy bay, hãy cho biết loại máy bay và tổng số phi công có lương lớn hơn 
--100.000 có thể lái loại máy bay đó.
SELECT
	MaMB,
	COUNT(ChungNhan.MaNV) [Số lượng nhân viên]
FROM
	ChungNhan
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	Luong >= 100000
GROUP BY
	MaMB
--34.Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương 
--trung bình của các phi công có thể lái loại máy bay đó.
SELECT
	MayBay.MaMB,
	AVG(Luong) [Lương trung bình]
FROM
	MayBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	TamBay >= 3200
GROUP BY
	MayBay.MaMB
--35.Với mỗi phi công, cho biết mã số, tên phi công và tổng số chuyến bay xuất phát từ Sài 
--Gòn mà phi công đó có thể lá
SELECT
	ChungNhan.MaNV,
	Ten,
	COUNT(DISTINCT ChuyenBay.MaCB) [Tổng số chuyến bay]
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	ChuyenBay.DoDai <= MayBay.TamBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	GaDi ='SGN'
GROUP BY
	ChungNhan.MaNV,
	Ten
--36.Một hành khách muốn đi từ Hà Nội (HAN) đến nha trang (CXR) mà không phải đổi 
--chuyến bay quá một lần. Cho biết mã chuyếnbay, thời gian khời hành từ Hà nội nếu 
--hành khách muốn đến Nha Trang trước 16:00
SELECT
	MaCB,
	GioDi,
	GioDen
FROM
	ChuyenBay
WHERE
	GaDi='HAN'
	AND 
	GaDen='CXR'
	AND
	GioDen <='16:00:00'
--37.Cho biết thông tin của các đường bay mà tất cả các phi công có thể bay trên đường 
--bay đó đều có lương lớn hơn 100000
SELECT DISTINCT
	ChuyenBay.*
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	ChuyenBay.DoDai <= MayBay.TamBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	Luong >= 100000
--	38.Cho biết tên các phi công chỉ lái các loại máy bay có tầm xa hơn 3200km và một trong 
--số đó là Boeing
SELECT DISTINCT
	Ten
FROM
	ChuyenBay
	JOIN
	MayBay
	ON
	ChuyenBay.DoDai <= MayBay.TamBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	DoDai >= 3200
	AND
	Hieu LIKE'Boeing%'
--39.Tìm các phi công có thể lái tất cả các loại máy bay Boeing.
SELECT DISTINCT
	NhanVien.MaNV,
	NhanVien.Ten
FROM
	MayBay
	JOIN
	ChungNhan
	ON
	MayBay.MaMB = ChungNhan.MaMB
	JOIN
	NhanVien
	ON
	ChungNhan.MaNV  = NhanVien.MaNV
WHERE
	Hieu LIKE'Boeing%'
GROUP BY
	NhanVien.MaNV,
	NhanVien.Ten
HAVING
	COUNT(MayBay.MaMB ) = (
		SELECT 
			COUNT(*)
		FROM
			MayBay
		WHERE
			Hieu LIKE'Boeing%'
		)
--bài 1
--1. Xem bạn có mã bạn đọc là HN123(AT170415) đã mượn những quyển sách nào ( in mã sách và tên 
--sách)
SELECT
	Sach.MaS,
	Sach.TenS
FROM
	Sach
WHERE
	Sach.MaS IN (
		SELECT
			PhieuMuon.MaS
		FROM
			PhieuMuon
		WHERE
			PhieuMuon.MaBD ='AT170415'
		)

--2. Có bao nhiêu cuốn thiểu thuyết đã được mượn vào tháng 9/2018
SELECT
	COUNT(*) [NumberSubjects]
FROM
	PhieuMuon
WHERE
	PhieuMuon.NgayMuon LIKE '2018-09-%'
--3. Hiện thị về việc mượn sách của những độc giả quê ở Hà nội
SELECT
	*
FROM
	PhieuMuon
WHERE
	PhieuMuon.MaBD IN (
		SELECT
			BanDoc.MaBD
		FROM
			BanDoc
		WHERE
			BanDoc.QueQuan =N'Hà Nội'
		)
--4. Hiển thị mã bạn đọc và tên của các bạn cùng mượn sách có mã là T123(SACH1001)
SELECT
	BanDoc.MaBD,
	BanDoc.HoTenBD
FROM
	BanDoc
WHERE
	BanDoc.MaBD IN (
		SELECT
			PhieuMuon.MaBD
		FROM
			PhieuMuon
		WHERE
			PhieuMuon.MaS ='SACH1001'
		)
--5. Hiển thị danh sách bạn đọc quê ở Bắc Ninh và chưa trả sách
SELECT
	BanDoc.*
FROM
	BanDoc
	JOIN
	PhieuMuon
	ON
	BanDoc.MaBD =PhieuMuon.MaBD
WHERE
	BanDoc.QueQuan =N'Bắc Ninh'
	AND
	PhieuMuon.TraSach =0
--6. Hiển thị bạn đọc quê ở Hà nội mượn nhiều sách nhất 
SELECT 
	BanDoc.MaBD,
	BanDoc.HoTenBD,
	BanDoc.QueQuan
FROM
	BanDoc
	JOIN
	PhieuMuon
	ON
	BanDoc.MaBD =PhieuMuon.MaBD
WHERE
	BanDoc.QueQuan =N'Hà nội'
GROUP BY
	BanDoc.MaBD,
	BanDoc.HoTenBD,
	BanDoc.QueQuan
HAVING 
	COUNT(PhieuMuon.MaS) = (
		SELECT TOP 1
			COUNT(PhieuMuon.MaS)
		FROM
			BanDoc
			JOIN
			PhieuMuon
			ON
			BanDoc.MaBD =PhieuMuon.MaBD
		WHERE
			BanDoc.QueQuan =N'Hà nội'
		GROUP BY
			PhieuMuon.MaBD
		ORDER BY
			COUNT(PhieuMuon.MaS) DESC
		)
		
--7.Tính số lượng sách của mỗi thể loại có trong thư viện
SELECT
	Sach.TheLoai,
	COUNT(*) [Số Lượng]
FROM
	Sach
GROUP BY
	Sach.TheLoai
--8. Hiển thị các cuốn sách được in ở nhà xuất bản giáo dục trước năm 2010
SELECT
	*
FROM
	Sach
WHERE
	NamXB < 2010
--9. Hiển thị các bạn có mã bạn đọc nhưng chưa mượn sách bao giờ
SELECT
	*
FROM
	BanDoc
WHERE
	BanDoc.MaBD NOT IN (
		SELECT	DISTINCT
			PhieuMuon.MaBD
		FROM
			PhieuMuon
		)
--10.Hiển thị các bạn mượn nhiều hơn hoặc bằng 2 quyển sách
SELECT
	BanDoc.MaBD,
	BanDoc.HoTenBD,
	COUNT(PhieuMuon.MaS) [Số Lượng]
FROM
	BanDoc
	JOIN
	PhieuMuon
	ON
	BanDoc.MaBD = PhieuMuon.MaBD
GROUP BY
	BanDoc.MaBD,
	BanDoc.HoTenBD
HAVING 
	COUNT(PhieuMuon.MaS) >= 2
--11. Hiển thị các bạn mượn nhiều hơn hoặc bằng 3 quyển sách thuộc thể loại “Sách khoa 
--học” vào tháng 10/2018
SELECT
	BanDoc.MaBD,
	BanDoc.HoTenBD,
	COUNT(PhieuMuon.MaS) [Số Lượng]
FROM
	BanDoc
	JOIN
	PhieuMuon
	ON
	BanDoc.MaBD = PhieuMuon.MaBD
	JOIN
	Sach
	ON 
	Sach.MaS = PhieuMuon.MaS
WHERE
	Sach.TheLoai =N'Lập Trình'
	AND
	PhieuMuon.NgayMuon LIKE '2018-10-%'
GROUP BY
	BanDoc.MaBD,
	BanDoc.HoTenBD
HAVING 
	COUNT(PhieuMuon.MaS) >= 3
--12. Hiển thị tổng số sách đã được mượn ở Thư viện
SELECT
	COUNT( DISTINCT MaS) [Số Lượng]
FROM
	PhieuMuon
--13.Hiện thị mã và tên bạn đọc mượn sách nhiều hơn bạn có mã số là BN123 (AT170423)
SELECT
	BanDoc.MaBD,
	BanDoc.HoTenBD
FROM
	BanDoc
	JOIN
	PhieuMuon
	ON
	BanDoc.MaBD = PhieuMuon.MaBD
GROUP BY
	BanDoc.MaBD,
	BanDoc.HoTenBD
HAVING
	COUNT(PhieuMuon.MaS) > (
		SELECT
			COUNT(PhieuMuon.Mas)
		FROM
			PhieuMuon
		WHERE
			PhieuMuon.MaBD ='AT170423'
		)
--14. Hiển thị mã và tên cuốn sách được mượn nhiều nhất,ít nhất ở Thư viện năm 2018
--15.Cho danh sách các bạn đọc mượn sách quá hạn tính đến ngày hiện tại
SELECT
	*
FROM
	BanDoc
WHERE
	BanDoc.MaBD IN (
		SELECT
			PhieuMuon.MaBD
		FROM
			PhieuMuon
		WHERE
			PhieuMuon.TraSach = 0
		)
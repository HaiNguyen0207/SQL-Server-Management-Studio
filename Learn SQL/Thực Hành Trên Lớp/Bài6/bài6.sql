--1. Lấy ra danh sách sinh viên nữ học môn Lý thuyết cơ sở dữ liệu và điểm thi tương ứng. 
CREATE VIEW vw_StudentExamSQL 
AS
	SELECT
		SinhVien.*,
		Diem
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
		GioiTinh =N'Nữ'
		AND
		TenMH =N'Lý thuyết cơ sở dữ liệu'

/*
SELECT
	*
FROM
	vw_StudentExamSQL
*/
--2. Cho biết số sinh viên thi đỗ môn toán cao cấp
CREATE VIEW vw_NumberStudentPassMath

AS
SELECT
	COUNT(KetQua.MaSV)  NumberStudent
FROM
	MonHoc
	JOiN
	KetQua
	ON
	MonHoc.MaMH = KetQua.MaMH
WHERE
	KetQua.Diem >= 5
	AND
	MonHoc.TenMH =N'toán cao cấp'

--
SELECT
	*
FROM
	vw_NumberStudentPassMath
--3. Lấy ra tên sinh viên và điểm trung bình của các sinh viên theo từng lớp
CREATE VIEW vw_AvgStudentByClass
AS
SELECT
	Lop,
	SinhVien.MaSV,
	SinhVien.TenSV,
	ROUND(SUM(Diem * DVHT ) / SUM (DVHT),2) AvgGpa
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
GROUP BY
	Lop,
	SinhVien.MaSV,
	SinhVien.TenSV

--
SELECT
	*
FROM
	vw_AvgStudentByClass
ORDER BY
	Lop
--4. Cho biết số sinh viên thi lại của từng mônCREATE VIEW vw_getStudentsRetestASSELECT	MonHoc.MaMH,	MonHoc.TenMH,	COUNT(KetQua.MaSV) 'Số lượng thi lại '	FROM	MonHoc	JOIN	KetQua	ON	MonHoc.MaMH = KetQua.MaMHWHERE	KetQua.Diem <5GROUP BY	MonHoc.MaMH,	MonHoc.TenMH	--SELECT	*FROM	vw_getStudentsRetest--5. *. Cho biết mã số và tên môn của những môn học mà tất cả các sinh viên đều đạt điểm
-->=5CREATE VIEW  vw_getStudentsPassSubjectASSELECT DISTINCT	MonHoc.MaMH,	MonHoc.TenMHFROM	MonHoc	JOIN		KetQua	ON	MonHoc.MaMH = KetQua.MaMHEXCEPTSELECT DISTINCT	MonHoc.MaMH,	MonHoc.TenMHFROM	MonHoc	JOIN		KetQua	ON	MonHoc.MaMH = KetQua.MaMHWHERE	KetQua.Diem <5--SELECT	*FROM	vw_getStudentsPassSubject--6. *. Cho biết mã số và tên những sinh viên có điểm trung bình chung học tập cao hơn điểm
--trung bình chung của mỗi lớp.CREATE VIEW vw_maxGpaByClass
AS
SELECT
	Lop,
	ROUND(SUM((Diem * DVHT)) /SUM(DVHT) ,2) avgGpa
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
GROUP BY
	Lop
--
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV,
	SinhVien.Lop,
	ROUND(SUM((Diem * DVHT)) /SUM(DVHT) ,2) avgGpa
FROM
	SinhVien,MonHoc,KetQua,vw_maxGpaByClass
WHERE
	SinhVien.MaSV = KetQua.MaSV
	AND
	MonHoc.MaMH = KetQua.MaMH
	AND
	SinhVien.Lop = vw_maxGpaByClass.Lop
GROUP BY
	SinhVien.MaSV,
	SinhVien.TenSV,
	SinhVien.Lop,
	vw_maxGpaByClass.avgGpa
HAVING
	ROUND(SUM((Diem * DVHT)) /SUM(DVHT),2) > vw_maxGpaByClass.avgGpa--7. Cho biết mã số và tên nhưng sinh viên có hơn một nửa số điểm >=5CREATE VIEW vw_getStudentsDiemBigger5
AS
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

-- tạo view chứa  số lượng môn thi của sinh viên
CREATE VIEW vw_amountSubjects
AS
SELECT
	KetQua.MaSV,
	COUNT(KetQua.MaMH) [SoluongMonThi]
FROM
	KetQua
GROUP BY
	KetQua.MaSV
--lấy kết quả đề bài
SELECT
	vw_getStudentsDiemBigger5.MaSV,
	vw_getStudentsDiemBigger5.TenSV
FROM
	vw_getStudentsDiemBigger5
	JOIN
	vw_amountSubjects
	ON
	vw_getStudentsDiemBigger5.MaSV = vw_amountSubjects.MaSV
GROUP BY
	vw_getStudentsDiemBigger5.MaSV,
	vw_getStudentsDiemBigger5.TenSV,
	SoluongMonThi
HAVING
	COUNT(vw_getStudentsDiemBigger5.Diem) >= [SoluongMonThi]/2--8. Cho biết mã số và số điểm lớn hơn 7 của những sinh viên có hơn một nửa số điểm là >7
	
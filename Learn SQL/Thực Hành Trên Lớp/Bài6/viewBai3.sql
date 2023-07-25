--15  : *Cho mã sinh viên và tên của những sinh viên có hơn nửa số điểm >=5. 
-- tạo view chứa sinh viên có điểm > 5
CREATE VIEW vw_getStudentsDiemBigger5
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
	COUNT(vw_getStudentsDiemBigger5.Diem) >= [SoluongMonThi]/2
---16 : Cho danh sách mã sinh viên, tên sinh viên có điểm môn Tin đại cương cao nhất của mỗi lớp.
--

CREATE VIEW vw_maxGpa
AS
SELECT
	Lop,
	MAX(Diem) MaxDiem
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
	TenMH = N'Tin đại cương'
GROUP BY
	Lop
--
SELECT
	SinhVien.MaSV,
	SinhVien.TenSV,
	SinhVien.Lop,
	MonHoc.TenMH,
	vw_maxGpa.MaxDiem
FROM
	SinhVien,MonHoc,KetQua,vw_maxGpa
WHERE
	SinhVien.MaSV = KetQua.MaSV
	AND
	MonHoc.MaMH = KetQua.MaMH
	AND
	vw_maxgpa.Lop = SinhVien.Lop
	AND
	vw_maxGpa.MaxDiem = KetQua.Diem
	AND
	TenMH =N'Tin đại cương'
	
----17. *Cho danh sách tên và mã sinh viên có điểm trung bình chung lớn hơn điểm trung bình của lớp 
--sinh viên đó theo học

CREATE VIEW vw_maxGpaByClass
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
	ROUND(SUM((Diem * DVHT)) /SUM(DVHT),2) > vw_maxGpaByClass.avgGpa
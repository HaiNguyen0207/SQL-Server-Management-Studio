select
*
from
SinhVien
where
MaSV in(
		select
		masv
		from
		KetQua,MonHoc
		where
		KetQua.MaMH =MonHoc.MaMH
		and
		MonHoc.TenMH=N'toán cao cấp '
		union
		select
		masv
		from
		KetQua,MonHoc
		where
		KetQua.MaMH =MonHoc.MaMH
		and
		MonHoc.TenMH=N'vật lí đại cương'
		)
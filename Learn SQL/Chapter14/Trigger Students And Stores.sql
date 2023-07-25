/*
INSERT INTO Stores(StoreName, Phone, Email, AddressNumber, Street, District, City)
VALUES('FPT Shop', '19001288', 'fptshop@xmail.com', N'373 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội');
*/
/*
DELETE 
FROM
	Stores
WHERE
	StoreId = 18 
*/

--thao tác vs StudentAudits
/*
INSERT INTO 
	Students 
VALUES
	('B25DCCN110',N'Hải' ,N'Nguyễn',N'Văn' ,N'Hà Nội ' ,'CNTT' ,'2001-11-10','0912178129','3.00'),
	('B25DCCN111',N'Hoàng' ,N'Trần',N'Văn' ,N'Cao Bằng ' ,'ATTT' ,'1999-04-12','091092109','2.98'),
	('B25DCCN112',N'Minh' ,N'Nguyễn',N'Cao' ,N'Đà Nẵng' ,'CNTT' ,'2000-08-10','0989012123','2.54'),
	('B25DCCN113',N'Bắc' ,N'Đỗ',N'Dương' ,N'Bắc Giang' ,'DTVT' ,'2001-09-10','0993251618','2.44'),
	('B25DCCN114',N'Công' ,N'Lê',N'Thanh' ,N'Hồ Chí Minh ' ,'Kế Toán' ,'2002-01-10','0981266789','3.56'),
	('B25DCCN115',N'Huy' ,N'Trần',N'Quang' ,N'Kon Tum' ,'CNTT' ,'2001-02-10','0981267128','2.94')
*/
DELETE FROM
	Students
WHERE
	StudentId = 'B25DCCN111' 
	OR
	StudentId = 'B25DCCN109'
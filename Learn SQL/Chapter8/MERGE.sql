MERGE 
	sales.salesProducts t
USING 
	sales.Products s
ON
	t.PK_Products =s.PK_Products
WHEN MATCHED
	THEN UPDATE SET
	t.Name = s.Name,
	t.Price = s.Price,
	t.salePrice = s.salePrice,
	t.Quantity = s.Quantity
WHEN NOT MATCHED BY TARGET
	THEN INSERT (PK_Products ,Name,Price,salePrice,Quantity )
	VALUES(s.PK_Products,s.Name,s.Price,s.salePrice ,s.Quantity )
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;
	

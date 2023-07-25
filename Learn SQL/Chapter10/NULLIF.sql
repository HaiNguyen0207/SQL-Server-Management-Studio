--
SELECT
	*
FROM
	Staffs
WHERE
	NULLIF(PhoneNumber,' ' )IS NULL
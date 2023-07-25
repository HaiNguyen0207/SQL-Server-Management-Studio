/*
SELECT
	SalaryId,
	StaffId,
	COALESCE(TargetId ,1) targetId,
	BaseAmount,
	BaseSalary
FROM
	Salaries
*/
/*
SELECT
	Salaries.*,
	Salaries.BaseAmount *Targets.Percentage Commission
FROM
	Salaries
	JOIN
	Targets
	ON
	Salaries.TargetId = COALESCE(Targets.TargetId ,1)
*/
/*
ALTER TABLE
	LearnSQL.dbo.Salaries
ADD  
	Commisssion FLOAT DEFAULT NULL
--
UPDATE
	LearnSQL.dbo.Salaries
SET
	TargetId = COALESCE(TargetId,1)
--
UPDATE 
	LearnSQL.dbo.Salaries
SET
	Commisssion = Salaries.BaseAmount * Targets.Percentage
FROM
	Salaries
	JOIN
	Targets
	ON
	Salaries.TargetId = COALESCE(Targets.TargetId ,1)


ALTER TABLE
	LearnSQL.dbo.Salaries
DROP COLUMN
	Commission

ALTER TABLE
	LearnSQL.dbo.Salaries
ADD
	Commission FLOAT 

UPDATE
	LearnSQL.dbo.Salaries
SET
	Commission = Salaries.BaseAmount * Targets.Percentage
FROM
	Salaries 
	JOIN
	Targets 
	ON
	Salaries.TargetId =COALESCE(Targets.TargetId ,1)


ALTER TABLE
	LearnSQL.dbo.Salaries
ADD
	TotalSalary FLOAT
*/
UPDATE
	LearnSQL.dbo.Salaries
SET
	TotalSalary =BaseSalary +Commission
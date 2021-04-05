

USE AdventureWorks2019
GO

CREATE TRIGGER notifier ON HumanResources.Department
INSTEAD OF INSERT
	,UPDATE
AS
THROW 50000
	,'You cant insert or update!'
	,1

GO

CREATE TRIGGER notiier2 ON DATABASE
FOR ALTER_TABLE AS THROW 60000
	,'You cant alter the table'
	,1

GO

CREATE FUNCTION dbo.ufnConcatStrings (
	@var1 VARCHAR(100)
	,@var2 VARCHAR(100)
	)
RETURNS VARCHAR(200)
AS
BEGIN
	RETURN CONCAT_WS('-', @var1, @var2)
END
GO

CREATE FUNCTION HumanResources.ufnEmployeeByDepartment (@deptno INT)
RETURNS TABLE
AS
RETURN (
		SELECT e.*
		FROM HumanResources.Employee AS e
		JOIN HumanResources.EmployeeDepartmentHistory AS h
			ON e.BusinessEntityID = h.BusinessEntityID
			WHERE h.DepartmentID = @deptno
		)
GO

CREATE PROCEDURE Person.uspSearchByName @name VARCHAR
AS
DECLARE @compare VARCHAR(100) = '%' + @name + '%'
SELECT p.BusinessEntityID
	,p.FirstName
	,p.LastName
FROM Person.Person AS p
WHERE p.FirstName LIKE @compare
	OR p.LastName LIKE @compare;

RETURN
GO
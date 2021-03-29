

USE AdventureWorks2019
GO

CREATE TRIGGER notifier ON HumanResources.Department
INSTEAD OF INSERT
	,UPDATE
AS
THROW 50000
	,'You cant insert or update!'
	,1

ROLLBACK;
GO

CREATE TRIGGER notiier2 ON DATABASE
FOR ALTER_TABLE AS THROW 60000
	,'You cant alter the table'
	,1

ROLLBACK;
GO

CREATE FUNCTION dbo.ufnConcatStrings (
	@var1 VARCHAR
	,@var2 VARCHAR
	)
RETURNS VARCHAR
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
			ON h.DepartmentID = @deptno
		)
GO

CREATE PROCEDURE Person.uspSearchByName @name INT
	,@BusinessEntityID INT OUTPUT
	,@FirstName NVARCHAR OUTPUT
	,@LastName NVARCHAR OUTPUT
AS
SELECT @BusinessEntityID = p.BusinessEntityID
	,@FirstName = p.FirstName
	,@LastName = p.LastName
FROM Person.Person AS p
WHERE p.FirstName LIKE @name
	OR p.LastName LIKE @name;
GO



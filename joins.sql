USE AdventureWorks2019
GO

SELECT p.FirstName
	,p.LastName
	,e.JobTitle
	,e.BirthDate
FROM Person.Person AS p
INNER JOIN HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID;
GO

SELECT p.FirstName
	,p.LastName
	,(
		SELECT e.JobTitle
		FROM HumanResources.Employee AS e
		WHERE p.BusinessEntityID = e.BusinessEntityID
		) AS JobTitle
FROM Person.Person AS p;
GO

SELECT t.FirstName
	,t.LastName
	,t.JobTitle
FROM (
	SELECT p.*
		,e.JobTitle
	FROM Person.Person AS p
	INNER JOIN HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID
	) t
WHERE JobTitle IS NOT NULL;
GO

SELECT p.FirstName
	,p.LastName
	,e.JobTitle
FROM Person.Person AS p
CROSS JOIN HumanResources.Employee AS e;
GO

SELECT p.FirstName
	,p.LastName
	,e.JobTitle
FROM Person.Person AS p
CROSS JOIN HumanResources.Employee AS e;

SELECT COUNT(*) AS Count
FROM (
	SELECT p.FirstName
		,p.LastName
		,e.JobTitle
	FROM Person.Person AS p
	CROSS JOIN HumanResources.Employee AS e
	) t;
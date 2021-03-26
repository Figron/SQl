

USE AdventureWorks2019
GO

CREATE VIEW Person.vPerson
AS
SELECT p.Title
	,p.FirstName
	,p.LastName
	,e.EmailAddress
FROM Person.Person AS p
JOIN Person.EmailAddress AS e
	ON p.BusinessEntityID = e.BusinessEntityID;
GO

WITH clt_pp
AS (
	SELECT BusinessEntityID
		,PhoneNumber
	FROM Person.PersonPhone
	)
	,clt_pph
AS (
	SELECT BusinessEntityID
		,FirstName
		,LastName
	FROM Person.Person
	)
SELECT e.BusinessEntityID
	,e.NationalIdNumber
	,e.JobTitle
	,(
		SELECT FirstName
		FROM clt_pph
		WHERE e.BusinessEntityID = BusinessEntityID
		) AS FirstName
	,(
		SELECT LastName
		FROM clt_pph
		WHERE e.BusinessEntityID = BusinessEntityID
		) AS LastName
	,(
		SELECT PhoneNumber
		FROM clt_pp
		WHERE e.BusinessEntityID = BusinessEntityID
		) AS PhoneNumber
FROM HumanResources.Employee AS e


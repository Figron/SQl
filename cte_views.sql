

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
	,clt_pph.FirstName
	,clt_pph.LastName
	,clt_pp.PhoneNumber
FROM HumanResources.Employee AS e
JOIN clt_pp
	ON e.BusinessEntityID = clt_pp.BusinessEntityID
JOIN clt_pph
	ON e.BusinessEntityID = clt_pph.BusinessEntityID;


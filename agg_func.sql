

USE AdventureWorks2019
GO

SELECT COUNT(DISTINCT GroupName)
FROM HumanResources.Department
GO

SELECT e.JobTitle
	,MAX(h.Rate) AS Max
FROM HumanResources.EmployeePayHistory AS h
JOIN HumanResources.Employee AS e
	ON h.BusinessEntityID = e.BusinessEntityID
GROUP BY e.JobTitle
GO

SELECT p.Name
	,MIN(sd.UnitPrice) AS Min
FROM Sales.SalesOrderHeader sh
JOIN Sales.SalesOrderDetail sd
	ON sh.SalesOrderID = sd.SalesOrderID
JOIN Production.Product p
	ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
	ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY p.Name
GO

SELECT pc.Name
	,COUNT(ps.Name) AS Count
FROM Production.ProductCategory AS pc
JOIN Production.ProductSubcategory AS ps
	ON pc.ProductCategoryID = ps.ProductCategoryID
GROUP BY pc.Name
GO

SELECT psc.Name
	,AVG(sd.LineTotal) AS Average
FROM Sales.SalesOrderHeader AS sh
JOIN Sales.SalesOrderDetail AS sd
	ON sh.SalesOrderID = sd.SalesOrderID
JOIN Production.Product AS p
	ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory AS psc
	ON p.ProductSubcategoryID = psc.ProductSubcategoryID
GROUP BY psc.Name
GO

SELECT eh.BusinessEntityID
	,eh.Rate
	,MAX(eh.RateChangeDate) AS DATE
FROM HumanResources.EmployeePayHistory eh
GROUP BY eh.BusinessEntityID
	,eh.Rate
HAVING eh.Rate = (
		SELECT MAX(RATE)
		FROM HumanResources.EmployeePayHistory
		)
GO



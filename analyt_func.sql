

USE AdventureWorks2019
GO
-- 1 Cume_Dist
SELECT *
FROM (
	SELECT sod.UnitPrice
		,CUME_DIST() OVER (
			ORDER BY sod.UnitPrice
			) AS Dist
	FROM Sales.SalesOrderHeader AS soh
	JOIN Sales.SalesOrderDetail AS sod
		ON sod.SalesOrderID = soh.SalesOrderID
	WHERE soh.OrderDate >= '2013-01-01'
		AND soh.OrderDate <= '2013-01-31'
	) t
WHERE Dist <= 0.9
	AND Dist >= 0.1
GO

-- 1 Ntile
SELECT *
FROM (
	SELECT sod.UnitPrice
		,NTILE(10) OVER (
			ORDER BY sod.UnitPrice
			) AS Dist
	FROM Sales.SalesOrderHeader AS soh
	JOIN Sales.SalesOrderDetail AS sod
		ON sod.SalesOrderID = soh.SalesOrderID
	WHERE soh.OrderDate >= '2013-01-01'
		AND soh.OrderDate <= '2013-01-31'
	) t
WHERE Dist >= 2
	AND Dist <= 9
GO


-- 2
SELECT ps.Name AS Subcategory
	,MIN(p.ListPrice) AS MinPrice
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps
	ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
GO

-- 3
SELECT *
FROM (
	SELECT ps.Name
		,p.ListPrice
		,ROW_NUMBER() OVER (
			ORDER BY p.ListPrice
			) Row_num
	FROM Production.Product AS p
	JOIN Production.ProductSubcategory AS ps
		ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	WHERE ps.Name = 'Mountain Bikes'
	) t
WHERE Row_num = 2
GO

-- 4
SELECT ps.Name, SUM(p.ListPrice) AS Sum
FROM Sales.SalesOrderHeader sh
JOIN Sales.SalesOrderDetail sd
	ON sh.SalesOrderID = sd.SalesOrderID
JOIN Production.Product p
	ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
	ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE sh.OrderDate BETWEEN '01-01-2013' AND '12-31-2013'
GROUP BY ps.Name

-- 5
SELECT *
FROM (
	SELECT CONVERT(DATE, soh.OrderDate) AS Date
		,sod.UnitPrice
		,DENSE_RANK() OVER (
			PARTITION BY soh.OrderDate 
			ORDER BY sod.UnitPrice DESC
			) Rank
	FROM Sales.SalesOrderHeader AS soh
	JOIN Sales.SalesOrderDetail AS sod
		ON soh.SalesOrderID = sod.SalesOrderID
	WHERE soh.OrderDate BETWEEN '01-01-2013'
			AND '01-31-2013'
	GROUP BY soh.OrderDate
		,sod.UnitPrice
	) t
WHERE Rank = 1
GO

-- 6

SELECT ps.Name
	,p.Name
	,FIRST_VALUE(sd.UnitPrice) OVER (
		PARTITION BY ps.Name 
		ORDER BY COUNT(*) DESC
		) AS Price
FROM Sales.SalesOrderHeader sh
JOIN Sales.SalesOrderDetail sd
	ON sh.SalesOrderID = sd.SalesOrderID
JOIN Production.Product p
	ON sd.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
	ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE sh.OrderDate BETWEEN '01-01-2013'
		AND '01-31-2013'
GROUP BY ps.Name
	,p.Name
	,sd.UnitPrice



SELECT *
FROM Sales.SalesOrderHeader

SELECT *
FROM Sales.SalesOrderDetail

SELECT * FROM Production.ProductSubcategory

SELECT * FROM Production.Product
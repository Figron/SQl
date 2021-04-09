

CREATE TABLE dbo.Customer (
	CustomerID INT
	,FirstName VARCHAR(50)
	,LastName VARCHAR(50)
	,Email VARCHAR(100)
	,ModifiedDate DATE
	)
GO

CREATE NONCLUSTERED INDEX IX_FirstName_LastName ON dbo.Customer (
	FirstName
	,LastName
	)
GO

CREATE INDEX IX_Customer_ModifiedDate ON dbo.Customer (ModifiedDate) INCLUDE (
	FirstName
	,LastName
	)
GO

CREATE TABLE dbo.Customer2 (
	CustomerID INT PRIMARY KEY
	,AccountNumber VARCHAR(10) UNIQUE CLUSTERED
	,FirstName VARCHAR(50)
	,LastName VARCHAR(50)
	,Email VARCHAR(100)
	,ModifiedDate DATE
	)
GO

EXEC sp_rename CI_Customer_ID
	,CI_CustomerID
GO

DROP INDEX SI_Customer_ID
	ON dbo.Customer2
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_Email ON dbo.Customer2 (Email)
GO

CREATE NONCLUSTERED INDEX IX_ModifiedDate ON dbo.Customer2 (ModifiedDate)
	WITH (FILLFACTOR = 70)
GO



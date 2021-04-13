

CREATE TABLE dbo.Customer (
	CustomerID INT PRIMARY KEY
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
	CustomerID INT
	,AccountNumber VARCHAR(10)
	,FirstName VARCHAR(50)
	,LastName VARCHAR(50)
	,Email VARCHAR(100)
	,ModifiedDate DATE
	)
CREATE CLUSTERED INDEX CI_Customer_ID ON dbo.Customer2(AccountNumber)

ALTER TABLE dbo.Customer2 ADD PRIMARY KEY(CustomerID) 
GO

EXEC sp_rename N'dbo.Customer2.CI_Customer_ID'
	,N'CI_CustomerID'
	,N'INDEX'
GO

DROP INDEX SI_Customer_ID
	ON dbo.Customer2
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_Email ON dbo.Customer2 (Email)
GO

CREATE NONCLUSTERED INDEX IX_ModifiedDate ON dbo.Customer2 (ModifiedDate)
	WITH (FILLFACTOR = 70)
GO



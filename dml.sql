USE TestDb
GO
INSERT INTO TestSchema.TestTable (ID, Name, IsSold, InvoiceDate)
VALUES (4, 'Bicycle', 0, '2020-08-23'),
(5, 'Rocket', 1, '2020-01-01'),
(6, 'Motorcycle', NULL, '2020-08-26'),
(7, 'Submarine', 0, '1999-05-16')
GO
INSERT INTO TestSchema.TestTable (ID, InvoiceDate)
VALUES (8, '2020-08-25')
INSERT INTO TestSchema.TestTable (ID, Name)
VALUES (9, 'Scooter');
GO
UPDATE TestSchema.TestTable
SET IsSold = 0
WHERE IsSold IS NULL;
GO
DELETE FROM TestSchema.TestTable
WHERE Name IS NULL OR InvoiceDate IS NULL;
GO
MERGE TestSchema.TestTable2 t1
USING TestSchema.TestTable t2
ON t1.ID = t2.ID
WHEN MATCHED AND t1.Name <> t2.Name THEN
UPDATE SET Name = t2.Name
WHEN NOT MATCHED THEN
INSERT (ID, Name, IsSold, InvoiceDate) 
VALUES (t2.ID, t2.Name, t2.IsSold, t2.InvoiceDate);
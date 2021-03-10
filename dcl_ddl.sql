CREATE DATABASE TestDb;
GO
USE TestDb;
GO
CREATE SCHEMA TestSchema;
GO
CREATE TABLE TestSchema.TestTable
(id INT NOT NULL,
Name Varchar(20),
isSold BIT,
InvoiceDate DATE);
GO
INSERT INTO TestSchema.TestTable
VALUES
(1, 'Boat', 1, '2020-11-08'),
(2,'Auto', 0, '2020-11-09'),
(3,'Plane', null, '2020-12-09');

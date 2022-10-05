USE [osuccme-dev]
GO

DELETE FROM [dbo].[EventAdvertisers]
DELETE FROM [dbo].[EventExpenses]
DELETE FROM [dbo].[EventRevenues]
DELETE FROM [dbo].[EventSupport]

DBCC CHECKIDENT ('[EventAdvertisers]', RESEED, 0);
DBCC CHECKIDENT ('[EventExpenses]', RESEED, 0);
DBCC CHECKIDENT ('[EventRevenues]', RESEED, 0);
DBCC CHECKIDENT ('[EventSupport]', RESEED, 0);
GO

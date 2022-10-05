USE [osuccme-dev]
GO

DELETE FROM [dbo].[WebcastJointProviders]
DELETE FROM [dbo].[WebcastOptions]
DELETE FROM [dbo].[WebcastOptionsGroups]
DELETE FROM [dbo].[WebcastPrices]
DELETE FROM [dbo].[WebcastRegistrations]
DELETE FROM [dbo].[WebcastSpecialties]
DELETE FROM [dbo].[WebcastFiles]
DELETE FROM [dbo].[Webcasts]


DBCC CHECKIDENT ('[WebcastJointProviders]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastPrices]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastFiles]', RESEED, 0);
GO

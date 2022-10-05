USE [osuccme-dev]
GO

DELETE FROM [dbo].[RSSeriesStreamViews]
DELETE FROM [dbo].[RSSeriesStreams]
DELETE FROM [dbo].[RSSeriesJointProviders]
DELETE FROM [dbo].[RSSeriesRegistrations]
DELETE FROM [dbo].[RSSeriesSpecialties]
DELETE FROM [dbo].[RSSeriesFiles]
DELETE FROM [dbo].[RSSeries]
DELETE FROM [dbo].[RSSeriesSeries]

DBCC CHECKIDENT ('[RSSeriesStreamViews]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesStreams]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesJointProviders]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesPrices]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesFiles]', RESEED, 0);
GO

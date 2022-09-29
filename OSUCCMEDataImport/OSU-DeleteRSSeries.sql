USE [osuccme-dev]
GO

DELETE FROM [dbo].[RSSeriesStreamViews]
DELETE FROM [dbo].[RSSeriesStreams]
DELETE FROM [dbo].[RSSeriesJointProviders]
DELETE FROM [dbo].[RSSeriesRegistrations]
DELETE FROM [dbo].[RSSeriesSpecialties]
DELETE FROM [dbo].[RSSeries]

DELETE FROM [dbo].[RSSeriesSeries]
GO

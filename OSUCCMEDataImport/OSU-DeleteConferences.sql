USE [osuccme-dev]
GO

DELETE FROM [dbo].[ConferenceStreamViews]
DELETE FROM [dbo].[ConferenceStreams]
DELETE FROM [dbo].[ConferenceJointProviders]
DELETE FROM [dbo].[ConferenceOptions]
DELETE FROM [dbo].[ConferenceOptionsGroups]
DELETE FROM [dbo].[ConferencePrices]
DELETE FROM [dbo].[ConferenceRegistrations]
DELETE FROM [dbo].[ConferenceSpecialties]
DELETE FROM [dbo].[ConferenceFiles]
DELETE FROM [dbo].[Conferences]

DBCC CHECKIDENT ('[ConferenceStreamViews]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceJointProviders]', RESEED, 0);
DBCC CHECKIDENT ('[ConferencePrices]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceFiles]', RESEED, 0);
GO



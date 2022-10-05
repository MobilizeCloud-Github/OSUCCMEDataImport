USE [osuccme-dev]
GO


DELETE FROM [dbo].[AspNetUserRoles]
DELETE FROM [dbo].[EmailPreferences]
DELETE FROM [dbo].[UserBoardIdentificationNumbers]
DELETE FROM [dbo].[AspNetUsers]
DELETE FROM [dbo].[UserProfiles]

DBCC CHECKIDENT ('[EmailPreferences]', RESEED, 0);
DBCC CHECKIDENT ('[UserBoardIdentificationNumbers]', RESEED, 0);

GO



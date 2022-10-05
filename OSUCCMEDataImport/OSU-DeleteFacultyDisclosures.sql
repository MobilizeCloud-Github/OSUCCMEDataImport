USE [osuccme-dev]
GO


DELETE FROM [dbo].[HospitalAdmins]
DELETE FROM [dbo].[HospitalUsers]
DELETE FROM [dbo].[Hospitals]
DELETE FROM [dbo].[HospitalGroups]

DBCC CHECKIDENT ('[HospitalGroups]', RESEED, 0);
DBCC CHECKIDENT ('[HospitalUsers]', RESEED, 0);
DBCC CHECKIDENT ('[HospitalAdmins]', RESEED, 0);
GO



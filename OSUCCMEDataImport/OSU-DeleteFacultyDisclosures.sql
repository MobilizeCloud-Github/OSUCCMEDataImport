USE [osuccme-dev]
GO


DELETE FROM [dbo].[FacultyDisclosureCommercialInterests]
DELETE FROM [dbo].[FacultyDisclosureRoles]
DELETE FROM [dbo].[FacultyDisclosures]

DBCC CHECKIDENT ('[FacultyDisclosureCommercialInterests]', RESEED, 0);
DBCC CHECKIDENT ('[FacultyDisclosureRoles]', RESEED, 0);
DBCC CHECKIDENT ('[FacultyDisclosures]', RESEED, 0);
GO



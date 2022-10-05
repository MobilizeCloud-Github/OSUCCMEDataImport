USE [osuccme-dev]
GO

DELETE FROM [dbo].[EnduringMaterialJointProviders]
DELETE FROM [dbo].[EnduringMaterialRegistrations]
DELETE FROM [dbo].[EnduringMaterialSpecialties]
DELETE FROM [dbo].[EnduringMaterialFiles]
DELETE FROM [dbo].[EnduringMaterials]
DELETE FROM [dbo].[EnduringMaterialSeries]


DBCC CHECKIDENT ('[EnduringMaterialJointProviders]', RESEED, 0);
DBCC CHECKIDENT ('[EnduringMaterialRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[EnduringMaterialSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[EnduringMaterialFiles]', RESEED, 0);
GO

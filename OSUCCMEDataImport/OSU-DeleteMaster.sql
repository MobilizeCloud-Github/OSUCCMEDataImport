DELETE FROM [dbo].[ConferenceStreamViews]
DELETE FROM [dbo].[ConferenceStreams]
DELETE FROM [dbo].[ConferenceJointProviders]
DELETE FROM [dbo].[ConferenceRegistrationItems]
DELETE FROM [dbo].[ConferenceRegistrations]
DELETE FROM [dbo].[ConferenceOptions]
DELETE FROM [dbo].[ConferenceOptionsGroups]
DELETE FROM [dbo].[ConferencePrices]

DELETE FROM [dbo].[ConferenceSpecialties]
DELETE FROM [dbo].[ConferenceFiles]
DELETE FROM [dbo].[Conferences]

DBCC CHECKIDENT ('[ConferenceStreamViews]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceJointProviders]', RESEED, 0);
DBCC CHECKIDENT ('[ConferencePrices]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceRegistrationItems]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceFiles]', RESEED, 0);



DELETE FROM [dbo].[EventAdvertisers]
DELETE FROM [dbo].[EventExpenses]
DELETE FROM [dbo].[EventRevenues]
DELETE FROM [dbo].[EventSupport]

DBCC CHECKIDENT ('[EventAdvertisers]', RESEED, 0);
DBCC CHECKIDENT ('[EventExpenses]', RESEED, 0);
DBCC CHECKIDENT ('[EventRevenues]', RESEED, 0);
DBCC CHECKIDENT ('[EventSupport]', RESEED, 0);

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

DELETE FROM [dbo].[FacultyDisclosureCommercialInterests]
DELETE FROM [dbo].[FacultyDisclosureRoles]
DELETE FROM [dbo].[FacultyDisclosures]

DBCC CHECKIDENT ('[FacultyDisclosureCommercialInterests]', RESEED, 0);
DBCC CHECKIDENT ('[FacultyDisclosureRoles]', RESEED, 0);
DBCC CHECKIDENT ('[FacultyDisclosures]', RESEED, 0);

DELETE FROM [dbo].[HospitalAdmins]
DELETE FROM [dbo].[HospitalUsers]
DELETE FROM [dbo].[Hospitals]
DELETE FROM [dbo].[HospitalGroups]

DBCC CHECKIDENT ('[HospitalGroups]', RESEED, 0);
DBCC CHECKIDENT ('[HospitalUsers]', RESEED, 0);
DBCC CHECKIDENT ('[HospitalAdmins]', RESEED, 0);

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
DBCC CHECKIDENT ('[RSSeriesRegistrations]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesSpecialties]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesFiles]', RESEED, 0);

DELETE FROM [dbo].[TestingQuestionsFiles]
DELETE FROM [dbo].[TestingQuestionsAnswers]
DELETE FROM [dbo].[TestingQuestions]
DELETE FROM [dbo].[Testing]

DBCC CHECKIDENT ('[TestingQuestionsFiles]', RESEED, 0);
DBCC CHECKIDENT ('[TestingQuestionsAnswers]', RESEED, 0);
DBCC CHECKIDENT ('[TestingQuestions]', RESEED, 0);

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

DELETE FROM [dbo].[AspNetUserRoles]
DELETE FROM [dbo].[EmailPreferences]
DELETE FROM [dbo].[UserBoardIdentificationNumbers]
DELETE FROM [dbo].[AspNetUsers]
DELETE FROM [dbo].[UserProfiles]

DBCC CHECKIDENT ('[EmailPreferences]', RESEED, 0);
DBCC CHECKIDENT ('[UserBoardIdentificationNumbers]', RESEED, 0);
GO




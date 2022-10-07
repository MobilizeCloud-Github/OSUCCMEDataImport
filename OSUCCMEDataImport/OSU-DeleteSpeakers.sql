USE [osuccme-dev]
GO

DELETE FROM [dbo].[ConferenceSpeakerTopics]
DELETE FROM [dbo].[ConferenceSpeakers]

DELETE FROM [dbo].[WebcastSpeakerTopics]
DELETE FROM [dbo].[WebcastSpeakers]

DELETE FROM [dbo].[EnduringMaterialSpeakerTopics]
DELETE FROM [dbo].[EnduringMaterialSpeakers]

DELETE FROM [dbo].[RSSeriesSpeakerTopics]
DELETE FROM [dbo].[RSSeriesSpeakers]


DBCC CHECKIDENT ('[ConferenceSpeakerTopics]', RESEED, 0);
DBCC CHECKIDENT ('[ConferenceSpeakers]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastSpeakerTopics]', RESEED, 0);
DBCC CHECKIDENT ('[WebcastSpeakers]', RESEED, 0);
DBCC CHECKIDENT ('[EnduringMaterialSpeakerTopics]', RESEED, 0);
DBCC CHECKIDENT ('[EnduringMaterialSpeakers]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesSpeakerTopics]', RESEED, 0);
DBCC CHECKIDENT ('[RSSeriesSpeakers]', RESEED, 0);
GO



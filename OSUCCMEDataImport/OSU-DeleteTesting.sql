USE [osuccme-dev]
GO


DELETE FROM [dbo].[TestingQuestionsFiles]
DELETE FROM [dbo].[TestingQuestionsAnswers]
DELETE FROM [dbo].[TestingQuestions]
DELETE FROM [dbo].[Testing]

DBCC CHECKIDENT ('[TestingQuestionsFiles]', RESEED, 0);
DBCC CHECKIDENT ('[TestingQuestionsAnswers]', RESEED, 0);
DBCC CHECKIDENT ('[TestingQuestions]', RESEED, 0);
GO



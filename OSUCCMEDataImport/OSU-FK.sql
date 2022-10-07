ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ConferenceOptions] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions]
GO

ALTER TABLE [dbo].[ConferenceOptions]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ConferenceOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[ConferenceOptions] CHECK CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups]
GO

ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams] FOREIGN KEY([ConferenceStreamID])
REFERENCES [dbo].[ConferenceStreams] ([ID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams]
GO

ALTER TABLE [dbo].[EnduringMaterialCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] CHECK CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] CHECK CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialFiles]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialFiles] CHECK CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialOptionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialOptionsGroups_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialOptionsGroups] CHECK CONSTRAINT [FK_EnduringMaterialOptionsGroups_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanels_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanels] CHECK CONSTRAINT [FK_EnduringMaterialPanels_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] CHECK CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] CHECK CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterialViews]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialViews] CHECK CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials]
GO

ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries] FOREIGN KEY([EnduringMaterialSeriesID])
REFERENCES [dbo].[EnduringMaterialSeries] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries]
GO

ALTER TABLE [dbo].[HospitalAdmins]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAdmins_Hospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HospitalAdmins] CHECK CONSTRAINT [FK_HospitalAdmins_Hospitals]
GO

ALTER TABLE [dbo].[HospitalGroupHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalGroupHospitals_Hospitals] FOREIGN KEY([GroupID])
REFERENCES [dbo].[HospitalGroups] ([ID])
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] CHECK CONSTRAINT [FK_HospitalGroupHospitals_Hospitals]
GO
ALTER TABLE [dbo].[HospitalUsers]  WITH NOCHECK ADD  CONSTRAINT [FK_HospitalUsers_Hospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalUsers] CHECK CONSTRAINT [FK_HospitalUsers_Hospitals]
GO

ALTER TABLE [dbo].[RSSeriesCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImports_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] CHECK CONSTRAINT [FK_RSSeriesCreditImports_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] CHECK CONSTRAINT [FK_RSSeriesEvaluations_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesFiles]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesFiles_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesFiles] CHECK CONSTRAINT [FK_RSSeriesFiles_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanels_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanels] CHECK CONSTRAINT [FK_RSSeriesPanels_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesRegistrations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] CHECK CONSTRAINT [FK_RSSeriesRegistrations_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakers_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] CHECK CONSTRAINT [FK_RSSeriesSpeakers_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] CHECK CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpecialties_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] CHECK CONSTRAINT [FK_RSSeriesSpecialties_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesStreams]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreams_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreams] CHECK CONSTRAINT [FK_RSSeriesStreams_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_RSSeries]
GO

ALTER TABLE [dbo].[RSSeriesViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesViews_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesViews] CHECK CONSTRAINT [FK_RSSeriesViews_RSSeries]
GO

ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_RSSeriesSeries]
GO

ALTER TABLE [dbo].[RSSeriesSeriesAdmins]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] CHECK CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries]
GO

ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries] FOREIGN KEY([RSSeriesSeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries]
GO

ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo] CHECK CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries]
GO

ALTER TABLE [dbo].[TestingQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestions_Testing] FOREIGN KEY([TestID])
REFERENCES [dbo].[Testing] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestions] CHECK CONSTRAINT [FK_TestingQuestions_Testing]
GO

ALTER TABLE [dbo].[WebcastBoards]  WITH CHECK ADD  CONSTRAINT [FK_WebcastBoards_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastBoards] CHECK CONSTRAINT [FK_WebcastBoards_Webcasts]
GO

ALTER TABLE [dbo].[WebcastMOCCreditTypes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] CHECK CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts]
GO

ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts]
GO

ALTER TABLE [dbo].[ConferenceRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrations_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrations] CHECK CONSTRAINT [FK_ConferenceRegistrations_Conferences]
GO

ALTER TABLE [dbo].[ConferenceSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakers_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceSpeakers] CHECK CONSTRAINT [FK_ConferenceSpeakers_Conferences]
GO

ALTER TABLE [dbo].[HospitalUsers]  WITH CHECK ADD  CONSTRAINT [FK_HospitalUsers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO

ALTER TABLE [dbo].[HospitalUsers] CHECK CONSTRAINT [FK_HospitalUsers_UserProfiles]
GO

ALTER TABLE [dbo].[ConferenceJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceJointProviders_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceJointProviders] CHECK CONSTRAINT [FK_ConferenceJointProviders_Conferences]
GO

ALTER TABLE [dbo].[ConferenceSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpecialties_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceSpecialties] CHECK CONSTRAINT [FK_ConferenceSpecialties_Conferences]
GO

ALTER TABLE [dbo].[ConferenceEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluations_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceEvaluations] CHECK CONSTRAINT [FK_ConferenceEvaluations_Conferences]
GO

ALTER TABLE [dbo].[ConferenceOptionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceOptionsGroups_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceOptionsGroups] CHECK CONSTRAINT [FK_ConferenceOptionsGroups_Conferences]
GO

ALTER TABLE [dbo].[ConferenceViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceViews_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceViews] CHECK CONSTRAINT [FK_ConferenceViews_Conferences]
GO

ALTER TABLE [dbo].[EnduringMaterialBoards]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialBoards_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO

ALTER TABLE [dbo].[EnduringMaterialBoards] CHECK CONSTRAINT [FK_EnduringMaterialBoards_EnduringMaterials]
GO

ALTER TABLE [dbo].[WebcastRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrations_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastRegistrations] CHECK CONSTRAINT [FK_WebcastRegistrations_Webcasts]
GO

ALTER TABLE [dbo].[WebcastSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakers_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastSpeakers] CHECK CONSTRAINT [FK_WebcastSpeakers_Webcasts]
GO

ALTER TABLE [dbo].[WebcastSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpecialties_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastSpecialties] CHECK CONSTRAINT [FK_WebcastSpecialties_Webcasts]
GO

ALTER TABLE [dbo].[WebcastFiles]  WITH CHECK ADD  CONSTRAINT [FK_WebcastFiles_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastFiles] CHECK CONSTRAINT [FK_WebcastFiles_Webcasts]
GO

ALTER TABLE [dbo].[WebcastJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_WebcastJointProviders_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastJointProviders] CHECK CONSTRAINT [FK_WebcastJointProviders_Webcasts]
GO

ALTER TABLE [dbo].[WebcastEvalutations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluations_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastEvalutations] CHECK CONSTRAINT [FK_WebcastEvaluations_Webcasts]
GO

ALTER TABLE [dbo].[WebcastOptionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_WebcastOptionsGroups_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastOptionsGroups] CHECK CONSTRAINT [FK_WebcastOptionsGroups_Webcasts]
GO

ALTER TABLE [dbo].[WebcastViews]  WITH CHECK ADD  CONSTRAINT [FK_WebcastViews_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO

ALTER TABLE [dbo].[WebcastViews] CHECK CONSTRAINT [FK_WebcastViews_Webcasts]
GO

ALTER TABLE [dbo].[ConferenceFiles]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceFiles_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferenceFiles] CHECK CONSTRAINT [FK_ConferenceFiles_Conferences]
GO

ALTER TABLE [dbo].[ConferencePanels]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePanels_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferencePanels] CHECK CONSTRAINT [FK_ConferencePanels_Conferences]
GO

ALTER TABLE [dbo].[ConferencePrices]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePrices_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO

ALTER TABLE [dbo].[ConferencePrices] CHECK CONSTRAINT [FK_ConferencePrices_Conferences]
GO
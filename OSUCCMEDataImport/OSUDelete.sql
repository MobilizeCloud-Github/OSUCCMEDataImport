ALTER TABLE [dbo].[WebcastsViews] DROP CONSTRAINT [FK_WebcastsViews_WebcastsViews]
GO
ALTER TABLE [dbo].[WebcastsViews] DROP CONSTRAINT [FK_WebcastsViews_Webcasts]
GO
ALTER TABLE [dbo].[WebcastSpecialties] DROP CONSTRAINT [FK_WebcastSpecailties_Specialties]
GO
ALTER TABLE [dbo].[WebcastSpeakerTopics] DROP CONSTRAINT [FK_WebcastSpeakerTopics_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakers] DROP CONSTRAINT [FK_WebcastSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastSpeakers] DROP CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] DROP CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] DROP CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] DROP CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklists] DROP CONSTRAINT [FK_WebcastSpeakerChecklist_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles] DROP CONSTRAINT [FK_WebcastSpeakerChecklistPresentationFiles_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistCVs] DROP CONSTRAINT [FK_WebcastSpeakerChecklistCVs_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistAVNeeds] DROP CONSTRAINT [FK_WebcastSpeakerChecklistAVNeeds_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[Webcasts] DROP CONSTRAINT [FK_Webcasts_EventStatus]
GO
ALTER TABLE [dbo].[Webcasts] DROP CONSTRAINT [FK_Webcasts_EventProvidership]
GO
ALTER TABLE [dbo].[WebcastRegistrations] DROP CONSTRAINT [FK_WebcastRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastRegistrations] DROP CONSTRAINT [FK_WebcastRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] DROP CONSTRAINT [FK_WebcastRegistrationItems_WebcastRegistrations]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] DROP CONSTRAINT [FK_WebcastRegistrationItems_WebcastPrices]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] DROP CONSTRAINT [FK_WebcastRegistrationItems_WebcastOptions]
GO
ALTER TABLE [dbo].[WebcastQuestions] DROP CONSTRAINT [FK_WebcastQuestions_WebcastTest]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] DROP CONSTRAINT [FK_WebcastPanelSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] DROP CONSTRAINT [FK_WebcastPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastOptions] DROP CONSTRAINT [FK_WebcastOptions_WebcastOptionsGroup]
GO
ALTER TABLE [dbo].[WebcastNotes] DROP CONSTRAINT [FK_WebcastNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[WebcastNotes] DROP CONSTRAINT [FK_WebcastNotes_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] DROP CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] DROP CONSTRAINT [FK_WebcastMOCCreditTypes_MOCCreditTypes1]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] DROP CONSTRAINT [FK_WebcastEvaluatonSpeakers_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] DROP CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers1]
GO
ALTER TABLE [dbo].[WebcastEvaluations] DROP CONSTRAINT [FK_WebcastEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastEvaluationProgramResults] DROP CONSTRAINT [FK_WebcastEvaluationProgramResults_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] DROP CONSTRAINT [FK_WebcastEvaluationPanels_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] DROP CONSTRAINT [FK_WebcastEvaluationPanels_WebcastEvaluationPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationCompetencies] DROP CONSTRAINT [FK_WebcastEvaluationCompetencies_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastCreditImports] DROP CONSTRAINT [FK_WebcastCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastCreditImportRecords] DROP CONSTRAINT [FK_WebcastCreditImportRecords_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastCreditImportErrors] DROP CONSTRAINT [FK_WebcastCreditImportErrors_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastBoards] DROP CONSTRAINT [FK_WebcastBoards_Webcasts]
GO
ALTER TABLE [dbo].[WebcastBoards] DROP CONSTRAINT [FK_WebcastBoards_Boards]
GO
ALTER TABLE [dbo].[UserTests] DROP CONSTRAINT [FK_UserTests_UserProfiles]
GO
ALTER TABLE [dbo].[UserTests] DROP CONSTRAINT [FK_UserTests_Testing]
GO
ALTER TABLE [dbo].[UserTestQuestions] DROP CONSTRAINT [FK_UserTestQuestions_UserTests]
GO
ALTER TABLE [dbo].[UserTestQuestions] DROP CONSTRAINT [FK_UserTestQuestions_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions] DROP CONSTRAINT [FK_UserTestQuestions_TestingQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] DROP CONSTRAINT [FK_UserTestQuestionAnswers_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] DROP CONSTRAINT [FK_UserTestQuestionAnswers_TestingQuestionsAnswers]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_Titles]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_SubSpecialties]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_Specialties]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_Professions]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_Degrees]
GO
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [FK_UserProfiles_AspNetUsers]
GO
ALTER TABLE [dbo].[UserNotes] DROP CONSTRAINT [FK_UserNotes_UserProfiles2]
GO
ALTER TABLE [dbo].[UserNotes] DROP CONSTRAINT [FK_UserNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[UserNotes] DROP CONSTRAINT [FK_UserNotes_UserProfiles]
GO
ALTER TABLE [dbo].[UserImports] DROP CONSTRAINT [FK_UserImports_UserProfiles]
GO
ALTER TABLE [dbo].[UserImportRecords] DROP CONSTRAINT [FK_UserImportRecords_UserImports]
GO
ALTER TABLE [dbo].[UserImportErrors] DROP CONSTRAINT [FK_UserImportErrors_UserImports]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] DROP CONSTRAINT [FK_UserBoardIdentificationNumbers_UserBoardIdentificationNumbers]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] DROP CONSTRAINT [FK_UserBoardIdentificationNumbers_Boards]
GO
ALTER TABLE [dbo].[TestingQuestionsFiles] DROP CONSTRAINT [FK_TestingQuestionsFiles_TestingQuestions]
GO
ALTER TABLE [dbo].[TestingQuestionsAnswers] DROP CONSTRAINT [FK_TestingQuestionsAnswers_TestingQuestions]
GO
ALTER TABLE [dbo].[TestingQuestions] DROP CONSTRAINT [FK_TestingQuestions_TestingQuestionsTypes]
GO
ALTER TABLE [dbo].[TestingQuestions] DROP CONSTRAINT [FK_TestingQuestions_Testing]
GO
ALTER TABLE [dbo].[SingleSignOnTokens] DROP CONSTRAINT [FK_SingleSignOnTokens_UserProfiles]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] DROP CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCartItems]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] DROP CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] DROP CONSTRAINT [FK_ShoppingCartPromoCodes_EventPromoCode]
GO
ALTER TABLE [dbo].[ShoppingCartOptions] DROP CONSTRAINT [FK_ShoppingCartOptions_ShoppingCartItems]
GO
ALTER TABLE [dbo].[ShoppingCartItems] DROP CONSTRAINT [FK_ShoppingCartItems_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [FK_ShoppingCart_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesViews] DROP CONSTRAINT [FK_RSSeriesViews_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] DROP CONSTRAINT [FK_RSSeriesStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] DROP CONSTRAINT [FK_RSSeriesStreamViews_RSSeriesStreams]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] DROP CONSTRAINT [FK_RSSeriesStreamViews_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesStreams] DROP CONSTRAINT [FK_RSSeriesStreams_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] DROP CONSTRAINT [FK_RSSeriesSpecialties_Specialties]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] DROP CONSTRAINT [FK_RSSeriesSpecialties_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] DROP CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] DROP CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] DROP CONSTRAINT [FK_RSSeriesSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] DROP CONSTRAINT [FK_RSSeriesSpeakers_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] DROP CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] DROP CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles] DROP CONSTRAINT [FK_RSSeriesSpeakerChecklistPresentationFiles_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistCVs] DROP CONSTRAINT [FK_RSSeriesSpeakerChecklistCVs_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo] DROP CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] DROP CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] DROP CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] DROP CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] DROP CONSTRAINT [FK_RSSeriesSeriesAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] DROP CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] DROP CONSTRAINT [FK_RSSeriesRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] DROP CONSTRAINT [FK_RSSeriesRegistrations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] DROP CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] DROP CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesPanels] DROP CONSTRAINT [FK_RSSeriesPanels_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesNotes] DROP CONSTRAINT [FK_RSSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesNotes] DROP CONSTRAINT [FK_RSSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesNotes] DROP CONSTRAINT [FK_RSSeriesNotes_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesJointProviders] DROP CONSTRAINT [FK_RSSeriesJointProviders_RSSeriesJointProviders]
GO
ALTER TABLE [dbo].[RSSeriesFiles] DROP CONSTRAINT [FK_RSSeriesFiles_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] DROP CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] DROP CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] DROP CONSTRAINT [FK_RSSeriesEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] DROP CONSTRAINT [FK_RSSeriesEvaluations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationProgramResults] DROP CONSTRAINT [FK_RSSeriesEvaluationProgramResults_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] DROP CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] DROP CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationCompetencies] DROP CONSTRAINT [FK_RSSeriesEvaluationCompetencies_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] DROP CONSTRAINT [FK_RSSeriesCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] DROP CONSTRAINT [FK_RSSeriesCreditImports_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportRecords] DROP CONSTRAINT [FK_RSSeriesCreditImportRecords_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportErrors] DROP CONSTRAINT [FK_RSSeriesCreditImportErrors_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeries] DROP CONSTRAINT [FK_RSSeries_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeries] DROP CONSTRAINT [FK_RSSeries_EventStatus]
GO
ALTER TABLE [dbo].[RSSeries] DROP CONSTRAINT [FK_RSSeries_EventProvidership]
GO
ALTER TABLE [dbo].[LoginLog] DROP CONSTRAINT [FK_LoginLog_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalUsers] DROP CONSTRAINT [FK_HospitalUsers_Hospitals]
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] DROP CONSTRAINT [FK_HospitalGroupHospitals_Hospitals]
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] DROP CONSTRAINT [FK_HospitalGroupHospitals_HospitalGroupHospitals]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] DROP CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocumentsHospitals]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] DROP CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocuments]
GO
ALTER TABLE [dbo].[HospitalAdmins] DROP CONSTRAINT [FK_HospitalAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalAdmins] DROP CONSTRAINT [FK_HospitalAdmins_Hospitals]
GO
ALTER TABLE [dbo].[FacultyDisclosures] DROP CONSTRAINT [FK_FacultyDisclosures_UserProfiles]
GO
ALTER TABLE [dbo].[FacultyDisclosures] DROP CONSTRAINT [FK_FacultyDisclosures_EventTypes]
GO
ALTER TABLE [dbo].[FacultyDisclosureRoles] DROP CONSTRAINT [FK_FacultyDisclosureRoles_FacultyDisclosures]
GO
ALTER TABLE [dbo].[FacultyDisclosureCommercialInterests] DROP CONSTRAINT [FK_FacultyDisclosureCommercialInterests_FacultyDisclosures]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] DROP CONSTRAINT [FK_EventPromoCodeProfessionRestriction_Professions]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] DROP CONSTRAINT [FK_EventPromoCodeProfessionRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeEmailRestriction] DROP CONSTRAINT [FK_EventPromoCodeEmailRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] DROP CONSTRAINT [FK_EventPromoCodeDegreeRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] DROP CONSTRAINT [FK_EventPromoCodeDegreeRestriction_Degrees]
GO
ALTER TABLE [dbo].[EventAdvertisers] DROP CONSTRAINT [FK_EventDisplays_EventTypes]
GO
ALTER TABLE [dbo].[EnduringMaterialViews] DROP CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] DROP CONSTRAINT [FK_EnduringMaterialSpecialties_Specialties]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] DROP CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] DROP CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] DROP CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] DROP CONSTRAINT [FK_EnduringMaterialSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] DROP CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] DROP CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] DROP CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakerChecklists]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] DROP CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] DROP CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] DROP CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles] DROP CONSTRAINT [FK_EnduringMaterialSpeakerChecklistPresentationFiles_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs] DROP CONSTRAINT [FK_EnduringMaterialSpeakerChecklistCVs_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterials] DROP CONSTRAINT [FK_EnduringMaterials_EventStatus]
GO
ALTER TABLE [dbo].[EnduringMaterials] DROP CONSTRAINT [FK_EnduringMaterials_EventProvidership]
GO
ALTER TABLE [dbo].[EnduringMaterials] DROP CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] DROP CONSTRAINT [FK_EnduringMaterialRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] DROP CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] DROP CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialRegistrations]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] DROP CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialPrices]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] DROP CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialOptions]
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] DROP CONSTRAINT [FK_EnduringMaterialPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] DROP CONSTRAINT [FK_EnduringMaterialPanelSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialPanels] DROP CONSTRAINT [FK_EnduringMaterialPanels_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialOptionsGroups] DROP CONSTRAINT [FK_EnduringMaterialOptionsGroups_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialOptions] DROP CONSTRAINT [FK_EnduringMaterialOptions_EnduringMaterialOptionsGroups]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] DROP CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] DROP CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] DROP CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialJointProviders] DROP CONSTRAINT [FK_EnduringMaterialJointProviders_EnduringMaterialJointProviders]
GO
ALTER TABLE [dbo].[EnduringMaterialFiles] DROP CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] DROP CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] DROP CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] DROP CONSTRAINT [FK_EnduringMaterialEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] DROP CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationProgramResults] DROP CONSTRAINT [FK_EnduringMaterialEvaluationProgramResults_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] DROP CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] DROP CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationCompetencies] DROP CONSTRAINT [FK_EnduringMaterialEvaluationCompetencies_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] DROP CONSTRAINT [FK_EnduringMaterialCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] DROP CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportRecords] DROP CONSTRAINT [FK_EnduringMaterialCreditImportRecords_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportErrors] DROP CONSTRAINT [FK_EnduringMaterialCreditImportErrors_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialBoards] DROP CONSTRAINT [FK_EnduringMaterialBoards_Boards]
GO
ALTER TABLE [dbo].[EmailQueueMessages] DROP CONSTRAINT [FK_EmailQueueMessages_UserProfiles]
GO
ALTER TABLE [dbo].[EmailQueueMessages] DROP CONSTRAINT [FK_EmailQueueMessages_EmailQueues]
GO
ALTER TABLE [dbo].[EmailPreferences] DROP CONSTRAINT [FK_EmailPreferences_EmailTypes]
GO
ALTER TABLE [dbo].[EmailPreferences] DROP CONSTRAINT [FK_EmailPreferences_EmailFrequencies]
GO
ALTER TABLE [dbo].[EmailHistory] DROP CONSTRAINT [FK_EmailHistory_EmailTypes]
GO
ALTER TABLE [dbo].[DuplicateUserRuns] DROP CONSTRAINT [FK_DuplicateUserRuns_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] DROP CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles1]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] DROP CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] DROP CONSTRAINT [FK_DuplicateUserRunRecords_DuplicateUserRuns]
GO
ALTER TABLE [dbo].[DuplicateUserRunIgnoreRecords] DROP CONSTRAINT [FK_DuplicateUserRunIgnoreRecords_UserProfiles]
GO
ALTER TABLE [dbo].[CreditNotifications] DROP CONSTRAINT [FK_CreditNotifications_EventTypes]
GO
ALTER TABLE [dbo].[ConferenceWaitlist] DROP CONSTRAINT [FK_ConferenceWaitlist_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceStreamViews] DROP CONSTRAINT [FK_ConferenceStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceStreamViews] DROP CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams]
GO
ALTER TABLE [dbo].[ConferenceStreamViews] DROP CONSTRAINT [FK_ConferenceStreamViews_Conferences]
GO
ALTER TABLE [dbo].[ConferenceSpecialties] DROP CONSTRAINT [FK_ConferenceSpecailties_Specialties]
GO
ALTER TABLE [dbo].[ConferenceSpeakerTopics] DROP CONSTRAINT [FK_ConferenceSpeakerTopics_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpeakers] DROP CONSTRAINT [FK_ConferenceSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklists] DROP CONSTRAINT [FK_ConferenceSpeakerChecklist_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles] DROP CONSTRAINT [FK_ConferenceSpeakerChecklistPresentationFiles_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistCVs] DROP CONSTRAINT [FK_ConferenceSpeakerChecklistCVs_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds] DROP CONSTRAINT [FK_ConferenceSpeakerChecklistAVNeeds_ConferenceSpeakerChecklists]
GO
ALTER TABLE [dbo].[Conferences] DROP CONSTRAINT [FK_Conferences_EventStatus]
GO
ALTER TABLE [dbo].[Conferences] DROP CONSTRAINT [FK_Conferences_EventProvidership]
GO
ALTER TABLE [dbo].[ConferenceRegistrations] DROP CONSTRAINT [FK_ConferenceRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceRegistrations] DROP CONSTRAINT [FK_ConferenceRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] DROP CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceRegistrations]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] DROP CONSTRAINT [FK_ConferenceRegistrationItems_ConferencePrices]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] DROP CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] DROP CONSTRAINT [FK_ConferencePanelSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] DROP CONSTRAINT [FK_ConferencePanelSpeakers_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferenceOptions] DROP CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups]
GO
ALTER TABLE [dbo].[ConferenceNotes] DROP CONSTRAINT [FK_ConferenceNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[ConferenceNotes] DROP CONSTRAINT [FK_ConferenceNotes_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] DROP CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] DROP CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluations] DROP CONSTRAINT [FK_ConferenceEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationProgramResults] DROP CONSTRAINT [FK_ConferenceEvaluationProgramResults_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] DROP CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] DROP CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationCompetencies] DROP CONSTRAINT [FK_ConferenceEvaluationCompetencies_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceCreditImports] DROP CONSTRAINT [FK_ConferenceCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceCreditImportRecords] DROP CONSTRAINT [FK_ConferenceCreditImportRecords_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[ConferenceCreditImportErrors] DROP CONSTRAINT [FK_ConferenceCreditImportErrors_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserProfiles_5]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserProfiles_5] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserProfiles_4]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserProfiles_4] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserProfiles_2]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserProfiles_2] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserProfiles_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserProfiles_1] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserProfiles]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserProfiles] ON [dbo].[UserProfiles]
GO
/****** Object:  Index [IX_UserNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_UserNotes] ON [dbo].[UserNotes]
GO
/****** Object:  Index [IX_SingleSignOnTokens]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_SingleSignOnTokens] ON [dbo].[SingleSignOnTokens]
GO
/****** Object:  Index [IX_RSSeriesSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSpeakers_1] ON [dbo].[RSSeriesSpeakers]
GO
/****** Object:  Index [IX_RSSeriesSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSpeakers] ON [dbo].[RSSeriesSpeakers]
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSeriesAdmins_1] ON [dbo].[RSSeriesSeriesAdmins]
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSeriesAdmins] ON [dbo].[RSSeriesSeriesAdmins]
GO
/****** Object:  Index [IX_RSSeriesSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSeries_1] ON [dbo].[RSSeriesSeries]
GO
/****** Object:  Index [IX_RSSeriesSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesSeries] ON [dbo].[RSSeriesSeries]
GO
/****** Object:  Index [IX_RSSeriesRegistrations_2]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesRegistrations_2] ON [dbo].[RSSeriesRegistrations]
GO
/****** Object:  Index [IX_RSSeriesRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesRegistrations_1] ON [dbo].[RSSeriesRegistrations]
GO
/****** Object:  Index [IX_RSSeriesRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesRegistrations] ON [dbo].[RSSeriesRegistrations]
GO
/****** Object:  Index [IX_RSSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesNotes] ON [dbo].[RSSeriesNotes]
GO
/****** Object:  Index [IX_RSSeriesCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeriesCreditImports] ON [dbo].[RSSeriesCreditImports]
GO
/****** Object:  Index [IX_RSSeries_3]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeries_3] ON [dbo].[RSSeries]
GO
/****** Object:  Index [IX_RSSeries_2]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeries_2] ON [dbo].[RSSeries]
GO
/****** Object:  Index [IX_RSSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeries_1] ON [dbo].[RSSeries]
GO
/****** Object:  Index [IX_RSSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_RSSeries] ON [dbo].[RSSeries]
GO
/****** Object:  Index [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6] ON [dbo].[HospitalUsers]
GO
/****** Object:  Index [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113] ON [dbo].[HospitalUsers]
GO
/****** Object:  Index [IX_FacultyDisclosures_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_FacultyDisclosures_1] ON [dbo].[FacultyDisclosures]
GO
/****** Object:  Index [IX_FacultyDisclosures]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_FacultyDisclosures] ON [dbo].[FacultyDisclosures]
GO
/****** Object:  Index [IX_FacultyDisclosureRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_FacultyDisclosureRoles] ON [dbo].[FacultyDisclosureRoles]
GO
/****** Object:  Index [IX_FacultyDisclosureCommercialInterests]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_FacultyDisclosureCommercialInterests] ON [dbo].[FacultyDisclosureCommercialInterests]
GO
/****** Object:  Index [IX_EventSupport_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EventSupport_1] ON [dbo].[EventSupport]
GO
/****** Object:  Index [IX_EventSupport]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EventSupport] ON [dbo].[EventSupport]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialSpeakers_1] ON [dbo].[EnduringMaterialSpeakers]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialSpeakers] ON [dbo].[EnduringMaterialSpeakers]
GO
/****** Object:  Index [IX_EnduringMaterialSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialSeries_1] ON [dbo].[EnduringMaterialSeries]
GO
/****** Object:  Index [IX_EnduringMaterialSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialSeries] ON [dbo].[EnduringMaterialSeries]
GO
/****** Object:  Index [IX_EnduringMaterials_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterials_1] ON [dbo].[EnduringMaterials]
GO
/****** Object:  Index [IX_EnduringMaterials]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterials] ON [dbo].[EnduringMaterials]
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialRegistrations_1] ON [dbo].[EnduringMaterialRegistrations]
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialRegistrations] ON [dbo].[EnduringMaterialRegistrations]
GO
/****** Object:  Index [IX_EnduringMaterialNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialNotes] ON [dbo].[EnduringMaterialNotes]
GO
/****** Object:  Index [IX_EnduringMaterialCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EnduringMaterialCreditImports] ON [dbo].[EnduringMaterialCreditImports]
GO
/****** Object:  Index [IX_EmailQueueMessages]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EmailQueueMessages] ON [dbo].[EmailQueueMessages]
GO
/****** Object:  Index [IX_EmailPreferences]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_EmailPreferences] ON [dbo].[EmailPreferences]
GO
/****** Object:  Index [IX_DuplicateUserRunRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_DuplicateUserRunRecords] ON [dbo].[DuplicateUserRunRecords]
GO
/****** Object:  Index [IX_DuplicateUserRunIgnoreRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_DuplicateUserRunIgnoreRecords] ON [dbo].[DuplicateUserRunIgnoreRecords]
GO
/****** Object:  Index [IX_CreditNotifications]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_CreditNotifications] ON [dbo].[CreditNotifications]
GO
/****** Object:  Index [IX_ConferenceSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpecialties] ON [dbo].[ConferenceSpecialties]
GO
/****** Object:  Index [IX_ConferenceSpecailties]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpecailties] ON [dbo].[ConferenceSpecialties]
GO
/****** Object:  Index [IX_ConferenceSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpeakerTopics] ON [dbo].[ConferenceSpeakerTopics]
GO
/****** Object:  Index [IX_ConferenceSpeakers_2]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpeakers_2] ON [dbo].[ConferenceSpeakers]
GO
/****** Object:  Index [IX_ConferenceSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpeakers_1] ON [dbo].[ConferenceSpeakers]
GO
/****** Object:  Index [IX_ConferenceSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceSpeakers] ON [dbo].[ConferenceSpeakers]
GO
/****** Object:  Index [IX_Conferences_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_Conferences_1] ON [dbo].[Conferences]
GO
/****** Object:  Index [IX_Conferences]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_Conferences] ON [dbo].[Conferences]
GO
/****** Object:  Index [IX_ConferenceRegistrations_3]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceRegistrations_3] ON [dbo].[ConferenceRegistrations]
GO
/****** Object:  Index [IX_ConferenceRegistrations_2]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceRegistrations_2] ON [dbo].[ConferenceRegistrations]
GO
/****** Object:  Index [IX_ConferenceRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceRegistrations_1] ON [dbo].[ConferenceRegistrations]
GO
/****** Object:  Index [IX_ConferenceRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceRegistrations] ON [dbo].[ConferenceRegistrations]
GO
/****** Object:  Index [IX_ConferencePrices_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferencePrices_1] ON [dbo].[ConferencePrices]
GO
/****** Object:  Index [IX_ConferencePrices]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferencePrices] ON [dbo].[ConferencePrices]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceOptionsGroups_1] ON [dbo].[ConferenceOptionsGroups]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceOptionsGroups] ON [dbo].[ConferenceOptionsGroups]
GO
/****** Object:  Index [IX_ConferenceOptions_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceOptions_1] ON [dbo].[ConferenceOptions]
GO
/****** Object:  Index [IX_ConferenceOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceOptions] ON [dbo].[ConferenceOptions]
GO
/****** Object:  Index [IX_ConferenceNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceNotes] ON [dbo].[ConferenceNotes]
GO
/****** Object:  Index [IX_ConferenceJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceJointProviders] ON [dbo].[ConferenceJointProviders]
GO
/****** Object:  Index [IX_ConferenceFiles_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceFiles_1] ON [dbo].[ConferenceFiles]
GO
/****** Object:  Index [IX_ConferenceFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceFiles] ON [dbo].[ConferenceFiles]
GO
/****** Object:  Index [IX_ConferenceEvaluatonSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceEvaluatonSpeakers] ON [dbo].[ConferenceEvaluationSpeakers]
GO
/****** Object:  Index [IX_ConferenceEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceEvaluations] ON [dbo].[ConferenceEvaluations]
GO
/****** Object:  Index [IX_ConferenceEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceEvaluationProgramResults] ON [dbo].[ConferenceEvaluationProgramResults]
GO
/****** Object:  Index [IX_ConferenceEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceEvaluationCompetencies] ON [dbo].[ConferenceEvaluationCompetencies]
GO
/****** Object:  Index [IX_ConferenceCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_ConferenceCreditImports] ON [dbo].[ConferenceCreditImports]
GO
/****** Object:  Index [IX_AspNetUsers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_AspNetUsers_1] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_AspNetUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_AspNetUsers] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_AspNetUserRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
DROP INDEX [IX_AspNetUserRoles] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[WebcastViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastViews]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastViews]
GO
/****** Object:  Table [dbo].[WebcastTest]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastTest]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastTest]
GO
/****** Object:  Table [dbo].[WebcastsViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastsViews]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastsViews]
GO
/****** Object:  Table [dbo].[WebcastSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpecialties]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpecialties]
GO
/****** Object:  Table [dbo].[WebcastSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerTopics]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerTopics]
GO
/****** Object:  Table [dbo].[WebcastSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakers]
GO
/****** Object:  Table [dbo].[WebcastSpeakerConsentForms]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerConsentForms]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerConsentForms]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerChecklists]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerChecklists]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerChecklistPresentationFiles]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerChecklistCVs]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerChecklistCVs]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistAVNeeds]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastSpeakerChecklistAVNeeds]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastSpeakerChecklistAVNeeds]
GO
/****** Object:  Table [dbo].[Webcasts]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Webcasts]') AND type in (N'U'))
DROP TABLE [dbo].[Webcasts]
GO
/****** Object:  Table [dbo].[WebcastRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastRegistrations]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastRegistrations]
GO
/****** Object:  Table [dbo].[WebcastRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastRegistrationItems]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastRegistrationItems]
GO
/****** Object:  Table [dbo].[WebcastQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastQuestions]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastQuestions]
GO
/****** Object:  Table [dbo].[WebcastPrices]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastPrices]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastPrices]
GO
/****** Object:  Table [dbo].[WebcastPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastPanelSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastPanelSpeakers]
GO
/****** Object:  Table [dbo].[WebcastPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastPanels]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastPanels]
GO
/****** Object:  Table [dbo].[WebcastOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastOptionsGroups]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastOptionsGroups]
GO
/****** Object:  Table [dbo].[WebcastOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastOptions]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastOptions]
GO
/****** Object:  Table [dbo].[WebcastNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastNotes]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastNotes]
GO
/****** Object:  Table [dbo].[WebcastMOCCreditTypes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastMOCCreditTypes]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastMOCCreditTypes]
GO
/****** Object:  Table [dbo].[WebcastMOC]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastMOC]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastMOC]
GO
/****** Object:  Table [dbo].[WebcastJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastJointProviders]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastJointProviders]
GO
/****** Object:  Table [dbo].[WebcastFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastFiles]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastFiles]
GO
/****** Object:  Table [dbo].[WebcastEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastEvaluationSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastEvaluationSpeakers]
GO
/****** Object:  Table [dbo].[WebcastEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastEvaluations]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastEvaluations]
GO
/****** Object:  Table [dbo].[WebcastEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastEvaluationProgramResults]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastEvaluationProgramResults]
GO
/****** Object:  Table [dbo].[WebcastEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastEvaluationPanels]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastEvaluationPanels]
GO
/****** Object:  Table [dbo].[WebcastEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastEvaluationCompetencies]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastEvaluationCompetencies]
GO
/****** Object:  Table [dbo].[WebcastCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastCreditImports]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastCreditImports]
GO
/****** Object:  Table [dbo].[WebcastCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastCreditImportRecords]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastCreditImportRecords]
GO
/****** Object:  Table [dbo].[WebcastCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastCreditImportErrors]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastCreditImportErrors]
GO
/****** Object:  Table [dbo].[WebcastBoards]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastBoards]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastBoards]
GO
/****** Object:  Table [dbo].[WebcastACCMEIDs]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebcastACCMEIDs]') AND type in (N'U'))
DROP TABLE [dbo].[WebcastACCMEIDs]
GO
/****** Object:  Table [dbo].[UserTests]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTests]') AND type in (N'U'))
DROP TABLE [dbo].[UserTests]
GO
/****** Object:  Table [dbo].[UserTestQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTestQuestions]') AND type in (N'U'))
DROP TABLE [dbo].[UserTestQuestions]
GO
/****** Object:  Table [dbo].[UserTestQuestionAnswers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTestQuestionAnswers]') AND type in (N'U'))
DROP TABLE [dbo].[UserTestQuestionAnswers]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfiles]') AND type in (N'U'))
DROP TABLE [dbo].[UserProfiles]
GO
/****** Object:  Table [dbo].[UserNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNotes]') AND type in (N'U'))
DROP TABLE [dbo].[UserNotes]
GO
/****** Object:  Table [dbo].[UserImports]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserImports]') AND type in (N'U'))
DROP TABLE [dbo].[UserImports]
GO
/****** Object:  Table [dbo].[UserImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserImportRecords]') AND type in (N'U'))
DROP TABLE [dbo].[UserImportRecords]
GO
/****** Object:  Table [dbo].[UserImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserImportErrors]') AND type in (N'U'))
DROP TABLE [dbo].[UserImportErrors]
GO
/****** Object:  Table [dbo].[UserIDMapping]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIDMapping]') AND type in (N'U'))
DROP TABLE [dbo].[UserIDMapping]
GO
/****** Object:  Table [dbo].[UserBoardIdentificationNumbers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBoardIdentificationNumbers]') AND type in (N'U'))
DROP TABLE [dbo].[UserBoardIdentificationNumbers]
GO
/****** Object:  Table [dbo].[UploadedImages]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UploadedImages]') AND type in (N'U'))
DROP TABLE [dbo].[UploadedImages]
GO
/****** Object:  Table [dbo].[UploadedFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UploadedFiles]') AND type in (N'U'))
DROP TABLE [dbo].[UploadedFiles]
GO
/****** Object:  Table [dbo].[TestingQuestionsTypes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestingQuestionsTypes]') AND type in (N'U'))
DROP TABLE [dbo].[TestingQuestionsTypes]
GO
/****** Object:  Table [dbo].[TestingQuestionsFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestingQuestionsFiles]') AND type in (N'U'))
DROP TABLE [dbo].[TestingQuestionsFiles]
GO
/****** Object:  Table [dbo].[TestingQuestionsAnswers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestingQuestionsAnswers]') AND type in (N'U'))
DROP TABLE [dbo].[TestingQuestionsAnswers]
GO
/****** Object:  Table [dbo].[TestingQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestingQuestions]') AND type in (N'U'))
DROP TABLE [dbo].[TestingQuestions]
GO
/****** Object:  Table [dbo].[Testing]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Testing]') AND type in (N'U'))
DROP TABLE [dbo].[Testing]
GO
/****** Object:  Table [dbo].[SingleSignOnTokens]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SingleSignOnTokens]') AND type in (N'U'))
DROP TABLE [dbo].[SingleSignOnTokens]
GO
/****** Object:  Table [dbo].[ShoppingCartPromoCodes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartPromoCodes]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCartPromoCodes]
GO
/****** Object:  Table [dbo].[ShoppingCartOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartOptions]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCartOptions]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartItems]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCartItems]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCart]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCart]
GO
/****** Object:  Table [dbo].[RSSeriesViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesViews]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesViews]
GO
/****** Object:  Table [dbo].[RSSeriesStreamViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesStreamViews]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesStreamViews]
GO
/****** Object:  Table [dbo].[RSSeriesStreams]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesStreams]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesStreams]
GO
/****** Object:  Table [dbo].[RSSeriesSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpecialties]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpecialties]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpeakerTopics]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpeakerTopics]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpeakers]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpeakerChecklists]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpeakerChecklists]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpeakerChecklistPresentationFiles]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSpeakerChecklistCVs]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSpeakerChecklistCVs]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesYearlyInfo]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSeriesYearlyInfo]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSeriesYearlyInfo]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSeriesNotes]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSeriesNotes]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSeriesAdmins]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSeriesAdmins]
GO
/****** Object:  Table [dbo].[RSSeriesSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesSeries]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesSeries]
GO
/****** Object:  Table [dbo].[RSSeriesRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesRegistrations]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesRegistrations]
GO
/****** Object:  Table [dbo].[RSSeriesPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesPanelSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesPanelSpeakers]
GO
/****** Object:  Table [dbo].[RSSeriesPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesPanels]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesPanels]
GO
/****** Object:  Table [dbo].[RSSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesNotes]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesNotes]
GO
/****** Object:  Table [dbo].[RSSeriesJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesJointProviders]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesJointProviders]
GO
/****** Object:  Table [dbo].[RSSeriesFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesFiles]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesFiles]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesEvaluationSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesEvaluationSpeakers]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesEvaluations]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesEvaluations]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesEvaluationProgramResults]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesEvaluationProgramResults]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesEvaluationPanels]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesEvaluationPanels]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesEvaluationCompetencies]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesEvaluationCompetencies]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesCreditImports]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesCreditImports]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesCreditImportRecords]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesCreditImportRecords]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeriesCreditImportErrors]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeriesCreditImportErrors]
GO
/****** Object:  Table [dbo].[RSSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSeries]') AND type in (N'U'))
DROP TABLE [dbo].[RSSeries]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentHistory]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentHistory]
GO
/****** Object:  Table [dbo].[NelnetTransactionLog]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NelnetTransactionLog]') AND type in (N'U'))
DROP TABLE [dbo].[NelnetTransactionLog]
GO
/****** Object:  Table [dbo].[LoginLog]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[LoginLog]
GO
/****** Object:  Table [dbo].[HospitalUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalUsers]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalUsers]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hospitals]') AND type in (N'U'))
DROP TABLE [dbo].[Hospitals]
GO
/****** Object:  Table [dbo].[HospitalGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalGroups]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalGroups]
GO
/****** Object:  Table [dbo].[HospitalGroupHospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalGroupHospitals]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalGroupHospitals]
GO
/****** Object:  Table [dbo].[HospitalDocumentsHospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalDocumentsHospitals]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalDocumentsHospitals]
GO
/****** Object:  Table [dbo].[HospitalDocuments]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalDocuments]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalDocuments]
GO
/****** Object:  Table [dbo].[HospitalAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalAdmins]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalAdmins]
GO
/****** Object:  Table [dbo].[FacultyDisclosures]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacultyDisclosures]') AND type in (N'U'))
DROP TABLE [dbo].[FacultyDisclosures]
GO
/****** Object:  Table [dbo].[FacultyDisclosureRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacultyDisclosureRoles]') AND type in (N'U'))
DROP TABLE [dbo].[FacultyDisclosureRoles]
GO
/****** Object:  Table [dbo].[FacultyDisclosureCommercialInterests]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacultyDisclosureCommercialInterests]') AND type in (N'U'))
DROP TABLE [dbo].[FacultyDisclosureCommercialInterests]
GO
/****** Object:  Table [dbo].[EventSupport]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSupport]') AND type in (N'U'))
DROP TABLE [dbo].[EventSupport]
GO
/****** Object:  Table [dbo].[EventRevenues]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventRevenues]') AND type in (N'U'))
DROP TABLE [dbo].[EventRevenues]
GO
/****** Object:  Table [dbo].[EventPromoCodeProfessionRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventPromoCodeProfessionRestriction]') AND type in (N'U'))
DROP TABLE [dbo].[EventPromoCodeProfessionRestriction]
GO
/****** Object:  Table [dbo].[EventPromoCodeEmailRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventPromoCodeEmailRestriction]') AND type in (N'U'))
DROP TABLE [dbo].[EventPromoCodeEmailRestriction]
GO
/****** Object:  Table [dbo].[EventPromoCodeDegreeRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventPromoCodeDegreeRestriction]') AND type in (N'U'))
DROP TABLE [dbo].[EventPromoCodeDegreeRestriction]
GO
/****** Object:  Table [dbo].[EventPromoCode]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventPromoCode]') AND type in (N'U'))
DROP TABLE [dbo].[EventPromoCode]
GO
/****** Object:  Table [dbo].[EventExpenses]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventExpenses]') AND type in (N'U'))
DROP TABLE [dbo].[EventExpenses]
GO
/****** Object:  Table [dbo].[EventAdvertisers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventAdvertisers]') AND type in (N'U'))
DROP TABLE [dbo].[EventAdvertisers]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
DROP TABLE [dbo].[ErrorLog]
GO
/****** Object:  Table [dbo].[EnduringMaterialViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialViews]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialViews]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpecialties]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpecialties]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakerTopics]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakerTopics]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakers]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerConsentForms]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakerConsentForms]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakerConsentForms]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakerChecklists]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakerChecklists]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSpeakerChecklistCVs]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs]
GO
/****** Object:  Table [dbo].[EnduringMaterialSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialSeries]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialSeries]
GO
/****** Object:  Table [dbo].[EnduringMaterials]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterials]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterials]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialRegistrations]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialRegistrations]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialRegistrationItems]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialRegistrationItems]
GO
/****** Object:  Table [dbo].[EnduringMaterialPrices]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialPrices]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialPrices]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialPanelSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialPanelSpeakers]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialPanels]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialPanels]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialOptionsGroups]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialOptionsGroups]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialOptions]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialOptions]
GO
/****** Object:  Table [dbo].[EnduringMaterialNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialNotes]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialNotes]
GO
/****** Object:  Table [dbo].[EnduringMaterialJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialJointProviders]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialJointProviders]
GO
/****** Object:  Table [dbo].[EnduringMaterialFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialFiles]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialFiles]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialEvaluationSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialEvaluationSpeakers]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialEvaluations]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialEvaluations]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialEvaluationProgramResults]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialEvaluationProgramResults]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialEvaluationPanels]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialEvaluationPanels]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialEvaluationCompetencies]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialEvaluationCompetencies]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialCreditImports]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialCreditImports]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialCreditImportRecords]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialCreditImportRecords]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialCreditImportErrors]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialCreditImportErrors]
GO
/****** Object:  Table [dbo].[EnduringMaterialBoards]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnduringMaterialBoards]') AND type in (N'U'))
DROP TABLE [dbo].[EnduringMaterialBoards]
GO
/****** Object:  Table [dbo].[EmailQueueMessages]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailQueueMessages]') AND type in (N'U'))
DROP TABLE [dbo].[EmailQueueMessages]
GO
/****** Object:  Table [dbo].[EmailPreferences]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailPreferences]') AND type in (N'U'))
DROP TABLE [dbo].[EmailPreferences]
GO
/****** Object:  Table [dbo].[EmailHistory]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailHistory]') AND type in (N'U'))
DROP TABLE [dbo].[EmailHistory]
GO
/****** Object:  Table [dbo].[DuplicateUserRuns]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateUserRuns]') AND type in (N'U'))
DROP TABLE [dbo].[DuplicateUserRuns]
GO
/****** Object:  Table [dbo].[DuplicateUserRunRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateUserRunRecords]') AND type in (N'U'))
DROP TABLE [dbo].[DuplicateUserRunRecords]
GO
/****** Object:  Table [dbo].[DuplicateUserRunIgnoreRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateUserRunIgnoreRecords]') AND type in (N'U'))
DROP TABLE [dbo].[DuplicateUserRunIgnoreRecords]
GO
/****** Object:  Table [dbo].[Criteria37]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria37]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria37]
GO
/****** Object:  Table [dbo].[Criteria35]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria35]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria35]
GO
/****** Object:  Table [dbo].[Criteria32]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria32]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria32]
GO
/****** Object:  Table [dbo].[Criteria30]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria30]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria30]
GO
/****** Object:  Table [dbo].[Criteria28]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria28]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria28]
GO
/****** Object:  Table [dbo].[Criteria27]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria27]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria27]
GO
/****** Object:  Table [dbo].[Criteria25]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria25]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria25]
GO
/****** Object:  Table [dbo].[Criteria24]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria24]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria24]
GO
/****** Object:  Table [dbo].[Criteria23]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria23]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria23]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criteria]') AND type in (N'U'))
DROP TABLE [dbo].[Criteria]
GO
/****** Object:  Table [dbo].[CreditNotifications]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditNotifications]') AND type in (N'U'))
DROP TABLE [dbo].[CreditNotifications]
GO
/****** Object:  Table [dbo].[ConferenceWaitlistSettings]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceWaitlistSettings]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceWaitlistSettings]
GO
/****** Object:  Table [dbo].[ConferenceWaitlist]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceWaitlist]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceWaitlist]
GO
/****** Object:  Table [dbo].[ConferenceViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceViews]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceViews]
GO
/****** Object:  Table [dbo].[ConferenceStreamViews]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceStreamViews]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceStreamViews]
GO
/****** Object:  Table [dbo].[ConferenceStreams]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceStreams]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceStreams]
GO
/****** Object:  Table [dbo].[ConferenceSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpecialties]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpecialties]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakerTopics]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakerTopics]
GO
/****** Object:  Table [dbo].[ConferenceSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakers]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakerChecklists]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakerChecklists]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakerChecklistPresentationFiles]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakerChecklistCVs]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakerChecklistCVs]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistAVNeeds]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceSpeakerChecklistAVNeeds]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conferences]') AND type in (N'U'))
DROP TABLE [dbo].[Conferences]
GO
/****** Object:  Table [dbo].[ConferenceRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceRegistrations]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceRegistrations]
GO
/****** Object:  Table [dbo].[ConferenceRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceRegistrationItems]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceRegistrationItems]
GO
/****** Object:  Table [dbo].[ConferenceQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceQuestions]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceQuestions]
GO
/****** Object:  Table [dbo].[ConferencePrices]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferencePrices]') AND type in (N'U'))
DROP TABLE [dbo].[ConferencePrices]
GO
/****** Object:  Table [dbo].[ConferencePanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferencePanelSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[ConferencePanelSpeakers]
GO
/****** Object:  Table [dbo].[ConferencePanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferencePanels]') AND type in (N'U'))
DROP TABLE [dbo].[ConferencePanels]
GO
/****** Object:  Table [dbo].[ConferenceOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceOptionsGroups]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceOptionsGroups]
GO
/****** Object:  Table [dbo].[ConferenceOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceOptions]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceOptions]
GO
/****** Object:  Table [dbo].[ConferenceNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceNotes]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceNotes]
GO
/****** Object:  Table [dbo].[ConferenceJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceJointProviders]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceJointProviders]
GO
/****** Object:  Table [dbo].[ConferenceFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceFiles]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceFiles]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceEvaluationSpeakers]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceEvaluationSpeakers]
GO
/****** Object:  Table [dbo].[ConferenceEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceEvaluations]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceEvaluations]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceEvaluationProgramResults]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceEvaluationProgramResults]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceEvaluationPanels]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceEvaluationPanels]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceEvaluationCompetencies]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceEvaluationCompetencies]
GO
/****** Object:  Table [dbo].[ConferenceCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceCreditImports]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceCreditImports]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceCreditImportRecords]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceCreditImportRecords]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConferenceCreditImportErrors]') AND type in (N'U'))
DROP TABLE [dbo].[ConferenceCreditImportErrors]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/23/2022 8:48:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[ConferencePanelID] [int] NOT NULL,
	[ConferencePanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_ConferenceEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_ConferenceEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ConferenceOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferencePanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePanelSpeakers](
	[ConferenceSpeakerID] [int] NOT NULL,
	[ConferencePanelID] [int] NOT NULL,
 CONSTRAINT [PK_ConferencePanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[ConferenceSpeakerID] ASC,
	[ConferencePanelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePrices]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferencePrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Question] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ConferenceRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsCanceled] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[FileAccessEnabled] [bit] NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_ConferenceRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conferences](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[Agenda] [nvarchar](max) NULL,
	[CEUs] [nvarchar](max) NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[RegisterForMIPS] [bit] NULL,
	[LocationKnown] [bit] NOT NULL,
	[LocationName] [nvarchar](256) NOT NULL,
	[LocationAddressLine1] [nvarchar](256) NOT NULL,
	[LocationAddressLine2] [nvarchar](256) NOT NULL,
	[LocationCity] [nvarchar](100) NOT NULL,
	[LocationState] [nvarchar](2) NOT NULL,
	[LocationZipCode] [nvarchar](5) NOT NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[MaxRegistrations] [int] NOT NULL,
	[WaitingListEnabled] [bit] NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[LocationCountry] [nvarchar](2) NOT NULL,
	[LocationProvinceRegion] [nvarchar](256) NOT NULL,
	[LocationPostalCode] [nvarchar](25) NOT NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[PublicRegistrationLinkText] [nvarchar](256) NULL,
	[PublicRegistrationLinkUrl] [nvarchar](max) NULL,
	[ConferenceType] [nvarchar](100) NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[IsMOCEligible] [bit] NULL,
	[ShowContactInformation] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_Conferences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistAVNeeds]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[Need] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistAVNeeds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[AVNeedsStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_ConferenceSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_ConferenceSpecailties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceStreams]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceStreams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[StreamTitle] [nvarchar](256) NOT NULL,
	[StreamDescription] [nvarchar](max) NOT NULL,
	[StreamType] [nvarchar](100) NOT NULL,
	[StreamURL] [nvarchar](256) NOT NULL,
	[StartDateTime] [smalldatetime] NOT NULL,
	[EndDateTime] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceStreams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceStreamViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceStreamViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceStreamID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceStreamViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceWaitlist]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceWaitlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsRegistered] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceWaitlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceWaitlistSettings]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceWaitlistSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[WaitlistEnabled] [bit] NOT NULL,
	[MaxNumberRegistered] [int] NULL,
	[WaitlistNoticeEmails] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceWaitlistSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditNotifications]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditNotifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SentOn] [datetime] NOT NULL,
	[SentBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CreditNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdateOn] [datetime] NULL,
	[LastUpdetedBy] [nvarchar](128) NULL,
	[CriteriaIsCompleted] [bit] NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria23]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria23](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EnentType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerProfessions] [nvarchar](max) NULL,
	[FacultyProfessions] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CriteriaC23] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria24]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria24](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerList] [nvarchar](max) NULL,
	[FacultyList] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria24] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria25]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria25](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerDescription] [nvarchar](max) NULL,
	[AttendeeDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CriteriaC25] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria27]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria27](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[StrategyDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria27] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria28]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria28](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[CollabDescription1] [nvarchar](max) NULL,
	[CollabDescription2] [nvarchar](max) NULL,
	[CollabDescription3] [nvarchar](max) NULL,
	[CollabDescription4] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria28] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria30]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria30](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityName] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[SkillDescription] [nvarchar](max) NULL,
	[FileUploadLocation] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria30] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria32]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria32](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[SupportDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria32] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria35]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria35](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[InnovationDescription1] [nvarchar](max) NULL,
	[InnovationDescription2] [nvarchar](max) NULL,
	[InnovationDescription3] [nvarchar](max) NULL,
	[InnovationDescription4] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria35] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria37]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria37](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ImprovementDescription1] [nvarchar](max) NULL,
	[ImprovementDescription2] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria37] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRunIgnoreRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRunIgnoreRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateUserRunID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[DuplicateUserID] [nvarchar](128) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DuplicateUserRunIgnoreRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRunRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRunRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateUserRunID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[DuplicateUserID] [nvarchar](128) NOT NULL,
	[OSUIDMatch] [bit] NOT NULL,
	[NationalProviderIdentifierMatch] [bit] NOT NULL,
	[NameMatch] [bit] NOT NULL,
 CONSTRAINT [PK_DuplicateUserRunRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRuns]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRuns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateRunTime] [smalldatetime] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[Records] [int] NULL,
	[Completed] [int] NULL,
	[StartTimeStamp] [smalldatetime] NULL,
	[EndTimeStamp] [smalldatetime] NULL,
 CONSTRAINT [PK_DuplicateUserRuns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailHistory]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailType] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[SentBy] [nvarchar](128) NOT NULL,
	[EmailMessage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailPreferences]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailPreferences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EmailType] [nvarchar](50) NOT NULL,
	[EmailFrequency] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NULL,
 CONSTRAINT [PK_EmailPreferences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailQueueMessages]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailQueueMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailQueueID] [int] NOT NULL,
	[SendDateTime] [smalldatetime] NOT NULL,
	[Parameters] [nvarchar](max) NOT NULL,
	[SendToUserID] [nvarchar](128) NOT NULL,
	[IsSent] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[SentOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmailQueueMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialBoards]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialMOCBoards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[EnduringMaterialPanelID] [int] NOT NULL,
	[EnduringMaterialPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPanelSpeakers](
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[EnduringMaterialPanelID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[EnduringMaterialSpeakerID] ASC,
	[EnduringMaterialPanelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPrices]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialPrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
	[FileAccessEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterials]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterials](
	[ID] [int] NOT NULL,
	[EnduringMaterialSeriesID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[IsFacultyDevelopment] [bit] NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[PublicRegistrationLinkUrl] [nchar](512) NULL,
	[PublicRegistrationLinkText] [nchar](256) NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[EnduringMaterialURL] [nvarchar](300) NULL,
	[ZipURL] [nvarchar](300) NULL,
	[Author] [nvarchar](max) NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCNotes] [nvarchar](max) NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[RegisterForMIPS] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_EnduringMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSeries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[AttendanceOverrideExpiration] [datetime] NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[PresenterConsentFormStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [date] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerConsentForms]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerConsentForms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[Status] [nchar](256) NOT NULL,
	[Type] [nchar](256) NOT NULL,
	[Signature] [nchar](256) NOT NULL,
	[SignatureDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerConsentForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpecialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventAdvertisers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventAdvertisers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventDisplays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventExpenses]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventExpenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventExpenses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCode]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](256) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsEmailRestricted] [bit] NOT NULL,
	[IsProfessionsRestricted] [bit] NOT NULL,
	[IsDegreesRestricted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[RestrictedEmails] [nvarchar](512) NULL,
 CONSTRAINT [PK_EventPromoCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeDegreeRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeDegreeRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeDegreeRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeEmailRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeEmailRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[EmailRestriction] [nvarchar](150) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeEmailRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeProfessionRestriction]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeProfessionRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[ProfessionID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeProfessionRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventRevenues]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventRevenues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventRevenues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSupport]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSupport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[OtherText] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventSupport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosureCommercialInterests]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosureCommercialInterests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyDisclosureID] [int] NOT NULL,
	[CompanyName] [nvarchar](256) NOT NULL,
	[Relationship] [nvarchar](256) NOT NULL,
	[RelationshipEnded] [bit] NULL,
 CONSTRAINT [PK_FacultyDisclosureCommercialInterests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosureRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosureRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyDisclosureID] [int] NOT NULL,
	[Role] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_FacultyDisclosureRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosures]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[EventType] [nvarchar](50) NULL,
	[EventID] [int] NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Disclosure] [bit] NOT NULL,
	[ResolutionOfConflictPresentersAuthors] [nvarchar](max) NOT NULL,
	[ResolutionOfConflictPlannersActivityDirectors] [nvarchar](max) NOT NULL,
	[NonConflictedCoDirector] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](256) NOT NULL,
	[Expires] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_FacultyDisclosures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalAdmins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HospitalAdmins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDocuments]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_HospitalDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDocumentsHospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDocumentsHospitals](
	[HospitalID] [int] NOT NULL,
	[DocumentID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalDocumentsHospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC,
	[DocumentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalGroupHospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalGroupHospitals](
	[GroupID] [int] NOT NULL,
	[HospitalID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalGroupHospitals] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[HospitalID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalGroupName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_HospitalGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[ID] [int] NOT NULL,
	[HospitalName] [nvarchar](256) NOT NULL,
	[MasterContactEmail] [nvarchar](256) NULL,
	[EmailContains] [nvarchar](max) NULL,
	[WebcastAccess] [bit] NOT NULL,
	[DownloadAccess] [bit] NOT NULL,
	[EnduringMaterialsAccess] [bit] NOT NULL,
	[AutoApprove] [bit] NOT NULL,
	[SendApprovalNotifications] [bit] NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[Archived] [bit] NULL,
	[IsUpdated] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsApproved] [bit] NULL,
	[RequestTimeStamp] [datetime] NULL,
	[ReviewedTimeStamp] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_HospitalUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginLog]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[IPAddress] [nvarchar](256) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AdminUserID] [nvarchar](128) NULL,
 CONSTRAINT [PK_LoginLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NelnetTransactionLog]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NelnetTransactionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](256) NULL,
	[TransactionStatus] [nvarchar](256) NULL,
	[TransactionID] [nvarchar](256) NULL,
	[TransactionTotalAmount] [nvarchar](256) NULL,
	[OrderNumber] [nvarchar](256) NULL,
	[TrasactionDate] [nvarchar](256) NULL,
 CONSTRAINT [PK_NelnetTransactionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeries](
	[ID] [int] NOT NULL,
	[SeriesID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[IsFacultyDevelopment] [bit] NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[LocationKnown] [bit] NOT NULL,
	[LocationName] [nvarchar](256) NOT NULL,
	[LocationAddressLine1] [nvarchar](256) NOT NULL,
	[LocationAddressLine2] [nvarchar](256) NOT NULL,
	[LocationCity] [nvarchar](100) NOT NULL,
	[LocationState] [nvarchar](2) NOT NULL,
	[LocationZipCode] [nvarchar](5) NOT NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[RSSeriesType] [nvarchar](100) NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[ShowContactInformation] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_RSSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[RSSeriesPanelID] [int] NOT NULL,
	[RSSeriesPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_RSSeriesEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_RSSeriesEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_RSSeriesEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesPanelSpeakers](
	[RSSeriesSpeakerID] [int] NOT NULL,
	[RSSeriesPanelID] [int] NOT NULL,
 CONSTRAINT [PK_RSSeriesPanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[RSSeriesSpeakerID] ASC,
	[RSSeriesPanelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_RSSeriesRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeries](
	[ID] [int] IDENTITY(113,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[AttendanceOverrideExpiration] [datetime] NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesAdmins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeriesAdmins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSeriesID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeriesNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesYearlyInfo]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesYearlyInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ActivityID] [nvarchar](128) NOT NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[Frequency] [nvarchar](max) NULL,
 CONSTRAINT [PK_RSSeriesActivityIDs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [date] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_RSSeriesSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpecialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesStreams]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesStreams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[StreamTitle] [nvarchar](256) NOT NULL,
	[StreamDescription] [nvarchar](max) NOT NULL,
	[StreamType] [nvarchar](100) NOT NULL,
	[StreamURL] [nvarchar](256) NOT NULL,
	[StartDateTime] [smalldatetime] NOT NULL,
	[EndDateTime] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesStreams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesStreamViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesStreamViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesStreamID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AutoAttendanceAwarded] [bit] NULL,
	[AutoAttendanceAwardedOn] [datetime] NULL,
 CONSTRAINT [PK_RSSeriesStreamViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[ItemCount] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[IsCompleted] [bit] NULL,
	[PaidOn] [datetime] NULL,
	[ConfirmationNumber] [nvarchar](150) NULL,
	[AmountPaid] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartID] [int] NOT NULL,
	[ItemType] [nvarchar](150) NOT NULL,
	[EventID] [int] NOT NULL,
	[PriceID] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Tier] [nvarchar](150) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartItemID] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Tier] [nvarchar](150) NOT NULL,
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ShoppingCartOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartPromoCodes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartPromoCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartID] [int] NOT NULL,
	[PromoCodeID] [int] NOT NULL,
	[CartItemID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ShoppingCartPromoCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingleSignOnTokens]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingleSignOnTokens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Token] [nvarchar](384) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUsed] [datetime] NULL,
	[IsUsed] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SingleSignOnTokens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testing]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[TestType] [nvarchar](50) NOT NULL,
	[PassingGrade] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[NumberOfAttempts] [int] NOT NULL,
	[Random] [bit] NULL,
	[Layout] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Testing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[Explanation] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[FileName] [nvarchar](256) NULL,
	[VideoName] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsAnswers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestionsAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[FileName] [nvarchar](128) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestionsFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsTypes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Types] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadedFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Folder] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UploadedFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadedImages]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[ImageLocation] [nvarchar](max) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Folder] [nvarchar](256) NOT NULL,
 CONSTRAINT [PrimaryKey_c90fb949-a994-485f-bc56-cdc1f1cbe435] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBoardIdentificationNumbers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBoardIdentificationNumbers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileID] [nvarchar](128) NOT NULL,
	[BoardID] [int] NOT NULL,
	[IdentificationNumber] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserBoardIdentificationNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserIDMapping]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIDMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldUserID] [nvarchar](256) NOT NULL,
	[NewUserID] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserIDMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserImportID] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserImportID] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[MiddleName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Profession] [nvarchar](256) NOT NULL,
	[Degree] [nvarchar](256) NOT NULL,
	[Specialty] [nvarchar](256) NOT NULL,
	[Phone] [nvarchar](256) NOT NULL,
	[PhoneExtension] [nvarchar](256) NOT NULL,
	[Fax] [nvarchar](256) NOT NULL,
	[SpecialNeeds] [nvarchar](256) NOT NULL,
	[Department] [nvarchar](256) NOT NULL,
	[NameTag] [nvarchar](256) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](256) NOT NULL,
	[State] [nvarchar](256) NOT NULL,
	[ProvinceRegion] [nvarchar](256) NOT NULL,
	[Country] [nvarchar](256) NOT NULL,
	[ZipCode] [nvarchar](256) NOT NULL,
	[PostalCode] [nvarchar](256) NOT NULL,
	[NationalProviderIdentifier] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImports]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_UserImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[TitleID] [int] NOT NULL,
	[FirstName] [nvarchar](60) NOT NULL,
	[MiddleName] [nvarchar](60) NOT NULL,
	[LastName] [nvarchar](60) NOT NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]) PERSISTED NOT NULL,
	[ProfessionID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
	[TraineeType] [nvarchar](128) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[SubSpecialtyID] [int] NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[PhoneExtension] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[SpecialNeeds] [nvarchar](256) NOT NULL,
	[Department] [nvarchar](128) NOT NULL,
	[NameTag] [nvarchar](128) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](256) NOT NULL,
	[State] [nvarchar](256) NOT NULL,
	[ProvinceRegion] [nvarchar](256) NOT NULL,
	[Country] [nvarchar](2) NOT NULL,
	[ZipCode] [nvarchar](25) NOT NULL,
	[PostalCode] [nvarchar](25) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastAccessedOn] [datetime] NULL,
	[EmailLastConfirmedOn] [smalldatetime] NULL,
	[ArchivedOn] [smalldatetime] NULL,
	[IsDeceased] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OSUID] [nvarchar](256) NULL,
	[NationalProviderIdentifier] [nvarchar](256) NOT NULL,
	[AnnualFacultyDisclosureOverrideEnabled] [bit] NOT NULL,
	[AnnualFacultyDisclosureOverrideUpdatedOn] [datetime] NULL,
	[AnnualFacultyDisclosureOverrideUpdatedBy] [nvarchar](128) NULL,
	[AnnualFacultyDisclosureAccess]  AS (CONVERT([bit],case when [AnnualFacultyDisclosureOverrideEnabled]=(1) OR [Email] like '%@stonybrookmedicine.edu' OR [Email] like '%@stonybrook.edu' then (1) else (0) end)) PERSISTED,
	[IsBoardCertifiedPhysician] [bit] NULL,
	[Birthdate] [smalldatetime] NULL,
	[ABIMDiplomatNumber] [nvarchar](256) NULL,
	[HasAttested] [bit] NULL,
	[ProfileUpdated] [datetime] NULL,
 CONSTRAINT [PK__UserProf__1788CCAC69A80EED] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTestQuestionAnswers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestQuestionAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTestQuestionID] [int] NOT NULL,
	[TestingQuestionsAnswersID] [int] NULL,
	[AnswerText] [nvarchar](max) NULL,
	[FreeTextAnswer] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserTestQuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTestQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTestID] [int] NOT NULL,
	[TestingQuestionsID] [int] NOT NULL,
	[QuestionType] [int] NOT NULL,
	[Rank] [int] NULL,
	[CorrectAnswerIDs] [nvarchar](max) NOT NULL,
	[CorrectAnswerText] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserTestQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTests]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestingID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[TestType] [nvarchar](100) NOT NULL,
	[PaymentType] [nvarchar](100) NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[SubmittedOn] [datetime] NULL,
	[SubmittedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
	[TestPassingGrade] [int] NOT NULL,
	[Grade] [int] NULL,
	[IsPassed] [bit] NULL,
 CONSTRAINT [PK_UserTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastACCMEIDs]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastACCMEIDs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastACCMEIDs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastBoards]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastMOCBoards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImportErrors]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WebcastCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImportRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[WebcastPanelID] [int] NOT NULL,
	[WebcastPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_WebcastEvaluationPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebcastEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_WebcastEvaluationSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastMOC]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastMOC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[PARsDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebcastMOC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastMOCCreditTypes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastMOCCreditTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[MOCCreditTypeID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastMOCCreditTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_WebcastOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPanels]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPanelSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPanelSpeakers](
	[WebcastSpeakerID] [int] NOT NULL,
	[WebcastPanelID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastPanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[WebcastSpeakerID] ASC,
	[WebcastPanelID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPrices]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastPrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastQuestions]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastRegistrationItems]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_WebcastRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsCanceled] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[FileAccessEnabled] [bit] NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_WebcastRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Webcasts]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webcasts](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[PublicRegistrationLinkText] [nvarchar](256) NULL,
	[PublicRegistrationLinkUrl] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[ZipURL] [nvarchar](300) NULL,
	[IsMOCEligible] [bit] NULL,
	[WebcastURL] [nvarchar](300) NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCNotes] [nvarchar](max) NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[RegisterForMIPS] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_Webcasts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistAVNeeds]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistAVNeeds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[Need] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistAVNeeds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistCVs]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistPresentationFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklists]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[PresenterConsentFormStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerConsentForms]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerConsentForms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[Status] [nchar](256) NOT NULL,
	[Type] [nchar](256) NOT NULL,
	[Signature] [nchar](256) NOT NULL,
	[SignatureDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerConsentForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_WebcastSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastSpecailties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastsViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastsViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastsViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastTest]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastTest](
	[ID] [int] NOT NULL,
	[WebcastID] [int] NOT NULL,
	[TestType] [nvarchar](256) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[PassingGrade] [float] NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFree] [bit] NULL,
	[IsOSUFree] [bit] NULL,
	[NumberOfTimesTaken] [int] NULL,
	[IsHospitalSubscriptionFree] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WebcastTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastViews]    Script Date: 9/23/2022 8:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUsers]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers] ON [dbo].[AspNetUsers]
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUsers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_1] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceCreditImports] ON [dbo].[ConferenceCreditImports]
(
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluationCompetencies]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluationCompetencies] ON [dbo].[ConferenceEvaluationCompetencies]
(
	[ConferenceEvaluationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluationProgramResults]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluationProgramResults] ON [dbo].[ConferenceEvaluationProgramResults]
(
	[ConferenceEvaluationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluations]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluations] ON [dbo].[ConferenceEvaluations]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluatonSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluatonSpeakers] ON [dbo].[ConferenceEvaluationSpeakers]
(
	[TopicID] ASC,
	[ConferenceEvaluationID] ASC,
	[ConferenceSpeakerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceFiles]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceFiles] ON [dbo].[ConferenceFiles]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceFiles_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceFiles_1] ON [dbo].[ConferenceFiles]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC,
	[Rank] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceJointProviders]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceJointProviders] ON [dbo].[ConferenceJointProviders]
(
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceNotes] ON [dbo].[ConferenceNotes]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptions]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptions] ON [dbo].[ConferenceOptions]
(
	[GroupID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptions_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptions_1] ON [dbo].[ConferenceOptions]
(
	[Rank] ASC,
	[GroupID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptionsGroups] ON [dbo].[ConferenceOptionsGroups]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC,
	[Rank] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptionsGroups_1] ON [dbo].[ConferenceOptionsGroups]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferencePrices]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferencePrices] ON [dbo].[ConferencePrices]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC,
	[Rank] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferencePrices_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferencePrices_1] ON [dbo].[ConferencePrices]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations] ON [dbo].[ConferenceRegistrations]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_1] ON [dbo].[ConferenceRegistrations]
(
	[UserID] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceRegistrations_2]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_2] ON [dbo].[ConferenceRegistrations]
(
	[PaymentMethod] ASC,
	[ConferenceID] ASC,
	[IsCanceled] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceRegistrations_3]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_3] ON [dbo].[ConferenceRegistrations]
(
	[IsCanceled] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conferences]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conferences] ON [dbo].[Conferences]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC,
	[EndDate] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conferences_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conferences_1] ON [dbo].[Conferences]
(
	[Status] ASC,
	[URL] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers_1] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceSpeakers_2]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers_2] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpeakerTopics]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakerTopics] ON [dbo].[ConferenceSpeakerTopics]
(
	[ConferenceSpeakerID] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpecailties]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpecailties] ON [dbo].[ConferenceSpecialties]
(
	[ConferenceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpecialties]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpecialties] ON [dbo].[ConferenceSpecialties]
(
	[SpecialtyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CreditNotifications]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_CreditNotifications] ON [dbo].[CreditNotifications]
(
	[EventID] ASC,
	[EventType] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DuplicateUserRunIgnoreRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_DuplicateUserRunIgnoreRecords] ON [dbo].[DuplicateUserRunIgnoreRecords]
(
	[UserID] ASC,
	[DuplicateUserID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DuplicateUserRunRecords]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_DuplicateUserRunRecords] ON [dbo].[DuplicateUserRunRecords]
(
	[DuplicateUserID] ASC,
	[UserID] ASC,
	[DuplicateUserRunID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmailPreferences]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailPreferences] ON [dbo].[EmailPreferences]
(
	[UserID] ASC,
	[EmailType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailQueueMessages]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailQueueMessages] ON [dbo].[EmailQueueMessages]
(
	[EmailQueueID] ASC,
	[IsSent] ASC,
	[IsDeleted] ASC,
	[SendDateTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialCreditImports] ON [dbo].[EnduringMaterialCreditImports]
(
	[EnduringMaterialID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialNotes] ON [dbo].[EnduringMaterialNotes]
(
	[EnduringMaterialID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialRegistrations] ON [dbo].[EnduringMaterialRegistrations]
(
	[EnduringMaterialID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialRegistrations_1] ON [dbo].[EnduringMaterialRegistrations]
(
	[EnduringMaterialID] ASC,
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterials]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterials] ON [dbo].[EnduringMaterials]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterials_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterials_1] ON [dbo].[EnduringMaterials]
(
	[IsDeleted] ASC,
	[URL] ASC,
	[Status] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSeries] ON [dbo].[EnduringMaterialSeries]
(
	[Name] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSeries_1] ON [dbo].[EnduringMaterialSeries]
(
	[URL] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSpeakers] ON [dbo].[EnduringMaterialSpeakers]
(
	[IsDeleted] ASC,
	[EnduringMaterialID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSpeakers_1] ON [dbo].[EnduringMaterialSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EventSupport]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EventSupport] ON [dbo].[EventSupport]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EventSupport_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_EventSupport_1] ON [dbo].[EventSupport]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacultyDisclosureCommercialInterests]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosureCommercialInterests] ON [dbo].[FacultyDisclosureCommercialInterests]
(
	[FacultyDisclosureID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacultyDisclosureRoles]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosureRoles] ON [dbo].[FacultyDisclosureRoles]
(
	[FacultyDisclosureID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FacultyDisclosures]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosures] ON [dbo].[FacultyDisclosures]
(
	[ID] ASC,
	[IsDeleted] ASC,
	[EventType] ASC,
	[EventID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FacultyDisclosures_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosures_1] ON [dbo].[FacultyDisclosures]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113] ON [dbo].[HospitalUsers]
(
	[HospitalID] ASC,
	[IsDeleted] ASC,
	[IsApproved] ASC
)
INCLUDE([CreatedOn],[RequestTimeStamp],[UserID]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6] ON [dbo].[HospitalUsers]
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries] ON [dbo].[RSSeries]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_1] ON [dbo].[RSSeries]
(
	[IsDeleted] ASC,
	[URL] ASC,
	[Status] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeries_2]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_2] ON [dbo].[RSSeries]
(
	[StartDate] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeries_3]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_3] ON [dbo].[RSSeries]
(
	[SeriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesCreditImports]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesCreditImports] ON [dbo].[RSSeriesCreditImports]
(
	[RSSeriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesNotes] ON [dbo].[RSSeriesNotes]
(
	[RSSeriesID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesRegistrations]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations] ON [dbo].[RSSeriesRegistrations]
(
	[RSSeriesID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesRegistrations_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations_1] ON [dbo].[RSSeriesRegistrations]
(
	[RSSeriesID] ASC,
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesRegistrations_2]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations_2] ON [dbo].[RSSeriesRegistrations]
(
	[UserID] ASC,
	[IsDeleted] ASC,
	[CreditHours] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeries]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeries] ON [dbo].[RSSeriesSeries]
(
	[Name] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeries_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeries_1] ON [dbo].[RSSeriesSeries]
(
	[URL] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeriesAdmins] ON [dbo].[RSSeriesSeriesAdmins]
(
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeriesAdmins_1] ON [dbo].[RSSeriesSeriesAdmins]
(
	[SeriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSpeakers]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSpeakers] ON [dbo].[RSSeriesSpeakers]
(
	[IsDeleted] ASC,
	[RSSeriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSpeakers_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSpeakers_1] ON [dbo].[RSSeriesSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SingleSignOnTokens]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_SingleSignOnTokens] ON [dbo].[SingleSignOnTokens]
(
	[Token] ASC,
	[IsDeleted] ASC,
	[IsUsed] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserNotes]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNotes] ON [dbo].[UserNotes]
(
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC,
	[UserID] ASC
)
WHERE ([IsDeleted]=(0))
WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProfiles_1]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_1] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_2]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_2] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[IsDeleted] ASC,
	[OSUID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_4]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_4] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[NationalProviderIdentifier] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_5]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_5] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[FirstName] ASC,
	[LastName] ASC,
	[IsDeleted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A]    Script Date: 9/23/2022 8:48:17 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC,
	[LastName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ConferenceCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImportErrors_ConferenceCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[ConferenceCreditImports] ([ID])
GO
ALTER TABLE [dbo].[ConferenceCreditImportErrors] CHECK CONSTRAINT [FK_ConferenceCreditImportErrors_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[ConferenceCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImportRecords_ConferenceCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[ConferenceCreditImports] ([ID])
GO
ALTER TABLE [dbo].[ConferenceCreditImportRecords] CHECK CONSTRAINT [FK_ConferenceCreditImportRecords_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[ConferenceCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceCreditImports] CHECK CONSTRAINT [FK_ConferenceCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluationCompetencies_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationCompetencies] CHECK CONSTRAINT [FK_ConferenceEvaluationCompetencies_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] CHECK CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferencePanels] FOREIGN KEY([ConferencePanelID])
REFERENCES [dbo].[ConferencePanels] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] CHECK CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferenceEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluationProgramResults_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationProgramResults] CHECK CONSTRAINT [FK_ConferenceEvaluationProgramResults_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceEvaluations] CHECK CONSTRAINT [FK_ConferenceEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] CHECK CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] CHECK CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceNotes]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceNotes] CHECK CONSTRAINT [FK_ConferenceNotes_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceNotes]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceNotes] CHECK CONSTRAINT [FK_ConferenceNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[ConferenceOptions]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ConferenceOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[ConferenceOptions] CHECK CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePanelSpeakers_ConferencePanels] FOREIGN KEY([ConferencePanelID])
REFERENCES [dbo].[ConferencePanels] ([ID])
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] CHECK CONSTRAINT [FK_ConferencePanelSpeakers_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePanelSpeakers_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] CHECK CONSTRAINT [FK_ConferencePanelSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ConferenceOptions] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferencePrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[ConferencePrices] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferencePrices]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceRegistrations] FOREIGN KEY([ConferenceRegistrationID])
REFERENCES [dbo].[ConferenceRegistrations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceRegistrations]
GO
ALTER TABLE [dbo].[ConferenceRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrations_PaymentMethods] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([Method])
GO
ALTER TABLE [dbo].[ConferenceRegistrations] CHECK CONSTRAINT [FK_ConferenceRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[ConferenceRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceRegistrations] CHECK CONSTRAINT [FK_ConferenceRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[Conferences]  WITH NOCHECK ADD  CONSTRAINT [FK_Conferences_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [FK_Conferences_EventProvidership]
GO
ALTER TABLE [dbo].[Conferences]  WITH NOCHECK ADD  CONSTRAINT [FK_Conferences_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [FK_Conferences_EventStatus]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistAVNeeds_ConferenceSpeakerChecklists] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistAVNeeds_ConferenceSpeakerChecklists]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistCVs_ConferenceSpeakerChecklist] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistCVs] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistCVs_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistPresentationFiles_ConferenceSpeakerChecklist] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistPresentationFiles_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklist_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklists] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklist_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpeakers]  WITH NOCHECK ADD  CONSTRAINT [FK_ConferenceSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceSpeakers] NOCHECK CONSTRAINT [FK_ConferenceSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerTopics_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerTopics] CHECK CONSTRAINT [FK_ConferenceSpeakerTopics_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpecailties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpecialties] CHECK CONSTRAINT [FK_ConferenceSpecailties_Specialties]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_Conferences]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams] FOREIGN KEY([ConferenceStreamID])
REFERENCES [dbo].[ConferenceStreams] ([ID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceWaitlist]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceWaitlist_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceWaitlist] CHECK CONSTRAINT [FK_ConferenceWaitlist_UserProfiles]
GO
ALTER TABLE [dbo].[CreditNotifications]  WITH CHECK ADD  CONSTRAINT [FK_CreditNotifications_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[CreditNotifications] CHECK CONSTRAINT [FK_CreditNotifications_EventTypes]
GO
ALTER TABLE [dbo].[DuplicateUserRunIgnoreRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunIgnoreRecords_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunIgnoreRecords] CHECK CONSTRAINT [FK_DuplicateUserRunIgnoreRecords_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_DuplicateUserRuns] FOREIGN KEY([DuplicateUserRunID])
REFERENCES [dbo].[DuplicateUserRuns] ([ID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_DuplicateUserRuns]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles1] FOREIGN KEY([DuplicateUserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles1]
GO
ALTER TABLE [dbo].[DuplicateUserRuns]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRuns_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRuns] CHECK CONSTRAINT [FK_DuplicateUserRuns_UserProfiles]
GO
ALTER TABLE [dbo].[EmailHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmailHistory_EmailTypes] FOREIGN KEY([EmailType])
REFERENCES [dbo].[EmailTypes] ([Type])
GO
ALTER TABLE [dbo].[EmailHistory] CHECK CONSTRAINT [FK_EmailHistory_EmailTypes]
GO
ALTER TABLE [dbo].[EmailPreferences]  WITH CHECK ADD  CONSTRAINT [FK_EmailPreferences_EmailFrequencies] FOREIGN KEY([EmailFrequency])
REFERENCES [dbo].[EmailFrequencies] ([Frequency])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmailPreferences] CHECK CONSTRAINT [FK_EmailPreferences_EmailFrequencies]
GO
ALTER TABLE [dbo].[EmailPreferences]  WITH CHECK ADD  CONSTRAINT [FK_EmailPreferences_EmailTypes] FOREIGN KEY([EmailType])
REFERENCES [dbo].[EmailTypes] ([Type])
GO
ALTER TABLE [dbo].[EmailPreferences] CHECK CONSTRAINT [FK_EmailPreferences_EmailTypes]
GO
ALTER TABLE [dbo].[EmailQueueMessages]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueueMessages_EmailQueues] FOREIGN KEY([EmailQueueID])
REFERENCES [dbo].[EmailQueues] ([ID])
GO
ALTER TABLE [dbo].[EmailQueueMessages] CHECK CONSTRAINT [FK_EmailQueueMessages_EmailQueues]
GO
ALTER TABLE [dbo].[EmailQueueMessages]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueueMessages_UserProfiles] FOREIGN KEY([SendToUserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EmailQueueMessages] CHECK CONSTRAINT [FK_EmailQueueMessages_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialBoards]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialBoards_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialBoards] CHECK CONSTRAINT [FK_EnduringMaterialBoards_Boards]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImportErrors_EnduringMaterialCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[EnduringMaterialCreditImports] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportErrors] CHECK CONSTRAINT [FK_EnduringMaterialCreditImportErrors_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImportRecords_EnduringMaterialCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[EnduringMaterialCreditImports] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportRecords] CHECK CONSTRAINT [FK_EnduringMaterialCreditImportRecords_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] CHECK CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] CHECK CONSTRAINT [FK_EnduringMaterialCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluationCompetencies_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationCompetencies] CHECK CONSTRAINT [FK_EnduringMaterialEvaluationCompetencies_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialPanels] FOREIGN KEY([EnduringMaterialPanelID])
REFERENCES [dbo].[EnduringMaterialPanels] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluationProgramResults_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationProgramResults] CHECK CONSTRAINT [FK_EnduringMaterialEvaluationProgramResults_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] CHECK CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] CHECK CONSTRAINT [FK_EnduringMaterialEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialFiles]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialFiles] CHECK CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialJointProviders_EnduringMaterialJointProviders] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialJointProviders] CHECK CONSTRAINT [FK_EnduringMaterialJointProviders_EnduringMaterialJointProviders]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[EnduringMaterialOptions]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialOptions_EnduringMaterialOptionsGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[EnduringMaterialOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialOptions] CHECK CONSTRAINT [FK_EnduringMaterialOptions_EnduringMaterialOptionsGroups]
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
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanelSpeakers_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialPanelSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanelSpeakers_WebcastPanels] FOREIGN KEY([EnduringMaterialPanelID])
REFERENCES [dbo].[EnduringMaterialPanels] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[EnduringMaterialOptions] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialOptions]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialPrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[EnduringMaterialPrices] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialPrices]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialRegistrations] FOREIGN KEY([EnduringMaterialRegistrationID])
REFERENCES [dbo].[EnduringMaterialRegistrations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialRegistrations]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] CHECK CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] CHECK CONSTRAINT [FK_EnduringMaterialRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries] FOREIGN KEY([EnduringMaterialSeriesID])
REFERENCES [dbo].[EnduringMaterialSeries] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EventProvidership]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EventStatus]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklistCVs_EnduringMaterialSpeakerChecklist] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklistCVs_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklistPresentationFiles_EnduringMaterialSpeakerChecklist] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklistPresentationFiles_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakerChecklists] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakerChecklists]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] CHECK CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpecialties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] CHECK CONSTRAINT [FK_EnduringMaterialSpecialties_Specialties]
GO
ALTER TABLE [dbo].[EnduringMaterialViews]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialViews] CHECK CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials]
GO
ALTER TABLE [dbo].[EventAdvertisers]  WITH CHECK ADD  CONSTRAINT [FK_EventDisplays_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[EventAdvertisers] CHECK CONSTRAINT [FK_EventDisplays_EventTypes]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeDegreeRestriction_Degrees] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degrees] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] CHECK CONSTRAINT [FK_EventPromoCodeDegreeRestriction_Degrees]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeDegreeRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] CHECK CONSTRAINT [FK_EventPromoCodeDegreeRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeEmailRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeEmailRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeEmailRestriction] CHECK CONSTRAINT [FK_EventPromoCodeEmailRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeProfessionRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] CHECK CONSTRAINT [FK_EventPromoCodeProfessionRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeProfessionRestriction_Professions] FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] CHECK CONSTRAINT [FK_EventPromoCodeProfessionRestriction_Professions]
GO
ALTER TABLE [dbo].[FacultyDisclosureCommercialInterests]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosureCommercialInterests_FacultyDisclosures] FOREIGN KEY([FacultyDisclosureID])
REFERENCES [dbo].[FacultyDisclosures] ([ID])
GO
ALTER TABLE [dbo].[FacultyDisclosureCommercialInterests] CHECK CONSTRAINT [FK_FacultyDisclosureCommercialInterests_FacultyDisclosures]
GO
ALTER TABLE [dbo].[FacultyDisclosureRoles]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosureRoles_FacultyDisclosures] FOREIGN KEY([FacultyDisclosureID])
REFERENCES [dbo].[FacultyDisclosures] ([ID])
GO
ALTER TABLE [dbo].[FacultyDisclosureRoles] CHECK CONSTRAINT [FK_FacultyDisclosureRoles_FacultyDisclosures]
GO
ALTER TABLE [dbo].[FacultyDisclosures]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosures_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[FacultyDisclosures] CHECK CONSTRAINT [FK_FacultyDisclosures_EventTypes]
GO
ALTER TABLE [dbo].[FacultyDisclosures]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosures_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[FacultyDisclosures] CHECK CONSTRAINT [FK_FacultyDisclosures_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalAdmins]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAdmins_Hospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HospitalAdmins] CHECK CONSTRAINT [FK_HospitalAdmins_Hospitals]
GO
ALTER TABLE [dbo].[HospitalAdmins]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAdmins_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[HospitalAdmins] CHECK CONSTRAINT [FK_HospitalAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocuments] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] CHECK CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocuments]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocumentsHospitals] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[HospitalDocuments] ([ID])
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] CHECK CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocumentsHospitals]
GO
ALTER TABLE [dbo].[HospitalGroupHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalGroupHospitals_HospitalGroupHospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] CHECK CONSTRAINT [FK_HospitalGroupHospitals_HospitalGroupHospitals]
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
ALTER TABLE [dbo].[LoginLog]  WITH CHECK ADD  CONSTRAINT [FK_LoginLog_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[LoginLog] CHECK CONSTRAINT [FK_LoginLog_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_EventProvidership]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_EventStatus]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImportErrors_RSSeriesCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[RSSeriesCreditImports] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImportErrors] CHECK CONSTRAINT [FK_RSSeriesCreditImportErrors_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImportRecords_RSSeriesCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[RSSeriesCreditImports] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImportRecords] CHECK CONSTRAINT [FK_RSSeriesCreditImportRecords_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImports_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] CHECK CONSTRAINT [FK_RSSeriesCreditImports_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] CHECK CONSTRAINT [FK_RSSeriesCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluationCompetencies_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationCompetencies] CHECK CONSTRAINT [FK_RSSeriesEvaluationCompetencies_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] CHECK CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesPanels] FOREIGN KEY([RSSeriesPanelID])
REFERENCES [dbo].[RSSeriesPanels] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] CHECK CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluationProgramResults_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationProgramResults] CHECK CONSTRAINT [FK_RSSeriesEvaluationProgramResults_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] CHECK CONSTRAINT [FK_RSSeriesEvaluations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] CHECK CONSTRAINT [FK_RSSeriesEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] CHECK CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] CHECK CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesFiles]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesFiles_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesFiles] CHECK CONSTRAINT [FK_RSSeriesFiles_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesJointProviders_RSSeriesJointProviders] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesJointProviders] CHECK CONSTRAINT [FK_RSSeriesJointProviders_RSSeriesJointProviders]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanels_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanels] CHECK CONSTRAINT [FK_RSSeriesPanels_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesPanels] FOREIGN KEY([RSSeriesPanelID])
REFERENCES [dbo].[RSSeriesPanels] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] CHECK CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] CHECK CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesRegistrations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] CHECK CONSTRAINT [FK_RSSeriesRegistrations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] CHECK CONSTRAINT [FK_RSSeriesRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] CHECK CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesAdmins_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] CHECK CONSTRAINT [FK_RSSeriesSeriesAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries] FOREIGN KEY([RSSeriesSeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo] CHECK CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklistCVs_RSSeriesSpeakerChecklist] FOREIGN KEY([RSSeriesSpeakerChecklistID])
REFERENCES [dbo].[RSSeriesSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistCVs] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklistCVs_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklistPresentationFiles_RSSeriesSpeakerChecklist] FOREIGN KEY([RSSeriesSpeakerChecklistID])
REFERENCES [dbo].[RSSeriesSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklistPresentationFiles_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakers_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] CHECK CONSTRAINT [FK_RSSeriesSpeakers_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] CHECK CONSTRAINT [FK_RSSeriesSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] CHECK CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] CHECK CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpecialties_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] CHECK CONSTRAINT [FK_RSSeriesSpecialties_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpecialties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] CHECK CONSTRAINT [FK_RSSeriesSpecialties_Specialties]
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
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_RSSeriesStreams] FOREIGN KEY([RSSeriesStreamID])
REFERENCES [dbo].[RSSeriesStreams] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_RSSeriesStreams]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesViews_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesViews] CHECK CONSTRAINT [FK_RSSeriesViews_RSSeries]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_UserProfiles]
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItems_ShoppingCart] FOREIGN KEY([ShoppingCartID])
REFERENCES [dbo].[ShoppingCart] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartItems] CHECK CONSTRAINT [FK_ShoppingCartItems_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCartOptions]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartOptions_ShoppingCartItems] FOREIGN KEY([CartItemID])
REFERENCES [dbo].[ShoppingCartItems] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartOptions] CHECK CONSTRAINT [FK_ShoppingCartOptions_ShoppingCartItems]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_EventPromoCode] FOREIGN KEY([PromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_EventPromoCode]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCart] FOREIGN KEY([ShoppingCartID])
REFERENCES [dbo].[ShoppingCart] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCartItems] FOREIGN KEY([CartItemID])
REFERENCES [dbo].[ShoppingCartItems] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCartItems]
GO
ALTER TABLE [dbo].[SingleSignOnTokens]  WITH CHECK ADD  CONSTRAINT [FK_SingleSignOnTokens_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[SingleSignOnTokens] CHECK CONSTRAINT [FK_SingleSignOnTokens_UserProfiles]
GO
ALTER TABLE [dbo].[TestingQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestions_Testing] FOREIGN KEY([TestID])
REFERENCES [dbo].[Testing] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestions] CHECK CONSTRAINT [FK_TestingQuestions_Testing]
GO
ALTER TABLE [dbo].[TestingQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestions_TestingQuestionsTypes] FOREIGN KEY([QuestionTypeID])
REFERENCES [dbo].[TestingQuestionsTypes] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestions] CHECK CONSTRAINT [FK_TestingQuestions_TestingQuestionsTypes]
GO
ALTER TABLE [dbo].[TestingQuestionsAnswers]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestionsAnswers_TestingQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestionsAnswers] CHECK CONSTRAINT [FK_TestingQuestionsAnswers_TestingQuestions]
GO
ALTER TABLE [dbo].[TestingQuestionsFiles]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestionsFiles_TestingQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestionsFiles] CHECK CONSTRAINT [FK_TestingQuestionsFiles_TestingQuestions]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers]  WITH CHECK ADD  CONSTRAINT [FK_UserBoardIdentificationNumbers_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] CHECK CONSTRAINT [FK_UserBoardIdentificationNumbers_Boards]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers]  WITH CHECK ADD  CONSTRAINT [FK_UserBoardIdentificationNumbers_UserBoardIdentificationNumbers] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] CHECK CONSTRAINT [FK_UserBoardIdentificationNumbers_UserBoardIdentificationNumbers]
GO
ALTER TABLE [dbo].[UserImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_UserImportErrors_UserImports] FOREIGN KEY([UserImportID])
REFERENCES [dbo].[UserImports] ([ID])
GO
ALTER TABLE [dbo].[UserImportErrors] CHECK CONSTRAINT [FK_UserImportErrors_UserImports]
GO
ALTER TABLE [dbo].[UserImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_UserImportRecords_UserImports] FOREIGN KEY([UserImportID])
REFERENCES [dbo].[UserImports] ([ID])
GO
ALTER TABLE [dbo].[UserImportRecords] CHECK CONSTRAINT [FK_UserImportRecords_UserImports]
GO
ALTER TABLE [dbo].[UserImports]  WITH CHECK ADD  CONSTRAINT [FK_UserImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserImports] CHECK CONSTRAINT [FK_UserImports_UserProfiles]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles2] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles2]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserProfiles_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfiles] NOCHECK CONSTRAINT [FK_UserProfiles_AspNetUsers]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Degrees] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degrees] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Degrees]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Professions] FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Professions]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Specialties]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_SubSpecialties] FOREIGN KEY([SubSpecialtyID])
REFERENCES [dbo].[SubSpecialties] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_SubSpecialties]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Titles] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Titles] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Titles]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestionAnswers_TestingQuestionsAnswers] FOREIGN KEY([TestingQuestionsAnswersID])
REFERENCES [dbo].[TestingQuestionsAnswers] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] CHECK CONSTRAINT [FK_UserTestQuestionAnswers_TestingQuestionsAnswers]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestionAnswers_UserTestQuestions] FOREIGN KEY([UserTestQuestionID])
REFERENCES [dbo].[UserTestQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] CHECK CONSTRAINT [FK_UserTestQuestionAnswers_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_TestingQuestions] FOREIGN KEY([TestingQuestionsID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_TestingQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_UserTestQuestions] FOREIGN KEY([ID])
REFERENCES [dbo].[UserTestQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_UserTests] FOREIGN KEY([UserTestID])
REFERENCES [dbo].[UserTests] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_UserTests]
GO
ALTER TABLE [dbo].[UserTests]  WITH CHECK ADD  CONSTRAINT [FK_UserTests_Testing] FOREIGN KEY([TestingID])
REFERENCES [dbo].[Testing] ([ID])
GO
ALTER TABLE [dbo].[UserTests] CHECK CONSTRAINT [FK_UserTests_Testing]
GO
ALTER TABLE [dbo].[UserTests]  WITH CHECK ADD  CONSTRAINT [FK_UserTests_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserTests] CHECK CONSTRAINT [FK_UserTests_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastBoards]  WITH CHECK ADD  CONSTRAINT [FK_WebcastBoards_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[WebcastBoards] CHECK CONSTRAINT [FK_WebcastBoards_Boards]
GO
ALTER TABLE [dbo].[WebcastBoards]  WITH CHECK ADD  CONSTRAINT [FK_WebcastBoards_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastBoards] CHECK CONSTRAINT [FK_WebcastBoards_Webcasts]
GO
ALTER TABLE [dbo].[WebcastCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImportErrors_WebcastCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[WebcastCreditImports] ([ID])
GO
ALTER TABLE [dbo].[WebcastCreditImportErrors] CHECK CONSTRAINT [FK_WebcastCreditImportErrors_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImportRecords_WebcastCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[WebcastCreditImports] ([ID])
GO
ALTER TABLE [dbo].[WebcastCreditImportRecords] CHECK CONSTRAINT [FK_WebcastCreditImportRecords_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastCreditImports] CHECK CONSTRAINT [FK_WebcastCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationCompetencies_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationCompetencies] CHECK CONSTRAINT [FK_WebcastEvaluationCompetencies_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationPanels_WebcastEvaluationPanels] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] CHECK CONSTRAINT [FK_WebcastEvaluationPanels_WebcastEvaluationPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationPanels_WebcastPanels] FOREIGN KEY([WebcastPanelID])
REFERENCES [dbo].[WebcastPanels] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] CHECK CONSTRAINT [FK_WebcastEvaluationPanels_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationProgramResults_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationProgramResults] CHECK CONSTRAINT [FK_WebcastEvaluationProgramResults_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastEvaluations] CHECK CONSTRAINT [FK_WebcastEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers1] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers1]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluatonSpeakers_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluatonSpeakers_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastMOCCreditTypes_MOCCreditTypes1] FOREIGN KEY([MOCCreditTypeID])
REFERENCES [dbo].[MOCCreditTypes] ([ID])
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] CHECK CONSTRAINT [FK_WebcastMOCCreditTypes_MOCCreditTypes1]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] CHECK CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts]
GO
ALTER TABLE [dbo].[WebcastNotes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastNotes] CHECK CONSTRAINT [FK_WebcastNotes_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastNotes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastNotes] CHECK CONSTRAINT [FK_WebcastNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[WebcastOptions]  WITH CHECK ADD  CONSTRAINT [FK_WebcastOptions_WebcastOptionsGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[WebcastOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[WebcastOptions] CHECK CONSTRAINT [FK_WebcastOptions_WebcastOptionsGroup]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastPanelSpeakers_WebcastPanels] FOREIGN KEY([WebcastPanelID])
REFERENCES [dbo].[WebcastPanels] ([ID])
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] CHECK CONSTRAINT [FK_WebcastPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastPanelSpeakers_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] CHECK CONSTRAINT [FK_WebcastPanelSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastQuestions]  WITH CHECK ADD  CONSTRAINT [FK_WebcastQuestions_WebcastTest] FOREIGN KEY([TestID])
REFERENCES [dbo].[WebcastTest] ([ID])
GO
ALTER TABLE [dbo].[WebcastQuestions] CHECK CONSTRAINT [FK_WebcastQuestions_WebcastTest]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[WebcastOptions] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastOptions]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastPrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[WebcastPrices] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastPrices]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastRegistrations] FOREIGN KEY([WebcastRegistrationID])
REFERENCES [dbo].[WebcastRegistrations] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastRegistrations]
GO
ALTER TABLE [dbo].[WebcastRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrations_PaymentMethods] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([Method])
GO
ALTER TABLE [dbo].[WebcastRegistrations] CHECK CONSTRAINT [FK_WebcastRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[WebcastRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastRegistrations] CHECK CONSTRAINT [FK_WebcastRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[Webcasts]  WITH NOCHECK ADD  CONSTRAINT [FK_Webcasts_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Webcasts] CHECK CONSTRAINT [FK_Webcasts_EventProvidership]
GO
ALTER TABLE [dbo].[Webcasts]  WITH NOCHECK ADD  CONSTRAINT [FK_Webcasts_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Webcasts] CHECK CONSTRAINT [FK_Webcasts_EventStatus]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistAVNeeds]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistAVNeeds_WebcastSpeakerChecklists] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistAVNeeds] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistAVNeeds_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistCVs_WebcastSpeakerChecklist] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistCVs] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistCVs_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistPresentationFiles_WebcastSpeakerChecklist] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistPresentationFiles_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklist_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklists] CHECK CONSTRAINT [FK_WebcastSpeakerChecklist_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakerChecklists] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers] FOREIGN KEY([ID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakers]  WITH NOCHECK ADD  CONSTRAINT [FK_WebcastSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastSpeakers] NOCHECK CONSTRAINT [FK_WebcastSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerTopics_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerTopics] CHECK CONSTRAINT [FK_WebcastSpeakerTopics_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpecailties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpecialties] CHECK CONSTRAINT [FK_WebcastSpecailties_Specialties]
GO
ALTER TABLE [dbo].[WebcastsViews]  WITH CHECK ADD  CONSTRAINT [FK_WebcastsViews_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastsViews] CHECK CONSTRAINT [FK_WebcastsViews_Webcasts]
GO
ALTER TABLE [dbo].[WebcastsViews]  WITH CHECK ADD  CONSTRAINT [FK_WebcastsViews_WebcastsViews] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastsViews] CHECK CONSTRAINT [FK_WebcastsViews_WebcastsViews]
GO

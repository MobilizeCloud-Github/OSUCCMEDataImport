﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OldOSUDatabase.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OldOSUCCMEEntities : DbContext
    {
        public OldOSUCCMEEntities()
            : base("name=OldOSUCCMEEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ActivityType> ActivityType { get; set; }
        public virtual DbSet<Answers> Answers { get; set; }
        public virtual DbSet<aspnet_Applications> aspnet_Applications { get; set; }
        public virtual DbSet<aspnet_Membership> aspnet_Membership { get; set; }
        public virtual DbSet<aspnet_Paths> aspnet_Paths { get; set; }
        public virtual DbSet<aspnet_PersonalizationAllUsers> aspnet_PersonalizationAllUsers { get; set; }
        public virtual DbSet<aspnet_PersonalizationPerUser> aspnet_PersonalizationPerUser { get; set; }
        public virtual DbSet<aspnet_Profile> aspnet_Profile { get; set; }
        public virtual DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public virtual DbSet<aspnet_SchemaVersions> aspnet_SchemaVersions { get; set; }
        public virtual DbSet<aspnet_Users> aspnet_Users { get; set; }
        public virtual DbSet<aspnet_WebEvent_Events> aspnet_WebEvent_Events { get; set; }
        public virtual DbSet<CMSPages> CMSPages { get; set; }
        public virtual DbSet<CommercialSupporters> CommercialSupporters { get; set; }
        public virtual DbSet<ConferenceAdditionalRegistrationAnswers> ConferenceAdditionalRegistrationAnswers { get; set; }
        public virtual DbSet<ConferenceAdminCategories> ConferenceAdminCategories { get; set; }
        public virtual DbSet<ConferenceExtraGroups> ConferenceExtraGroups { get; set; }
        public virtual DbSet<ConferenceExtras> ConferenceExtras { get; set; }
        public virtual DbSet<ConferenceFiles> ConferenceFiles { get; set; }
        public virtual DbSet<ConferencePrices> ConferencePrices { get; set; }
        public virtual DbSet<ConferencePromoCodeDegrees> ConferencePromoCodeDegrees { get; set; }
        public virtual DbSet<ConferencePromoCodeProfessions> ConferencePromoCodeProfessions { get; set; }
        public virtual DbSet<ConferencePromoCodeRestrictedEmails> ConferencePromoCodeRestrictedEmails { get; set; }
        public virtual DbSet<ConferencePromoCodes> ConferencePromoCodes { get; set; }
        public virtual DbSet<ConferenceRegistrations> ConferenceRegistrations { get; set; }
        public virtual DbSet<Conferences> Conferences { get; set; }
        public virtual DbSet<ConferenceSearchCategories> ConferenceSearchCategories { get; set; }
        public virtual DbSet<ConferenceShoppingCarts> ConferenceShoppingCarts { get; set; }
        public virtual DbSet<ConferenceStreams> ConferenceStreams { get; set; }
        public virtual DbSet<ConferenceStreamViews> ConferenceStreamViews { get; set; }
        public virtual DbSet<ConferenceWaitlists> ConferenceWaitlists { get; set; }
        public virtual DbSet<ContactRequests> ContactRequests { get; set; }
        public virtual DbSet<CreditLog> CreditLog { get; set; }
        public virtual DbSet<CreditNotifications> CreditNotifications { get; set; }
        public virtual DbSet<Criteria> Criteria { get; set; }
        public virtual DbSet<CriteriaElements> CriteriaElements { get; set; }
        public virtual DbSet<DisclosureForms> DisclosureForms { get; set; }
        public virtual DbSet<Displays> Displays { get; set; }
        public virtual DbSet<ELMAH_Error> ELMAH_Error { get; set; }
        public virtual DbSet<EmailFrequencies> EmailFrequencies { get; set; }
        public virtual DbSet<EmailLastSent> EmailLastSent { get; set; }
        public virtual DbSet<EmailPreferences> EmailPreferences { get; set; }
        public virtual DbSet<EmailQueue> EmailQueue { get; set; }
        public virtual DbSet<EmailQueueParameters> EmailQueueParameters { get; set; }
        public virtual DbSet<EmailQueueType> EmailQueueType { get; set; }
        public virtual DbSet<EmailTemplates> EmailTemplates { get; set; }
        public virtual DbSet<EnduringMaterialAdminCategories> EnduringMaterialAdminCategories { get; set; }
        public virtual DbSet<EnduringMaterialFiles> EnduringMaterialFiles { get; set; }
        public virtual DbSet<EnduringMaterialRegistrations> EnduringMaterialRegistrations { get; set; }
        public virtual DbSet<EnduringMaterials> EnduringMaterials { get; set; }
        public virtual DbSet<EnduringMaterialSeries> EnduringMaterialSeries { get; set; }
        public virtual DbSet<EnduringMaterialsSearchCategories> EnduringMaterialsSearchCategories { get; set; }
        public virtual DbSet<EnduringPromoCodeProfessions> EnduringPromoCodeProfessions { get; set; }
        public virtual DbSet<EnduringPromoCodeRestrictedEmails> EnduringPromoCodeRestrictedEmails { get; set; }
        public virtual DbSet<EnduringPromoCodes> EnduringPromoCodes { get; set; }
        public virtual DbSet<EnduringShoppingCarts> EnduringShoppingCarts { get; set; }
        public virtual DbSet<ErrorLogs> ErrorLogs { get; set; }
        public virtual DbSet<Eval> Eval { get; set; }
        public virtual DbSet<EvalGroup> EvalGroup { get; set; }
        public virtual DbSet<EvalQuestion> EvalQuestion { get; set; }
        public virtual DbSet<EvalQuestionOptions> EvalQuestionOptions { get; set; }
        public virtual DbSet<Evaluations> Evaluations { get; set; }
        public virtual DbSet<EvaluationsBackup> EvaluationsBackup { get; set; }
        public virtual DbSet<EventCategories> EventCategories { get; set; }
        public virtual DbSet<EventCriteria> EventCriteria { get; set; }
        public virtual DbSet<EventEval> EventEval { get; set; }
        public virtual DbSet<EventTitles> EventTitles { get; set; }
        public virtual DbSet<EventTypes> EventTypes { get; set; }
        public virtual DbSet<Expenses> Expenses { get; set; }
        public virtual DbSet<HospitalAdminCategories> HospitalAdminCategories { get; set; }
        public virtual DbSet<HospitalMOCUsers> HospitalMOCUsers { get; set; }
        public virtual DbSet<Hospitals> Hospitals { get; set; }
        public virtual DbSet<HospitalSurveyAnswers> HospitalSurveyAnswers { get; set; }
        public virtual DbSet<HospitalSurveyQuestions> HospitalSurveyQuestions { get; set; }
        public virtual DbSet<HospitalUsers> HospitalUsers { get; set; }
        public virtual DbSet<InKind> InKind { get; set; }
        public virtual DbSet<LearningFromTeachings> LearningFromTeachings { get; set; }
        public virtual DbSet<MaterialUsage> MaterialUsage { get; set; }
        public virtual DbSet<MOCBoards> MOCBoards { get; set; }
        public virtual DbSet<NewletterBatchLastSent> NewletterBatchLastSent { get; set; }
        public virtual DbSet<NewsletterBatch> NewsletterBatch { get; set; }
        public virtual DbSet<NewsletterHistory> NewsletterHistory { get; set; }
        public virtual DbSet<Newsletters> Newsletters { get; set; }
        public virtual DbSet<ObjectivesTestQuestions> ObjectivesTestQuestions { get; set; }
        public virtual DbSet<PaymentHistory> PaymentHistory { get; set; }
        public virtual DbSet<PlanningCommittee> PlanningCommittee { get; set; }
        public virtual DbSet<PodcastFiles> PodcastFiles { get; set; }
        public virtual DbSet<PodcastRegistrations> PodcastRegistrations { get; set; }
        public virtual DbSet<Podcasts> Podcasts { get; set; }
        public virtual DbSet<PodcastsSearchCategories> PodcastsSearchCategories { get; set; }
        public virtual DbSet<PointOfCares> PointOfCares { get; set; }
        public virtual DbSet<Professions> Professions { get; set; }
        public virtual DbSet<ProgramPopularity> ProgramPopularity { get; set; }
        public virtual DbSet<Questions> Questions { get; set; }
        public virtual DbSet<Revenues> Revenues { get; set; }
        public virtual DbSet<RSSeries> RSSeries { get; set; }
        public virtual DbSet<RSSeriesAdminNotifications> RSSeriesAdminNotifications { get; set; }
        public virtual DbSet<RSSeriesAdminTitles> RSSeriesAdminTitles { get; set; }
        public virtual DbSet<RSSeriesCriteria> RSSeriesCriteria { get; set; }
        public virtual DbSet<RSSeriesFiles> RSSeriesFiles { get; set; }
        public virtual DbSet<RSSeriesRegistrations> RSSeriesRegistrations { get; set; }
        public virtual DbSet<RSSeriesSearchCategories> RSSeriesSearchCategories { get; set; }
        public virtual DbSet<RSSeriesTitles> RSSeriesTitles { get; set; }
        public virtual DbSet<SpeakerDisclosures> SpeakerDisclosures { get; set; }
        public virtual DbSet<Speakers> Speakers { get; set; }
        public virtual DbSet<Specialties> Specialties { get; set; }
        public virtual DbSet<SpecMap> SpecMap { get; set; }
        public virtual DbSet<Survey> Survey { get; set; }
        public virtual DbSet<SurveyQuestions> SurveyQuestions { get; set; }
        public virtual DbSet<SurveyResult> SurveyResult { get; set; }
        public virtual DbSet<SurveyResultAnswers> SurveyResultAnswers { get; set; }
        public virtual DbSet<SurveyTargetedRoles> SurveyTargetedRoles { get; set; }
        public virtual DbSet<Testing> Testing { get; set; }
        public virtual DbSet<TestingPackages> TestingPackages { get; set; }
        public virtual DbSet<TestingQuestionAnswers> TestingQuestionAnswers { get; set; }
        public virtual DbSet<UnaffiliatedUsers> UnaffiliatedUsers { get; set; }
        public virtual DbSet<UserCredits> UserCredits { get; set; }
        public virtual DbSet<UserCreditsDuplicates> UserCreditsDuplicates { get; set; }
        public virtual DbSet<UserDegrees> UserDegrees { get; set; }
        public virtual DbSet<UserEval> UserEval { get; set; }
        public virtual DbSet<UserEvalAnswer> UserEvalAnswer { get; set; }
        public virtual DbSet<UserIDMap> UserIDMap { get; set; }
        public virtual DbSet<UserPrefixes> UserPrefixes { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UsersTest> UsersTest { get; set; }
        public virtual DbSet<UserTestingCredit> UserTestingCredit { get; set; }
        public virtual DbSet<WebcastAdminCategories> WebcastAdminCategories { get; set; }
        public virtual DbSet<WebcastEmails> WebcastEmails { get; set; }
        public virtual DbSet<WebcastFiles> WebcastFiles { get; set; }
        public virtual DbSet<WebcastLinks> WebcastLinks { get; set; }
        public virtual DbSet<WebcastMOCBoards> WebcastMOCBoards { get; set; }
        public virtual DbSet<WebcastPollAnswers> WebcastPollAnswers { get; set; }
        public virtual DbSet<WebcastPolls> WebcastPolls { get; set; }
        public virtual DbSet<WebcastPromoCodeProfessions> WebcastPromoCodeProfessions { get; set; }
        public virtual DbSet<WebcastPromoCodeRestrictedEmails> WebcastPromoCodeRestrictedEmails { get; set; }
        public virtual DbSet<WebcastPromoCodes> WebcastPromoCodes { get; set; }
        public virtual DbSet<WebcastRegistrations> WebcastRegistrations { get; set; }
        public virtual DbSet<Webcasts> Webcasts { get; set; }
        public virtual DbSet<WebcastsACCMEIDs> WebcastsACCMEIDs { get; set; }
        public virtual DbSet<WebcastSearchCategories> WebcastSearchCategories { get; set; }
        public virtual DbSet<WebcastShoppingCarts> WebcastShoppingCarts { get; set; }
        public virtual DbSet<ConferenceRegistrationDuplicates> ConferenceRegistrationDuplicates { get; set; }
        public virtual DbSet<EnduringMaterialRegistrationDuplicates> EnduringMaterialRegistrationDuplicates { get; set; }
        public virtual DbSet<PodcastRegistrationDuplicates> PodcastRegistrationDuplicates { get; set; }
        public virtual DbSet<RSSeriesRegistrationDuplicates> RSSeriesRegistrationDuplicates { get; set; }
        public virtual DbSet<WebCastRegistrationDuplicates> WebCastRegistrationDuplicates { get; set; }
    }
}

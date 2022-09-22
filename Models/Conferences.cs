//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OSUCCMEDataImport.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Conferences
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Conferences()
        {
            this.ConferenceStreams = new HashSet<ConferenceStreams>();
            this.ConferenceStreamViews = new HashSet<ConferenceStreamViews>();
        }
    
        public int ID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string AdditionalInfo { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public string ContactName { get; set; }
        public string ContactDepartment { get; set; }
        public string ContactPhone { get; set; }
        public string ContactEmail { get; set; }
        public string Location { get; set; }
        public string LocationAddress1 { get; set; }
        public string LocationAddress2 { get; set; }
        public string LocationCity { get; set; }
        public string LocationState { get; set; }
        public string LocationZip { get; set; }
        public string ExtrasOverview { get; set; }
        public Nullable<float> Credits { get; set; }
        public Nullable<int> AvailableRegistrations { get; set; }
        public Nullable<int> MaxRegistrations { get; set; }
        public string RegistrationNoticeEmail { get; set; }
        public Nullable<bool> ActivityGoalsChangeCompetence { get; set; }
        public Nullable<bool> ActivityGoalsChangePerformance { get; set; }
        public Nullable<bool> ActivityGoalsChangePatientOutcomes { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatingUserID { get; set; }
        public Nullable<bool> Accredited { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<bool> ToChangeCompetence { get; set; }
        public Nullable<bool> ToChangePerformance { get; set; }
        public Nullable<bool> ToChangePatientOutcomes { get; set; }
        public Nullable<bool> IsCancelled { get; set; }
        public string Objective { get; set; }
        public Nullable<bool> IsFacultyDevelopment { get; set; }
        public Nullable<bool> isJointSponsor { get; set; }
        public string JointSponsor { get; set; }
        public Nullable<bool> PublicViewable { get; set; }
        public Nullable<bool> OSUAffiliated { get; set; }
        public Nullable<bool> PublicRegistration { get; set; }
        public bool SendCreditNotifications { get; set; }
        public Nullable<bool> WaitListEnabled { get; set; }
        public Nullable<bool> ABMSPatientCareAndProceduralSkills { get; set; }
        public Nullable<bool> ABMSMedicalKnowledge { get; set; }
        public Nullable<bool> ABMSPracticeBasedLearningAndImprovement { get; set; }
        public Nullable<bool> ABMSInterpersonalAndCommunicationSkills { get; set; }
        public Nullable<bool> ABMSProfessionalism { get; set; }
        public Nullable<bool> ABMSSystemsBasedPractice { get; set; }
        public Nullable<bool> IOMProvidePatientCenteredCare { get; set; }
        public Nullable<bool> IOMWorkInInterdisciplinaryTeams { get; set; }
        public Nullable<bool> IOMEmployEvidenceBasedPractice { get; set; }
        public Nullable<bool> IOMApplyQualityImprovement { get; set; }
        public Nullable<bool> IOMUtilizeInformatics { get; set; }
        public Nullable<bool> IECValuesEthicsForInterprofessionalPractice { get; set; }
        public Nullable<bool> IECRolesResponsibilities { get; set; }
        public Nullable<bool> IECInterprofessionalCommunication { get; set; }
        public Nullable<bool> IECTeamsAndTeamwork { get; set; }
        public Nullable<bool> OCCompetenciesOtherThanThoseListedWereAddressed { get; set; }
        public string AdditionalRegistrationQuestion { get; set; }
        public Nullable<bool> IsClone { get; set; }
        public Nullable<int> ClonedFromID { get; set; }
        public Nullable<bool> CriteriaNotApplicable { get; set; }
        public string ConferenceType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceStreams> ConferenceStreams { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceStreamViews> ConferenceStreamViews { get; set; }
    }
}

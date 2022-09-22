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
    
    public partial class Webcasts
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Webcasts()
        {
            this.WebcastBoards = new HashSet<WebcastBoards>();
            this.WebcastMOCCreditTypes = new HashSet<WebcastMOCCreditTypes>();
            this.WebcastSpeakerConsentForms = new HashSet<WebcastSpeakerConsentForms>();
            this.WebcastsViews = new HashSet<WebcastsViews>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string Description { get; set; }
        public string Objectives { get; set; }
        public string Providership { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public Nullable<decimal> Credits { get; set; }
        public bool IsAccredited { get; set; }
        public string Status { get; set; }
        public string ContactName { get; set; }
        public string ContactDepartment { get; set; }
        public string ContactEmail { get; set; }
        public string ContactPhone { get; set; }
        public bool PublicRegistrationEnabled { get; set; }
        public string RegistrationNoticeEmails { get; set; }
        public string AdditionalInformation { get; set; }
        public bool SendCreditNotifications { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
        public bool IsDeleted { get; set; }
        public bool ABMSPatientCareAndProceduralSkills { get; set; }
        public bool ABMSMedicalKnowledge { get; set; }
        public bool ABMSPracticeBasedLearningAndImprovement { get; set; }
        public bool ABMSInterpersonalAndCommunicationSkills { get; set; }
        public bool ABMSProfessionalism { get; set; }
        public bool ABMSSystemsBasedPractice { get; set; }
        public bool IOMProvidePatientCenteredCare { get; set; }
        public bool IOMWorkInInterdisciplinaryTeams { get; set; }
        public bool IOMEmployEvidenceBasedPractice { get; set; }
        public bool IOMApplyQualityImprovement { get; set; }
        public bool IOMUtilizeInformatics { get; set; }
        public bool IECValueEthicsForInterprofessionalPractice { get; set; }
        public bool IECRolesResponsibilities { get; set; }
        public bool IECInterprofessionalCommunication { get; set; }
        public bool IECTeamsAndTeamwork { get; set; }
        public bool OCCompetenciesOtherThanThoseListedWereAddressed { get; set; }
        public Nullable<bool> ExternalRegistrationButtonEnabled { get; set; }
        public string PublicRegistrationLinkText { get; set; }
        public string PublicRegistrationLinkUrl { get; set; }
        public string Author { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string ZipURL { get; set; }
        public Nullable<bool> IsMOCEligible { get; set; }
        public string WebcastURL { get; set; }
        public Nullable<decimal> MOCPoints { get; set; }
        public string MOCNotes { get; set; }
        public string ACCMEActivityID { get; set; }
        public string MOCReviewers { get; set; }
        public Nullable<bool> RegisterForMIPS { get; set; }
        public Nullable<bool> LearnerCompetence { get; set; }
        public Nullable<bool> LearnerCompetenceObjective { get; set; }
        public Nullable<bool> LearnerCompetenceSubjective { get; set; }
        public Nullable<bool> LearnerPerformance { get; set; }
        public Nullable<bool> LearnerPerformanceObjective { get; set; }
        public Nullable<bool> LearnerPerformanceSubjective { get; set; }
        public Nullable<bool> PatientHealth { get; set; }
        public Nullable<bool> PatientHealthObjective { get; set; }
        public Nullable<bool> PatientHealthSubjective { get; set; }
        public Nullable<bool> CommunityPopulationHealth { get; set; }
        public Nullable<bool> CommunityPopulationHealthObjective { get; set; }
        public Nullable<bool> CommunityPopulationHealthSubjective { get; set; }
    
        public virtual EventProvidership EventProvidership { get; set; }
        public virtual EventStatus EventStatus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastBoards> WebcastBoards { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastMOCCreditTypes> WebcastMOCCreditTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastSpeakerConsentForms> WebcastSpeakerConsentForms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastsViews> WebcastsViews { get; set; }
    }
}
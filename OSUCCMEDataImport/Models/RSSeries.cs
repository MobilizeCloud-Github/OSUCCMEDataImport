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
    
    public partial class RSSeries
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RSSeries()
        {
            this.RSSeriesCreditImports = new HashSet<RSSeriesCreditImports>();
            this.RSSeriesEvaluations = new HashSet<RSSeriesEvaluations>();
            this.RSSeriesFiles = new HashSet<RSSeriesFiles>();
            this.RSSeriesJointProviders = new HashSet<RSSeriesJointProviders>();
            this.RSSeriesNotes = new HashSet<RSSeriesNotes>();
            this.RSSeriesPanels = new HashSet<RSSeriesPanels>();
            this.RSSeriesRegistrations = new HashSet<RSSeriesRegistrations>();
            this.RSSeriesSpeakerChecklists = new HashSet<RSSeriesSpeakerChecklists>();
            this.RSSeriesSpeakers = new HashSet<RSSeriesSpeakers>();
            this.RSSeriesSpeakerTopics = new HashSet<RSSeriesSpeakerTopics>();
            this.RSSeriesSpecialties = new HashSet<RSSeriesSpecialties>();
            this.RSSeriesStreams = new HashSet<RSSeriesStreams>();
            this.RSSeriesStreamViews = new HashSet<RSSeriesStreamViews>();
            this.RSSeriesViews = new HashSet<RSSeriesViews>();
        }
    
        public int ID { get; set; }
        public int SeriesID { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string Description { get; set; }
        public string Objectives { get; set; }
        public bool IsFacultyDevelopment { get; set; }
        public string Providership { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public Nullable<decimal> Credits { get; set; }
        public bool IsAccredited { get; set; }
        public bool LocationKnown { get; set; }
        public string LocationName { get; set; }
        public string LocationAddressLine1 { get; set; }
        public string LocationAddressLine2 { get; set; }
        public string LocationCity { get; set; }
        public string LocationState { get; set; }
        public string LocationZipCode { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public string Status { get; set; }
        public string ContactName { get; set; }
        public string ContactDepartment { get; set; }
        public string ContactEmail { get; set; }
        public string ContactPhone { get; set; }
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
        public string RSSeriesType { get; set; }
        public Nullable<bool> IsMOCEligible { get; set; }
        public Nullable<decimal> MOCPoints { get; set; }
        public Nullable<bool> ShowContactInformation { get; set; }
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
        public virtual RSSeriesSeries RSSeriesSeries { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesCreditImports> RSSeriesCreditImports { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesEvaluations> RSSeriesEvaluations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesFiles> RSSeriesFiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesJointProviders> RSSeriesJointProviders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesNotes> RSSeriesNotes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesPanels> RSSeriesPanels { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesRegistrations> RSSeriesRegistrations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesSpeakerChecklists> RSSeriesSpeakerChecklists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesSpeakers> RSSeriesSpeakers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesSpeakerTopics> RSSeriesSpeakerTopics { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesSpecialties> RSSeriesSpecialties { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesStreams> RSSeriesStreams { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesStreamViews> RSSeriesStreamViews { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RSSeriesViews> RSSeriesViews { get; set; }
    }
}
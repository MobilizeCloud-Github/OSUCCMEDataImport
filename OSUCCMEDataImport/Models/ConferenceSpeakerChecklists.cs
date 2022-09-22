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
    
    public partial class ConferenceSpeakerChecklists
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ConferenceSpeakerChecklists()
        {
            this.ConferenceSpeakerChecklistAVNeeds = new HashSet<ConferenceSpeakerChecklistAVNeeds>();
            this.ConferenceSpeakerChecklistCVs = new HashSet<ConferenceSpeakerChecklistCVs>();
            this.ConferenceSpeakerChecklistPresentationFiles = new HashSet<ConferenceSpeakerChecklistPresentationFiles>();
        }
    
        public int ID { get; set; }
        public string Type { get; set; }
        public int ConferenceID { get; set; }
        public int ConferenceSpeakerID { get; set; }
        public string ObjectivesStatus { get; set; }
        public string ObjectivesValue { get; set; }
        public string ReferencesStatus { get; set; }
        public string ReferencesValue { get; set; }
        public string CVStatus { get; set; }
        public string PresentationFilesStatus { get; set; }
        public string AVNeedsStatus { get; set; }
        public bool ReceiveEvaluationSummary { get; set; }
        public bool IsCompleted { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceSpeakerChecklistAVNeeds> ConferenceSpeakerChecklistAVNeeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceSpeakerChecklistCVs> ConferenceSpeakerChecklistCVs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceSpeakerChecklistPresentationFiles> ConferenceSpeakerChecklistPresentationFiles { get; set; }
        public virtual ConferenceSpeakers ConferenceSpeakers { get; set; }
    }
}
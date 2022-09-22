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
    
    public partial class WebcastSpeakers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WebcastSpeakers()
        {
            this.WebcastEvaluationSpeakers = new HashSet<WebcastEvaluationSpeakers>();
            this.WebcastSpeakerChecklists = new HashSet<WebcastSpeakerChecklists>();
            this.WebcastSpeakerConsentForms = new HashSet<WebcastSpeakerConsentForms>();
            this.WebcastSpeakerTopics = new HashSet<WebcastSpeakerTopics>();
            this.WebcastPanels = new HashSet<WebcastPanels>();
        }
    
        public int ID { get; set; }
        public int WebcastID { get; set; }
        public string UserID { get; set; }
        public Nullable<decimal> SpeakerHours { get; set; }
        public Nullable<System.DateTime> SpeakerHoursAssignedOn { get; set; }
        public string SpeakerHoursAssignedBy { get; set; }
        public Nullable<System.DateTime> SpeakerHoursLastUpdatedOn { get; set; }
        public string SpeakerHoursLastUpdatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
        public bool IsDeleted { get; set; }
        public Nullable<System.DateTime> FacultyDisclosureLastSent { get; set; }
        public bool FacultyDisclosureOnFile { get; set; }
        public Nullable<int> FacultyDisclosureID { get; set; }
        public Nullable<System.DateTime> SpeakerCheckListLastSent { get; set; }
        public bool SpeakerCheckListOnFile { get; set; }
        public Nullable<int> SpeakercheckListID { get; set; }
    
        public virtual UserProfiles UserProfiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastEvaluationSpeakers> WebcastEvaluationSpeakers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastSpeakerChecklists> WebcastSpeakerChecklists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastSpeakerConsentForms> WebcastSpeakerConsentForms { get; set; }
        public virtual WebcastSpeakers WebcastSpeakers1 { get; set; }
        public virtual WebcastSpeakers WebcastSpeakers2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastSpeakerTopics> WebcastSpeakerTopics { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastPanels> WebcastPanels { get; set; }
    }
}
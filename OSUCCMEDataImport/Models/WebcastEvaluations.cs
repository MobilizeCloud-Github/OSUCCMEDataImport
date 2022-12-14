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
    
    public partial class WebcastEvaluations
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WebcastEvaluations()
        {
            this.WebcastEvaluationCompetencies = new HashSet<WebcastEvaluationCompetencies>();
            this.WebcastEvaluationPanels = new HashSet<WebcastEvaluationPanels>();
            this.WebcastEvaluationProgramResults = new HashSet<WebcastEvaluationProgramResults>();
            this.WebcastEvaluationSpeakers = new HashSet<WebcastEvaluationSpeakers>();
        }
    
        public int ID { get; set; }
        public string UserID { get; set; }
        public int WebcastID { get; set; }
        public string ReferralSource { get; set; }
        public bool WillYouMakeChanges { get; set; }
        public string WillYouMakeChangesComments { get; set; }
        public string AdditionalComments { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public bool IsDeleted { get; set; }
        public string ReferralSourceOther { get; set; }
    
        public virtual UserProfiles UserProfiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastEvaluationCompetencies> WebcastEvaluationCompetencies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastEvaluationPanels> WebcastEvaluationPanels { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastEvaluationProgramResults> WebcastEvaluationProgramResults { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastEvaluationSpeakers> WebcastEvaluationSpeakers { get; set; }
    }
}

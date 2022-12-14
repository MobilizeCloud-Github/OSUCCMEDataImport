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
    
    public partial class EnduringMaterialEvaluations
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnduringMaterialEvaluations()
        {
            this.EnduringMaterialEvaluationCompetencies = new HashSet<EnduringMaterialEvaluationCompetencies>();
            this.EnduringMaterialEvaluationPanels = new HashSet<EnduringMaterialEvaluationPanels>();
            this.EnduringMaterialEvaluationProgramResults = new HashSet<EnduringMaterialEvaluationProgramResults>();
            this.EnduringMaterialEvaluationSpeakers = new HashSet<EnduringMaterialEvaluationSpeakers>();
        }
    
        public int ID { get; set; }
        public string UserID { get; set; }
        public int EnduringMaterialID { get; set; }
        public string ReferralSource { get; set; }
        public bool WillYouMakeChanges { get; set; }
        public string WillYouMakeChangesComments { get; set; }
        public string AdditionalComments { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public bool IsDeleted { get; set; }
        public string ReferralSourceOther { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialEvaluationCompetencies> EnduringMaterialEvaluationCompetencies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialEvaluationPanels> EnduringMaterialEvaluationPanels { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialEvaluationProgramResults> EnduringMaterialEvaluationProgramResults { get; set; }
        public virtual EnduringMaterials EnduringMaterials { get; set; }
        public virtual UserProfiles UserProfiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialEvaluationSpeakers> EnduringMaterialEvaluationSpeakers { get; set; }
    }
}

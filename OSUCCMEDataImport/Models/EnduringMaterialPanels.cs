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
    
    public partial class EnduringMaterialPanels
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnduringMaterialPanels()
        {
            this.EnduringMaterialEvaluationPanels = new HashSet<EnduringMaterialEvaluationPanels>();
            this.EnduringMaterialSpeakers = new HashSet<EnduringMaterialSpeakers>();
        }
    
        public int ID { get; set; }
        public int EnduringMaterialID { get; set; }
        public string PanelName { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
        public bool IsDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialEvaluationPanels> EnduringMaterialEvaluationPanels { get; set; }
        public virtual EnduringMaterials EnduringMaterials { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnduringMaterialSpeakers> EnduringMaterialSpeakers { get; set; }
    }
}

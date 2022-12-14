//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class SurveyQuestions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SurveyQuestions()
        {
            this.SurveyResultAnswers = new HashSet<SurveyResultAnswers>();
        }
    
        public int ID { get; set; }
        public Nullable<int> SurveyID { get; set; }
        public string Question { get; set; }
        public string Comment { get; set; }
        public Nullable<int> ControlType { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
        public string ListControlOptions { get; set; }
        public string tempGuid { get; set; }
    
        public virtual Survey Survey { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SurveyResultAnswers> SurveyResultAnswers { get; set; }
    }
}

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
    
    public partial class TestingQuestions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TestingQuestions()
        {
            this.TestingQuestionsAnswers = new HashSet<TestingQuestionsAnswers>();
            this.TestingQuestionsFiles = new HashSet<TestingQuestionsFiles>();
            this.UserTestQuestions = new HashSet<UserTestQuestions>();
        }
    
        public int ID { get; set; }
        public int TestID { get; set; }
        public int Rank { get; set; }
        public int QuestionTypeID { get; set; }
        public string QuestionText { get; set; }
        public string Explanation { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
        public string FileName { get; set; }
        public string VideoName { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Testing Testing { get; set; }
        public virtual TestingQuestionsTypes TestingQuestionsTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TestingQuestionsAnswers> TestingQuestionsAnswers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TestingQuestionsFiles> TestingQuestionsFiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserTestQuestions> UserTestQuestions { get; set; }
    }
}

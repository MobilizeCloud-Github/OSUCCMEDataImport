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
    
    public partial class UserTestQuestions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserTestQuestions()
        {
            this.UserTestQuestionAnswers = new HashSet<UserTestQuestionAnswers>();
        }
    
        public int ID { get; set; }
        public int UserTestID { get; set; }
        public int TestingQuestionsID { get; set; }
        public int QuestionType { get; set; }
        public Nullable<int> Rank { get; set; }
        public string CorrectAnswerIDs { get; set; }
        public string CorrectAnswerText { get; set; }
        public Nullable<bool> IsCorrect { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
    
        public virtual TestingQuestions TestingQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserTestQuestionAnswers> UserTestQuestionAnswers { get; set; }
        public virtual UserTestQuestions UserTestQuestions1 { get; set; }
        public virtual UserTestQuestions UserTestQuestions2 { get; set; }
        public virtual UserTests UserTests { get; set; }
    }
}
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
    
    public partial class EvalQuestion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EvalQuestion()
        {
            this.EvalQuestionOptions = new HashSet<EvalQuestionOptions>();
            this.UserEvalAnswer = new HashSet<UserEvalAnswer>();
        }
    
        public int ID { get; set; }
        public Nullable<int> EvalID { get; set; }
        public Nullable<int> GroupID { get; set; }
        public string Question { get; set; }
        public string InputType { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
        public Nullable<bool> showCommentsField { get; set; }
        public Nullable<bool> isDeleted { get; set; }
    
        public virtual Eval Eval { get; set; }
        public virtual EvalGroup EvalGroup { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EvalQuestionOptions> EvalQuestionOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserEvalAnswer> UserEvalAnswer { get; set; }
    }
}
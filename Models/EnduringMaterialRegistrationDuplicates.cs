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
    
    public partial class EnduringMaterialRegistrationDuplicates
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public Nullable<int> EnduringID { get; set; }
        public Nullable<bool> IsPaid { get; set; }
        public string PaymentType { get; set; }
        public Nullable<System.DateTime> RegisteredOn { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public string PaymentAmount { get; set; }
        public string Confirmation { get; set; }
        public Nullable<bool> EvaluationSent { get; set; }
        public Nullable<bool> IsCancelled { get; set; }
    }
}

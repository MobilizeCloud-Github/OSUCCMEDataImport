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
    
    public partial class UserCreditsDuplicates
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public Nullable<int> EventID { get; set; }
        public string EventType { get; set; }
        public Nullable<double> CreditHours { get; set; }
        public Nullable<System.DateTime> AssignedOn { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
        public string AssignedBy { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<bool> IsSpeaker { get; set; }
        public Nullable<bool> PassedTest { get; set; }
    }
}

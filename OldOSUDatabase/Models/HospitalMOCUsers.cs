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
    
    public partial class HospitalMOCUsers
    {
        public int ID { get; set; }
        public int HospitalID { get; set; }
        public int WebcastID { get; set; }
        public string UserID { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public bool CreditEarned { get; set; }
        public Nullable<System.DateTime> CreditEarnedOn { get; set; }
        public bool IsDeleted { get; set; }
    }
}

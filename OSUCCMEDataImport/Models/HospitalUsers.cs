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
    
    public partial class HospitalUsers
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public int HospitalID { get; set; }
        public bool IsDeleted { get; set; }
        public Nullable<bool> IsApproved { get; set; }
        public Nullable<System.DateTime> RequestTimeStamp { get; set; }
        public Nullable<System.DateTime> ReviewedTimeStamp { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
    
        public virtual Hospitals Hospitals { get; set; }
    }
}

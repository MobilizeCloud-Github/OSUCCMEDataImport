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
    
    public partial class EventPromoCodeDegreeRestriction
    {
        public int ID { get; set; }
        public int EventPromoCodeID { get; set; }
        public int DegreeID { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual Degrees Degrees { get; set; }
        public virtual EventPromoCode EventPromoCode { get; set; }
    }
}

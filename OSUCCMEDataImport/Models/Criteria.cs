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
    
    public partial class Criteria
    {
        public int ID { get; set; }
        public int EventID { get; set; }
        public string EventType { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> LastUpdateOn { get; set; }
        public string LastUpdetedBy { get; set; }
        public Nullable<bool> CriteriaIsCompleted { get; set; }
    }
}

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
    
    public partial class ProgramPopularity
    {
        public int ID { get; set; }
        public Nullable<int> WebcastID { get; set; }
        public Nullable<bool> Viewed { get; set; }
        public Nullable<decimal> Credits { get; set; }
        public string Country { get; set; }
        public string UserID { get; set; }
    }
}

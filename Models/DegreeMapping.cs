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
    
    public partial class DegreeMapping
    {
        public int ID { get; set; }
        public Nullable<int> OldID { get; set; }
        public string OldDegreeName { get; set; }
        public Nullable<int> NewID { get; set; }
        public string NewDegreeName { get; set; }
    }
}
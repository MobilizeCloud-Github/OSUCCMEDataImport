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
    
    public partial class TestingPackages
    {
        public int ID { get; set; }
        public string PackageName { get; set; }
        public string EventType { get; set; }
        public Nullable<int> TestAttempts { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<bool> isDeleted { get; set; }
    }
}

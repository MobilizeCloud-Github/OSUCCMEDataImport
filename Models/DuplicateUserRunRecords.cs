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
    
    public partial class DuplicateUserRunRecords
    {
        public int ID { get; set; }
        public int DuplicateUserRunID { get; set; }
        public string UserID { get; set; }
        public string DuplicateUserID { get; set; }
        public bool OSUIDMatch { get; set; }
        public bool NationalProviderIdentifierMatch { get; set; }
        public bool NameMatch { get; set; }
    
        public virtual DuplicateUserRuns DuplicateUserRuns { get; set; }
        public virtual UserProfiles UserProfiles { get; set; }
        public virtual UserProfiles UserProfiles1 { get; set; }
    }
}

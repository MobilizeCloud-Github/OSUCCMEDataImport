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
    
    public partial class ConferenceWaitlistSettings
    {
        public int ID { get; set; }
        public int ConferenceID { get; set; }
        public bool WaitlistEnabled { get; set; }
        public Nullable<int> MaxNumberRegistered { get; set; }
        public string WaitlistNoticeEmails { get; set; }
    }
}

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
    
    public partial class Hospitals
    {
        public int ID { get; set; }
        public string HospitalName { get; set; }
        public Nullable<bool> Access_Live { get; set; }
        public Nullable<bool> Access_VOD { get; set; }
        public Nullable<bool> Access_WebcastDownload { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<bool> IsUpdated { get; set; }
        public Nullable<bool> AutoApprove { get; set; }
        public string EmailMustContain { get; set; }
        public Nullable<bool> SendPendingApprovalNotifications { get; set; }
        public string MasterContactEmail { get; set; }
        public Nullable<bool> Access_EnduringMaterials { get; set; }
        public Nullable<bool> Access_Podcasts { get; set; }
        public Nullable<bool> SendCreditNotifications { get; set; }
    }
}
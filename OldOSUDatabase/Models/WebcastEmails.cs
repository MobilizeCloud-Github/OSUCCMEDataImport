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
    
    public partial class WebcastEmails
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public Nullable<int> eventID { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string Comments { get; set; }
        public Nullable<System.DateTime> DateSubmitted { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
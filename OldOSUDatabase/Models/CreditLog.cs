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
    
    public partial class CreditLog
    {
        public int ID { get; set; }
        public int CreditID { get; set; }
        public string EventType { get; set; }
        public string ActionType { get; set; }
        public string UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    }
}
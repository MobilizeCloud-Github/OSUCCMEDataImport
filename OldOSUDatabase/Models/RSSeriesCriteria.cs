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
    
    public partial class RSSeriesCriteria
    {
        public int ID { get; set; }
        public int CriteriaID { get; set; }
        public int EventTitleID { get; set; }
        public bool IsDeleted { get; set; }
        public string Notes { get; set; }
        public int Year { get; set; }
    
        public virtual Criteria Criteria { get; set; }
    }
}

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
    
    public partial class CMSPages
    {
        public int ID { get; set; }
        public string PageName { get; set; }
        public string DisplayName { get; set; }
        public string LinkName { get; set; }
        public string PageContent { get; set; }
        public string Keywords { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
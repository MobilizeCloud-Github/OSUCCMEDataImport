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
    
    public partial class MaterialUsage
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> ActivityDate { get; set; }
        public string Presenter { get; set; }
        public string PresentatioinTitle { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<System.DateTime> SumbitDate { get; set; }
        public string UserID { get; set; }
        public Nullable<bool> Grants { get; set; }
        public string GrantsName { get; set; }
        public Nullable<bool> Consultant { get; set; }
        public string ConsultantName { get; set; }
        public Nullable<bool> Advisory { get; set; }
        public string AdvisoryName { get; set; }
        public Nullable<bool> Stockholder { get; set; }
        public string StockholderName { get; set; }
        public Nullable<bool> Honararium { get; set; }
        public string HonarariumName { get; set; }
        public Nullable<bool> Editorial { get; set; }
        public string EditorialName { get; set; }
        public Nullable<bool> Other { get; set; }
        public string OtherName { get; set; }
        public Nullable<bool> OffLabel { get; set; }
        public string ActivityTitle { get; set; }
    }
}

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
    
    public partial class ConferenceRegistrationItems
    {
        public int ID { get; set; }
        public int ConferenceRegistrationID { get; set; }
        public string Type { get; set; }
        public Nullable<int> PriceID { get; set; }
        public Nullable<int> OptionID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
    
        public virtual ConferenceOptions ConferenceOptions { get; set; }
        public virtual ConferencePrices ConferencePrices { get; set; }
        public virtual ConferenceRegistrations ConferenceRegistrations { get; set; }
    }
}

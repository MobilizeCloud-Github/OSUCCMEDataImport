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
    
    public partial class DisclosureForms
    {
        public int ID { get; set; }
        public int SpeakerUserID { get; set; }
        public Nullable<int> RSSeriesID { get; set; }
        public string SignedDate { get; set; }
        public Nullable<bool> AnnualForm { get; set; }
        public Nullable<int> AnnualFormFiscalYear { get; set; }
        public Nullable<bool> GrantsSupport { get; set; }
        public string GrantsSupportName { get; set; }
        public Nullable<bool> ConsultantBureau { get; set; }
        public string ConsultantBureauName { get; set; }
        public Nullable<bool> AdvisoryBoardMembership { get; set; }
        public string AdvisoryBoardName { get; set; }
        public Nullable<bool> Stockholder { get; set; }
        public string StockholderName { get; set; }
        public Nullable<bool> HonorariumRecipient { get; set; }
        public string HonorariumRecipientName { get; set; }
        public Nullable<bool> EditorialBoardInvolvement { get; set; }
        public string EditorialBoardInvolvementName { get; set; }
        public Nullable<bool> OtherFinancialMaterial { get; set; }
        public string OtherFinancialMaterialName { get; set; }
        public Nullable<bool> OffLabelUsage { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}

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
    
    public partial class EnduringMaterialCreditImportRecords
    {
        public int ID { get; set; }
        public int CreditImportID { get; set; }
        public string UserID { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CreditHours { get; set; }
    
        public virtual EnduringMaterialCreditImports EnduringMaterialCreditImports { get; set; }
    }
}

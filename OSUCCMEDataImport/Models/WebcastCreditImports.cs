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
    
    public partial class WebcastCreditImports
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WebcastCreditImports()
        {
            this.WebcastCreditImportErrors = new HashSet<WebcastCreditImportErrors>();
            this.WebcastCreditImportRecords = new HashSet<WebcastCreditImportRecords>();
        }
    
        public int ID { get; set; }
        public int WebcastID { get; set; }
        public string FileLocation { get; set; }
        public string UserID { get; set; }
        public bool CreditNotificationsEnabled { get; set; }
        public System.DateTime TimeStamp { get; set; }
    
        public virtual UserProfiles UserProfiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastCreditImportErrors> WebcastCreditImportErrors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WebcastCreditImportRecords> WebcastCreditImportRecords { get; set; }
    }
}

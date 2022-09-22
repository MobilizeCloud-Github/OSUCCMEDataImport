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
    
    public partial class Degrees
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Degrees()
        {
            this.EventPromoCodeDegreeRestriction = new HashSet<EventPromoCodeDegreeRestriction>();
            this.UserProfiles = new HashSet<UserProfiles>();
        }
    
        public int ID { get; set; }
        public string Degree { get; set; }
        public bool IsEditable { get; set; }
        public bool CountsAsPhysician { get; set; }
        public Nullable<int> OldID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EventPromoCodeDegreeRestriction> EventPromoCodeDegreeRestriction { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserProfiles> UserProfiles { get; set; }
    }
}
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
    
    public partial class FacultyDisclosures
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FacultyDisclosures()
        {
            this.FacultyDisclosureCommercialInterests = new HashSet<FacultyDisclosureCommercialInterests>();
            this.FacultyDisclosureRoles = new HashSet<FacultyDisclosureRoles>();
        }
    
        public int ID { get; set; }
        public string Type { get; set; }
        public string EventType { get; set; }
        public Nullable<int> EventID { get; set; }
        public string UserID { get; set; }
        public bool Disclosure { get; set; }
        public string ResolutionOfConflictPresentersAuthors { get; set; }
        public string ResolutionOfConflictPlannersActivityDirectors { get; set; }
        public string NonConflictedCoDirector { get; set; }
        public string FullName { get; set; }
        public System.DateTime Expires { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public string LastUpdatedBy { get; set; }
    
        public virtual EventTypes EventTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacultyDisclosureCommercialInterests> FacultyDisclosureCommercialInterests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacultyDisclosureRoles> FacultyDisclosureRoles { get; set; }
        public virtual UserProfiles UserProfiles { get; set; }
    }
}

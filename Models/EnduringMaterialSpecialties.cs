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
    
    public partial class EnduringMaterialSpecialties
    {
        public int ID { get; set; }
        public int EnduringMaterialID { get; set; }
        public int SpecialtyID { get; set; }
    
        public virtual EnduringMaterials EnduringMaterials { get; set; }
        public virtual Specialties Specialties { get; set; }
    }
}

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
    
    public partial class UserBoardIdentificationNumbers
    {
        public int ID { get; set; }
        public string UserProfileID { get; set; }
        public int BoardID { get; set; }
        public string IdentificationNumber { get; set; }
    
        public virtual Boards Boards { get; set; }
        public virtual UserProfiles UserProfiles { get; set; }
    }
}

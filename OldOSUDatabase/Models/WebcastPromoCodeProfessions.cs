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
    
    public partial class WebcastPromoCodeProfessions
    {
        public int ID { get; set; }
        public int WebcastPromoCodeID { get; set; }
        public int ProfessionID { get; set; }
    
        public virtual WebcastPromoCodes WebcastPromoCodes { get; set; }
    }
}

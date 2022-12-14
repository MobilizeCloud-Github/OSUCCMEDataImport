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
    
    public partial class ShoppingCart
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShoppingCart()
        {
            this.ShoppingCartItems = new HashSet<ShoppingCartItems>();
            this.ShoppingCartPromoCodes = new HashSet<ShoppingCartPromoCodes>();
        }
    
        public int ID { get; set; }
        public string UserID { get; set; }
        public System.DateTime Date { get; set; }
        public decimal Total { get; set; }
        public int ItemCount { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<bool> IsCompleted { get; set; }
        public Nullable<System.DateTime> PaidOn { get; set; }
        public string ConfirmationNumber { get; set; }
        public Nullable<decimal> AmountPaid { get; set; }
    
        public virtual UserProfiles UserProfiles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCartItems> ShoppingCartItems { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCartPromoCodes> ShoppingCartPromoCodes { get; set; }
    }
}

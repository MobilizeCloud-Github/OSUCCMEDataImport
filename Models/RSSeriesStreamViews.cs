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
    
    public partial class RSSeriesStreamViews
    {
        public int ID { get; set; }
        public int RSSeriesID { get; set; }
        public int RSSeriesStreamID { get; set; }
        public string UserID { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<bool> AutoAttendanceAwarded { get; set; }
        public Nullable<System.DateTime> AutoAttendanceAwardedOn { get; set; }
    
        public virtual RSSeries RSSeries { get; set; }
        public virtual RSSeriesStreams RSSeriesStreams { get; set; }
        public virtual UserProfiles UserProfiles { get; set; }
    }
}
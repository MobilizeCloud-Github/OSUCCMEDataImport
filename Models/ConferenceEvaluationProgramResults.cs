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
    
    public partial class ConferenceEvaluationProgramResults
    {
        public int ID { get; set; }
        public int ConferenceEvaluationID { get; set; }
        public string Result { get; set; }
    
        public virtual ConferenceEvaluations ConferenceEvaluations { get; set; }
    }
}

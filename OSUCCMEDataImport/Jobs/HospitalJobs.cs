using OldOSUDatabase.Models;
using OSUCCMEDataImport.Models;
using System;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class HospitalJobs
    {
        public static void Process(string ImportUserID)
        {
            CreateDefaultHospitalGroup(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportHospitals(ImportUserID);
            ImportHosptialUsers(ImportUserID);
            ImportHospitalAdmins(ImportUserID);
        }

        
       
        

        private static void CreateDefaultHospitalGroup(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var DefaultHospitalGroup = new HospitalGroups()
            {
                HospitalGroupName = "Individual Hospitals",
                CreatedOn = System.DateTime.Now,
                CreatedBy = ImportUserID,
                IsDeleted = false,
                IsDefault = true
            };
            db.HospitalGroups.Add(DefaultHospitalGroup);
            db.SaveChanges();
        }

        private static void ImportHospitals(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var Hospitals = (from h in olddb.Hospitals
                             where h.IsDeleted == false
                             select h);
            foreach(var Hospital in Hospitals)
            {
                var NewHospital = new Models.Hospitals()
                {
                    HospitalName = Hospital.HospitalName ?? "",
                    MasterContactEmail = Hospital.MasterContactEmail ?? "",
                    EmailContains = Hospital.EmailMustContain ?? "",
                    WebcastAccess = Hospital.Access_VOD ?? false,
                    DownloadAccess = Hospital.Access_WebcastDownload ?? false,
                    EnduringMaterialsAccess = Hospital.Access_EnduringMaterials ?? false,
                    AutoApprove = Hospital.AutoApprove ?? false,
                    SendApprovalNotifications = Hospital.SendPendingApprovalNotifications ?? false,
                    SendCreditNotifications = Hospital.SendCreditNotifications ?? false,
                    CreatedOn = DateTime.Now,
                    CreatedBy = importUserID,
                    Archived = false,
                    IsUpdated = false,
                    IsDeleted = false
                };
                db.Hospitals.Add(NewHospital);
                db.SaveChanges();
            }
        }

        private static void ImportHosptialUsers(string importUserID)
        {
            throw new NotImplementedException();
        }

        private static void ImportHospitalAdmins(string importUserID)
        {
            throw new NotImplementedException();
        }

    }
}

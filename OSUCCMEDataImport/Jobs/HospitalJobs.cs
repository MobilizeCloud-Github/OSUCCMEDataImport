using OSUCCMEDataImport.Models;

namespace OSUCCMEDataImport.Jobs
{
    class HospitalJobs
    {
        public static void Process(string ImportUserID)
        {
            CreateDefaultHospitalGroup(ImportUserID);
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
    }
}

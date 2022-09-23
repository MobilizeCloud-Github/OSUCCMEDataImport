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

            TextWriter tw = new StreamWriter("ImportHospitalsLog.txt");

            var Total = Hospitals.Count();
            Console.Write("Importing Hospitals - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            foreach (var Hospital in Hospitals)
            {
                try
                {
                    Console.Write("Processing : " + Hospital.HospitalName + " (" + Index + "/" + Total + ") ");
                    var NewHospital = new Models.Hospitals()
                    {
                        ID = Hospital.ID,
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

                    Console.WriteLine(" - Complete");
                }
                catch (Exception e)
                {
                    Console.WriteLine("");
                    Console.WriteLine(" - " + e.Message);
                    tw.WriteLineAsync(e.Message);
                }
                Index++;
            }
            tw.Close();
        }

        private static void ImportHosptialUsers(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var HospitalUsers = (from h in olddb.HospitalUsers
                             where h.IsDeleted == false
                             select h);

            TextWriter tw = new StreamWriter("ImportHospitalUsersLog.txt");

            var Total = HospitalUsers.Count();
            Console.Write("Importing Hospital Users - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            foreach (var HospitalUser in HospitalUsers)
            {
                try
                {
                    Console.Write("Processing : " + HospitalUser.UserID + " (" + Index + "/" + Total + ") ");

                    var NewUser = (from h in db.UserProfiles
                                   where h.UserID == HospitalUser.UserID && h.IsDeleted == false
                                   select h).FirstOrDefault();

                    var NewHospital = (from h in db.Hospitals
                                       where h.ID == HospitalUser.HospitalID && h.IsDeleted == false
                                       select h).FirstOrDefault();
                    if(NewUser != null && NewHospital != null)
                    {
                        var NewHospitalUser = new Models.HospitalUsers()
                        {
                            UserID = HospitalUser.UserID,
                            HospitalID = NewHospital.ID,
                            IsDeleted = false,
                            IsApproved = HospitalUser.IsApproved ?? false,
                            RequestTimeStamp = HospitalUser.RequestTimeStamp,
                            ReviewedTimeStamp = HospitalUser.ReviewedTimeStamp,
                            CreatedOn = DateTime.Now,
                            CreatedBy = importUserID
                        };
                        db.HospitalUsers.Add(NewHospitalUser);
                        db.SaveChanges();
                    }

                    Console.WriteLine(" - Complete");
                }
                catch (Exception e)
                {
                    Console.WriteLine("");
                    Console.WriteLine(" - " + e.Message);
                    tw.WriteLineAsync(e.Message);
                }
                Index++;
            }
            tw.Close();
        }

        private static void ImportHospitalAdmins(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var HospitalAdmins = (from h in olddb.HospitalAdminCategories
                                 where h.IsDeleted == false
                                 select h);

            TextWriter tw = new StreamWriter("ImportHospitalAdminsLog.txt");

            var Total = HospitalAdmins.Count();
            Console.Write("Importing Hospital Admins - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            foreach (var HospitalAdmin in HospitalAdmins)
            {
                try
                {
                    Console.Write("Processing : " + HospitalAdmin.UserID + " (" + Index + "/" + Total + ") ");

                    var NewUser = (from h in db.UserProfiles
                                   where h.UserID == HospitalAdmin.UserID && h.IsDeleted == false
                                   select h).FirstOrDefault();

                    var NewHospital = (from h in db.Hospitals
                                       where h.ID == HospitalAdmin.HospitalID && h.IsDeleted == false
                                       select h).FirstOrDefault();
                    if (NewUser != null && NewHospital != null)
                    {
                        var NewHospitalUser = new Models.HospitalUsers()
                        {
                            UserID = NewUser.UserID,
                            HospitalID = NewHospital.ID,
                            IsDeleted = false,                            
                            CreatedOn = DateTime.Now,
                            CreatedBy = importUserID
                        };
                        db.HospitalUsers.Add(NewHospitalUser);
                        db.SaveChanges();
                    }

                    Console.WriteLine(" - Complete");
                }
                catch (Exception e)
                {
                    Console.WriteLine("");
                    Console.WriteLine(" - " + e.Message);
                    tw.WriteLineAsync(e.Message);
                }
                Index++;
            }
            tw.Close();
        }

    }
}

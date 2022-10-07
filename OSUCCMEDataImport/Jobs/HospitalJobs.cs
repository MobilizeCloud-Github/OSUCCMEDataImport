using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class HospitalJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            CreateDefaultHospitalGroup(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportHospitals(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportHosptialUsers(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportHospitalAdmins(ImportUserID);

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void CreateDefaultHospitalGroup(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;

            try
            {
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
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

        private static void ImportHospitals(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;

            var Hospitals = (from h in olddb.Hospitals
                             where h.IsDeleted == false
                             select h).ToList();

            TextWriter tw = new StreamWriter("ImportHospitalsLog.txt");

            var Total = Hospitals.Count();
            Console.Write("Importing Hospitals - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            foreach (var Hospital in Hospitals)
            {
                try
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + Hospital.HospitalName);
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

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;

            var HospitalsToImport = (from h in olddb.HospitalUsers
                                 where h.IsDeleted == false && h.HospitalID != null
                                 group h by h.HospitalID into hg
                                 select new
                                 {
                                     HospitalID = hg.Key,
                                     HospitalUsers = hg
                                 });

            TextWriter tw = new StreamWriter("ImportHospitalUsersLog.txt");

            var Total = HospitalsToImport.Count();
            Console.Write("Importing Hospital Users - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;
            try
            {
                var HospitalUsersToAdd = new List<Models.HospitalUsers>();

                var HospitalIDs = (from h in db.Hospitals
                                   where h.IsDeleted == false
                                   select h.ID).ToList();
                foreach (var Hospital in HospitalsToImport)
                {

                    Console.Write("Processing Hospital: (" + Index + "/" + Total + ") " + Hospital.HospitalID);
                    if (HospitalIDs.Contains(Hospital.HospitalID.Value))
                    {
                        var UsersTotal = Hospital.HospitalUsers.Count();
                        var UserIndex = 1;
                        foreach (var User in Hospital.HospitalUsers)
                        {
                            Console.Write("Processing Hospital User: (" + Index + "/" + Total + ") (" + UserIndex + "/" + UsersTotal + ")" + Hospital.HospitalID + " " + User.UserID);
                            if (CommonFunctions.DoesUserExist(db, User.UserID))
                            {
                                var NewHospitalUser = new Models.HospitalUsers()
                                {
                                    UserID = User.UserID,
                                    HospitalID = Hospital.HospitalID.Value,
                                    IsDeleted = false,
                                    IsApproved = User.IsApproved ?? false,
                                    RequestTimeStamp = User.RequestTimeStamp,
                                    ReviewedTimeStamp = User.ReviewedTimeStamp,
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = importUserID
                                };
                                HospitalUsersToAdd.Add(NewHospitalUser);
                                Console.WriteLine(" - Pending");
                            }
                            else
                            {
                                Console.WriteLine(" - Skipped");
                            }
                            UserIndex++;
                        }
                        db.HospitalUsers.AddRange(HospitalUsersToAdd);
                        db.SaveChanges();
                        HospitalUsersToAdd.Clear();
                        Console.WriteLine(" - Complete");
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
                    Index++;
                }
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
                tw.WriteLineAsync(e.Message);
            }
            tw.Close();
        }

        private static void ImportHospitalAdmins(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;

            var HospitalAdmins = (from h in olddb.HospitalAdminCategories
                                  where h.IsDeleted == false
                                  select new
                                  {
                                      h.HospitalID,
                                      h.UserID
                                  }).ToList();

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
                        var NewHospitalAdmin = new Models.HospitalAdmins()
                        {
                            UserID = NewUser.UserID,
                            HospitalID = NewHospital.ID,
                            IsDeleted = false,
                            CreatedOn = DateTime.Now,
                            CreatedBy = importUserID,
                            LastUpdatedOn = DateTime.Now,
                            LastUpdatedBy = importUserID
                        };
                        db.HospitalAdmins.Add(NewHospitalAdmin);
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

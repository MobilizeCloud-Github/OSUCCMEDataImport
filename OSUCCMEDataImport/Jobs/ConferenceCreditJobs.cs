using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class ConferenceCreditJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            ConferenceCredits(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void ConferenceCredits(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var UserCreditsToImport = (from uc in olddb.UserCredits
                                           where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == false && uc.EventType == "Conference"
                                           group uc by uc.UserID into ucg
                                           select new
                                           {
                                               UserID = ucg.Key,
                                               UserCredits = ucg
                                           }).ToList();

                var Total = UserCreditsToImport.Count();
                Console.Write("Importing Conference User Credits - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in UserCreditsToImport)
                {
                    Console.WriteLine("Processing Conference User Credits : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.UserCredits.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.UserCredits)
                        {
                            Console.Write("User Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");
                            var Registration = (from c in db.ConferenceRegistrations
                                                where c.ConferenceID == uc.EventID && c.UserID == uc.UserID
                                                select c).FirstOrDefault();

                            if (Registration != null)
                            {
                                var AssignedByUserID = ImportUserID;
                                if (CommonFunctions.DoesUserExist(db, uc.AssignedBy))
                                {
                                    AssignedByUserID = uc.AssignedBy;
                                }

                                if (uc.IsMOC == true)
                                {
                                    decimal OutMOCPoints = 0.0m;
                                    decimal.TryParse(uc.CreditHours.ToString(), out OutMOCPoints);

                                    Registration.MOCPoints = OutMOCPoints;
                                    Registration.MOCPointsAssignedOn = uc.AssignedOn;
                                    Registration.MOCPointsAssignedBy = AssignedByUserID;

                                }

                                decimal OutCreditHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutCreditHours);

                                Registration.CreditHours = OutCreditHours;
                                Registration.CreditAssignedOn = uc.AssignedOn;
                                Registration.CreditAssignedBy = AssignedByUserID;
                                Console.WriteLine(" - Pending");
                            }
                            else
                            {
                                Console.WriteLine(" - Skipped");
                            }
                            CreditsIndex++;
                        }
                        db.SaveChanges();
                        Console.WriteLine(" - Saved");
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }

                    Index++;
                    Console.WriteLine(" - Complete");
                }

            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }
    }
}

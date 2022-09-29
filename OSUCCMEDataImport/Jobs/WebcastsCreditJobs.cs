using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class WebcastsCreditJobs
    {
        public static void Process(string ImportUserID)
        {
            WebcastsCredits(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");


        }

        private static void WebcastsCredits(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var olddb = new OldOSUCCMEEntities();


            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var UserCreditsToImport = (from uc in olddb.UserCredits
                                           where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == false && (uc.EventType == "Webcast-Live" || uc.EventType == "Webcast-VOD")
                                           group uc by uc.UserID into ucg
                                           select new
                                           {
                                               UserID = ucg.Key,
                                               UserCredits = ucg
                                           }).ToList();

                var Total = UserCreditsToImport.Count();
                Console.Write("Importing Webcasts User Credits - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in UserCreditsToImport)
                {
                    Console.Write("Processing Webcasts User Credits : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.UserCredits.Count();
                        var CreditsIndex = 1;



                        foreach (var uc in u.UserCredits)
                        {
                            Console.Write("User Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


                            var Registration = (from c in db.WebcastRegistrations
                                                where c.WebcastID == uc.EventID && c.UserID == uc.UserID
                                                select c).FirstOrDefault();

                            if (Registration != null)
                            {

                                if (uc.IsMOC == true)
                                {
                                    decimal OutMOCPoints = 0.0m;
                                    decimal.TryParse(uc.CreditHours.ToString(), out OutMOCPoints);

                                    Registration.MOCPoints = OutMOCPoints;
                                    Registration.MOCPointsAssignedOn = uc.AssignedOn;
                                    if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                    {
                                        Registration.MOCPointsAssignedBy = uc.AssignedBy;
                                    }
                                    else
                                    {
                                        Registration.MOCPointsAssignedBy = ImportUserID;
                                    }

                                }

                                decimal OutCreditHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutCreditHours);

                                Registration.CreditHours = OutCreditHours;
                                Registration.CreditAssignedOn = uc.AssignedOn;
                                if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                {
                                    Registration.CreditAssignedBy = uc.AssignedBy;
                                }
                                else
                                {
                                    Registration.CreditAssignedBy = ImportUserID;
                                }

                                //db.SaveChanges();
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

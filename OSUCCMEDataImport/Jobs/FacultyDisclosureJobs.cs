using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class FacultyDisclosureJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            FacultyDisclosures(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void FacultyDisclosures(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var SpeakerDisclosureToImport = (from s in olddb.SpeakerDisclosures
                                                 where s.IsDeleted == false
                                                 select s).ToList();

                var Total = SpeakerDisclosureToImport.Count();
                Console.Write("Importing User Credits - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var sd in SpeakerDisclosureToImport)
                {
                    Console.Write("Processing Faculty Disclosure : (" + Index + "/" + Total + ") " + sd.ID);
                    if (CommonFunctions.DoesUserExist(db, sd.UserID))
                    {
                        var NewFacultyDisclosure = new FacultyDisclosures()
                        {
                            UserID = sd.UserID,
                            ResolutionOfConflictPlannersActivityDirectors = "",
                            ResolutionOfConflictPresentersAuthors = "",
                            NonConflictedCoDirector = "",
                            FullName = CommonFunctions.GetUserFullName(sd.UserID),
                            Expires = sd.Expire.Value,
                            IsDeleted = false,
                            CreatedOn = sd.Submitted ?? DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedBy = ImportUserID,
                            LastUpdatedOn = sd.Submitted ?? DateTime.Now
                        };

                        NewFacultyDisclosure.Disclosure = false;

                        if (sd.EventType != "Annual" && sd.EventType != null && sd.EventType != "")
                        {
                            switch (sd.EventType)
                            {
                                case "WebCast":
                                    {
                                        NewFacultyDisclosure.EventType = "Webcasts";
                                        break;
                                    }
                                case "Conference":
                                    {
                                        NewFacultyDisclosure.EventType = "Conference";
                                        break;
                                    }
                                case "Enduring":
                                    {
                                        NewFacultyDisclosure.EventType = "EnduringMaterial";
                                        break;
                                    }
                                case "RSSeries":
                                    {
                                        NewFacultyDisclosure.EventType = "RSSeries";
                                        break;
                                    }
                            }

                            if (sd.GrantsName == "Paper Copy Submitted")
                            {
                                NewFacultyDisclosure.Type = "Paper";
                            }
                            else
                            {
                                NewFacultyDisclosure.Type = "Single Event";
                            }
                        }
                        else
                        {
                            NewFacultyDisclosure.Type = "Annual";
                            NewFacultyDisclosure.EventType = null;
                        }

                        if (sd.EventID != 0)
                        {
                            NewFacultyDisclosure.EventID = sd.EventID;
                        }

                        db.FacultyDisclosures.Add(NewFacultyDisclosure);
                        db.SaveChanges();

                        if (NewFacultyDisclosure.Type != "Paper")
                        {
                            if (sd.Grants == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.GrantsName, "Grants");
                            }
                            if (sd.Consultant == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.ConsultantName, "Consultant");
                            }
                            if (sd.Advisory == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.AdvisoryName, "Advisory");
                            }
                            if (sd.Stockholder == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.StockholderName, "Stockholder");
                            }
                            if (sd.Honararium == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.HonarariumName, "Honararium");
                            }
                            if (sd.Editorial == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.EditorialName, "Editorial");
                            }
                            if (sd.Other == true)
                            {
                                NewFacultyDisclosure.Disclosure = true;
                                CommonFunctions.SaveCommercialInterest(db, NewFacultyDisclosure.ID, sd.OtherName, "Other");
                            }

                            db.SaveChanges();
                        }
                        Console.WriteLine(" - Saved");
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
            }
        }


    }
}

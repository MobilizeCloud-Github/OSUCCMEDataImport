using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class RSSeriesSpeakerJobs
    {
        public static void Process(string ImportUserID)
        {
            RSSeriesSpeakers(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");


        }

        private static void RSSeriesSpeakers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var RSSeriesSpeakersToImport = (from uc in olddb.UserCredits
                                                where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && uc.EventType == "RSSeries"
                                                group uc by uc.UserID into ucg
                                                select new
                                                {
                                                    UserID = ucg.Key,
                                                    SpeakingCredits = ucg
                                                }).ToList();

                var Total = RSSeriesSpeakersToImport.Count();
                Console.Write("Importing RSSeries Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in RSSeriesSpeakersToImport)
                {
                    Console.Write("Processing RSSeries Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        var RSSeries = (from ce in db.RSSeries
                                        where ce.IsDeleted == false
                                        select ce).ToList();

                        var RSSeriesIDs = RSSeries.Select(x => x.ID).ToList();

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


                            if (RSSeriesIDs.Contains(uc.EventID.Value))
                            {
                                decimal OutSpeakerHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutSpeakerHours);

                                var NewRSSeriesSpeaker = new RSSeriesSpeakers()
                                {
                                    RSSeriesID = uc.EventID ?? 0,
                                    UserID = uc.UserID,
                                    SpeakerHours = OutSpeakerHours,
                                    SpeakerHoursAssignedOn = uc.AssignedOn,
                                    CreatedOn = uc.AssignedOn ?? DateTime.Now,
                                    LastUpdatedOn = uc.AssignedOn ?? DateTime.Now,
                                    SpeakerCheckListOnFile = false
                                };

                                if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                {
                                    NewRSSeriesSpeaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                    NewRSSeriesSpeaker.CreatedBy = uc.AssignedBy;
                                    NewRSSeriesSpeaker.LastUpdatedBy = uc.AssignedBy;
                                }
                                else
                                {
                                    NewRSSeriesSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                    NewRSSeriesSpeaker.CreatedBy = ImportUserID;
                                    NewRSSeriesSpeaker.LastUpdatedBy = ImportUserID;
                                }

                                var FDOnFile = (from f in db.FacultyDisclosures
                                                where f.UserID == uc.UserID && f.EventType == "RSSeries" && f.EventID == uc.EventID
                                                select f).Any();

                                NewRSSeriesSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                db.RSSeriesSpeakers.Add(NewRSSeriesSpeaker);
                                db.SaveChanges();
                                Console.WriteLine(" - Speaker Saved");

                                var NewSpeakerTopic = new RSSeriesSpeakerTopics()
                                {
                                    RSSeriesID = uc.EventID ?? 0,
                                    RSSeriesSpeakerID = NewRSSeriesSpeaker.ID,
                                    Topic = RSSeries.Where(x => x.ID == uc.EventID).Select(x => x.Title).FirstOrDefault(),
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.RSSeriesSpeakerTopics.Add(NewSpeakerTopic);
                                db.SaveChanges();
                                Console.WriteLine(" - Topic Saved");
                            }
                            else
                            {
                                Console.WriteLine(" - Skipped");
                            }
                            CreditsIndex++;

                        }
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

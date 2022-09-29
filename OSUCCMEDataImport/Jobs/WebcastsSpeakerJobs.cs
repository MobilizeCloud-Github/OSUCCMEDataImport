using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class WebcastsSpeakerJobs
    {
        public static void Process(string ImportUserID)
        {
            WebcastsSpeakers(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");


        }

        private static void WebcastsSpeakers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var WebcastSpeakersToImport = (from uc in olddb.UserCredits
                                               where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && (uc.EventType == "Webcast-Live" || uc.EventType == "Webcast-VOD")
                                               group uc by uc.UserID into ucg
                                               select new
                                               {
                                                   UserID = ucg.Key,
                                                   SpeakingCredits = ucg
                                               }).ToList();

                var Total = WebcastSpeakersToImport.Count();
                Console.Write("Importing Webcasts Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in WebcastSpeakersToImport)
                {
                    Console.Write("Processing Webcasts Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        var Webcast = (from ce in db.Webcasts
                                       where ce.IsDeleted == false
                                       select ce).ToList();

                        var WebcastIDs = Webcast.Select(x => x.ID).ToList();

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


                            if (WebcastIDs.Contains(uc.EventID.Value))
                            {
                                decimal OutSpeakerHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutSpeakerHours);

                                var NewWebcastSpeaker = new WebcastSpeakers()
                                {
                                    WebcastID = uc.EventID ?? 0,
                                    UserID = uc.UserID,
                                    SpeakerHours = OutSpeakerHours,
                                    SpeakerHoursAssignedOn = uc.AssignedOn,
                                    CreatedOn = uc.AssignedOn ?? DateTime.Now,
                                    LastUpdatedOn = uc.AssignedOn ?? DateTime.Now,
                                    SpeakerCheckListOnFile = false
                                };

                                if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                {
                                    NewWebcastSpeaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                    NewWebcastSpeaker.CreatedBy = uc.AssignedBy;
                                    NewWebcastSpeaker.LastUpdatedBy = uc.AssignedBy;
                                }
                                else
                                {
                                    NewWebcastSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                    NewWebcastSpeaker.CreatedBy = ImportUserID;
                                    NewWebcastSpeaker.LastUpdatedBy = ImportUserID;
                                }

                                var FDOnFile = (from f in db.FacultyDisclosures
                                                where f.UserID == uc.UserID && f.EventType == "Webcasts" && f.EventID == uc.EventID
                                                select f).Any();

                                NewWebcastSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                db.WebcastSpeakers.Add(NewWebcastSpeaker);
                                db.SaveChanges();
                                Console.WriteLine(" - Speaker Saved");

                                var NewSpeakerTopic = new WebcastSpeakerTopics()
                                {
                                    WebcastID = uc.EventID ?? 0,
                                    WebcastSpeakerID = NewWebcastSpeaker.ID,
                                    Topic = Webcast.Where(x => x.ID == uc.EventID).Select(x => x.Title).FirstOrDefault(),
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.WebcastSpeakerTopics.Add(NewSpeakerTopic);
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

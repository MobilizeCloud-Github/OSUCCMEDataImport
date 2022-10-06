using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class ConferenceSpeakerJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            ConferenceSpeakers(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void ConferenceSpeakers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var ConferenceSpeakersToImport = (from uc in olddb.UserCredits
                                                  where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && uc.EventType == "Conference"
                                                  group uc by uc.UserID into ucg
                                                  select new
                                                  {
                                                      UserID = ucg.Key,
                                                      SpeakingCredits = ucg
                                                  }).ToList();

                var Total = ConferenceSpeakersToImport.Count();
                Console.Write("Importing Conference Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in ConferenceSpeakersToImport)
                {
                    Console.Write("Processing Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        var Conference = (from ce in db.Conferences
                                          where ce.IsDeleted == false
                                          select ce).ToList();

                        var ConferenceIDs = Conference.Select(x => x.ID).ToList();

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");

                            if (ConferenceIDs.Contains(uc.EventID.Value))
                            {
                                decimal OutSpeakerHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutSpeakerHours);

                                var NewConferenceSpeaker = new ConferenceSpeakers()
                                {
                                    ConferenceID = uc.EventID ?? 0,
                                    UserID = uc.UserID,
                                    SpeakerHours = OutSpeakerHours,
                                    SpeakerHoursAssignedOn = uc.AssignedOn,
                                    CreatedOn = uc.AssignedOn ?? DateTime.Now,
                                    LastUpdatedOn = uc.AssignedOn ?? DateTime.Now,
                                    SpeakerCheckListOnFile = false
                                };

                                if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                {
                                    NewConferenceSpeaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                    NewConferenceSpeaker.CreatedBy = uc.AssignedBy;
                                    NewConferenceSpeaker.LastUpdatedBy = uc.AssignedBy;
                                }
                                else
                                {
                                    NewConferenceSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                    NewConferenceSpeaker.CreatedBy = ImportUserID;
                                    NewConferenceSpeaker.LastUpdatedBy = ImportUserID;
                                }

                                var FDOnFile = (from f in db.FacultyDisclosures
                                                where f.UserID == uc.UserID && f.EventType == "Conference" && f.EventID == uc.EventID
                                                select f).Any();

                                NewConferenceSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                db.ConferenceSpeakers.Add(NewConferenceSpeaker);
                                db.SaveChanges();
                                Console.WriteLine(" - Speaker Saved");

                                var NewSpeakerTopic = new ConferenceSpeakerTopics()
                                {
                                    ConferenceID = uc.EventID ?? 0,
                                    ConferenceSpeakerID = NewConferenceSpeaker.ID,
                                    Topic = Conference.Where(x => x.ID == uc.EventID).Select(x => x.Title).FirstOrDefault(),
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.ConferenceSpeakerTopics.Add(NewSpeakerTopic);
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

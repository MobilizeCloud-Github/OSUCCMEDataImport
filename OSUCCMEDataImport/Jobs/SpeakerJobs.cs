using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class SpeakerJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();


            Speakers(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            WebcastSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            RSSeriesSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");


            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void Speakers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var SpeakersToImport = (from c in olddb.Speakers
                                        where c.IsDeleted == false
                                        group c by c.UserID into cs
                                        select new
                                        {
                                            UserID = cs.Key,
                                            Speakers = cs
                                        }).ToList();

                var Total = SpeakersToImport.Count();
                Console.Write("Importing Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in SpeakersToImport)
                {
                    Console.Write("Processing Speakers: (" + Index + "/" + Total + ") " + c.UserID);
                    if (CommonFunctions.DoesUserExist(db, c.UserID))
                    {
                        foreach (var s in c.Speakers)
                        {
                            if (CommonFunctions.DoesEventExist(db, s.EventID.Value, s.Type))
                            {
                                switch (s.Type.ToLower())
                                {
                                    case ("conference"):
                                        {

                                            var NewConferenceSpeaker = new ConferenceSpeakers()
                                            {
                                                ConferenceID = s.EventID ?? 0,
                                                UserID = s.UserID,
                                                CreatedOn = DateTime.Now,
                                                LastUpdatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedBy = ImportUserID,
                                                SpeakerCheckListOnFile = false
                                            };
                                            db.ConferenceSpeakers.Add(NewConferenceSpeaker);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Speaker Saved");

                                            var NewSpeakerTopic = new ConferenceSpeakerTopics()
                                            {
                                                ConferenceID = s.EventID ?? 0,
                                                ConferenceSpeakerID = NewConferenceSpeaker.ID,
                                                Topic = db.Conferences.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };
                                            db.ConferenceSpeakerTopics.Add(NewSpeakerTopic);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Topic Saved");
                                            break;
                                        }
                                    case ("webcast"):
                                        {
                                            var NewWebcastSpeaker = new WebcastSpeakers()
                                            {
                                                WebcastID = s.EventID ?? 0,
                                                UserID = s.UserID,
                                                CreatedOn = DateTime.Now,
                                                LastUpdatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedBy = ImportUserID,
                                                SpeakerCheckListOnFile = false
                                            };
                                            db.WebcastSpeakers.Add(NewWebcastSpeaker);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Speaker Saved");

                                            var NewSpeakerTopic = new WebcastSpeakerTopics()
                                            {
                                                WebcastID = s.EventID ?? 0,
                                                WebcastSpeakerID = NewWebcastSpeaker.ID,
                                                Topic = db.Webcasts.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };
                                            db.WebcastSpeakerTopics.Add(NewSpeakerTopic);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Topic Saved");
                                            break;
                                        }
                                    case ("enduring"):
                                        {
                                            var NewEnduringSpeaker = new EnduringMaterialSpeakers()
                                            {
                                                EnduringMaterialID = s.EventID ?? 0,
                                                UserID = s.UserID,
                                                CreatedOn = DateTime.Now,
                                                LastUpdatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedBy = ImportUserID,
                                                SpeakerCheckListOnFile = false
                                            };
                                            db.EnduringMaterialSpeakers.Add(NewEnduringSpeaker);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Speaker Saved");

                                            var NewSpeakerTopic = new EnduringMaterialSpeakerTopics()
                                            {
                                                EnduringMaterialID = s.EventID ?? 0,
                                                EnduringMaterialSpeakerID = NewEnduringSpeaker.ID,
                                                Topic = db.EnduringMaterials.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };
                                            db.EnduringMaterialSpeakerTopics.Add(NewSpeakerTopic);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Topic Saved");

                                            break;
                                        }
                                    case ("rsseries"):
                                        {

                                            var NewRSSeriesSpeaker = new RSSeriesSpeakers()
                                            {
                                                RSSeriesID = s.EventID ?? 0,
                                                UserID = s.UserID,
                                                CreatedOn = DateTime.Now,
                                                LastUpdatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedBy = ImportUserID,
                                                SpeakerCheckListOnFile = false
                                            };
                                            db.RSSeriesSpeakers.Add(NewRSSeriesSpeaker);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Speaker Saved");

                                            var NewSpeakerTopic = new RSSeriesSpeakerTopics()
                                            {
                                                RSSeriesID = s.EventID ?? 0,
                                                RSSeriesSpeakerID = NewRSSeriesSpeaker.ID,
                                                Topic = db.EnduringMaterials.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };
                                            db.RSSeriesSpeakerTopics.Add(NewSpeakerTopic);
                                            db.SaveChanges();
                                            Console.WriteLine(" - Topic Saved");

                                            break;
                                        }

                                }
                            }
                        }

                        //Console.WriteLine(" - Saved");
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

        private static void ConferenceSpeakerCredit(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var olddb = new OldOSUCCMEEntities();


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

                                var ConferenceSpeaker = (from ce in db.ConferenceSpeakers
                                                         where ce.ConferenceID == uc.EventID && ce.UserID == uc.UserID
                                                         select ce).FirstOrDefault();

                                if (ConferenceSpeaker != null)
                                {

                                    ConferenceSpeaker.SpeakerHours = OutSpeakerHours;
                                    ConferenceSpeaker.SpeakerHoursAssignedOn = uc.AssignedOn;
                                    ConferenceSpeaker.CreatedOn = uc.AssignedOn ?? DateTime.Now;
                                    ConferenceSpeaker.LastUpdatedOn = uc.AssignedOn ?? DateTime.Now;
                                    ConferenceSpeaker.SpeakerCheckListOnFile = false;

                                    if (CommonFunctions.DoesUserExist(db, uc.AssignedBy))
                                    {
                                        ConferenceSpeaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                        ConferenceSpeaker.CreatedBy = uc.AssignedBy;
                                        ConferenceSpeaker.LastUpdatedBy = uc.AssignedBy;
                                    }
                                    else
                                    {
                                        ConferenceSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                        ConferenceSpeaker.CreatedBy = ImportUserID;
                                        ConferenceSpeaker.LastUpdatedBy = ImportUserID;
                                    }

                                    var FDOnFile = (from f in db.FacultyDisclosures
                                                    where f.UserID == uc.UserID && f.EventType == "Conference" && f.EventID == uc.EventID
                                                    select f).Any();

                                    ConferenceSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }

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

        private static void WebcastSpeakerCredit(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var olddb = new OldOSUCCMEEntities();


            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var WebcastSpeakersToImport = (from uc in olddb.UserCredits
                                               where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == false && (uc.EventType == "Webcast-Live" || uc.EventType == "Webcast-VOD")
                                               group uc by uc.UserID into ucg
                                               select new
                                               {
                                                   UserID = ucg.Key,
                                                   SpeakingCredits = ucg
                                               }).ToList();

                var Total = WebcastSpeakersToImport.Count();
                Console.Write("Importing Webcast Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in WebcastSpeakersToImport)
                {
                    Console.Write("Processing Speakers : (" + Index + "/" + Total + ") " + u.UserID);

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

                                var Speaker = (from ce in db.WebcastSpeakers
                                               where ce.WebcastID == uc.EventID && ce.UserID == uc.UserID
                                               select ce).FirstOrDefault();

                                if (Speaker != null)
                                {

                                    Speaker.SpeakerHours = OutSpeakerHours;
                                    Speaker.SpeakerHoursAssignedOn = uc.AssignedOn;
                                    Speaker.CreatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.LastUpdatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.SpeakerCheckListOnFile = false;

                                    if (CommonFunctions.DoesUserExist(db, uc.AssignedBy))
                                    {
                                        Speaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                        Speaker.CreatedBy = uc.AssignedBy;
                                        Speaker.LastUpdatedBy = uc.AssignedBy;
                                    }
                                    else
                                    {
                                        Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                        Speaker.CreatedBy = ImportUserID;
                                        Speaker.LastUpdatedBy = ImportUserID;
                                    }

                                    var FDOnFile = (from f in db.FacultyDisclosures
                                                    where f.UserID == uc.UserID && f.EventType == "Webcasts" && f.EventID == uc.EventID
                                                    select f).Any();

                                    Speaker.FacultyDisclosureOnFile = FDOnFile;

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }

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

        private static void EnduringSpeakerCredit(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var olddb = new OldOSUCCMEEntities();


            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EnduringSpeakersToImport = (from uc in olddb.UserCredits
                                                where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == false && uc.EventType == "Enduring"
                                                group uc by uc.UserID into ucg
                                                select new
                                                {
                                                    UserID = ucg.Key,
                                                    SpeakingCredits = ucg
                                                }).ToList();

                var Total = EnduringSpeakersToImport.Count();
                Console.Write("Importing Enduring Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in EnduringSpeakersToImport)
                {
                    Console.Write("Processing Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        var Enduring = (from ce in db.EnduringMaterials
                                        where ce.IsDeleted == false
                                        select ce).ToList();

                        var EnduringIDs = Enduring.Select(x => x.ID).ToList();

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


                            if (EnduringIDs.Contains(uc.EventID.Value))
                            {
                                decimal OutSpeakerHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutSpeakerHours);

                                var Speaker = (from ce in db.EnduringMaterialSpeakers
                                               where ce.EnduringMaterialID == uc.EventID && ce.UserID == uc.UserID
                                               select ce).FirstOrDefault();

                                if (Speaker != null)
                                {

                                    Speaker.SpeakerHours = OutSpeakerHours;
                                    Speaker.SpeakerHoursAssignedOn = uc.AssignedOn;
                                    Speaker.CreatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.LastUpdatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.SpeakerCheckListOnFile = false;

                                    if (CommonFunctions.DoesUserExist(db, uc.AssignedBy))
                                    {
                                        Speaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                        Speaker.CreatedBy = uc.AssignedBy;
                                        Speaker.LastUpdatedBy = uc.AssignedBy;
                                    }
                                    else
                                    {
                                        Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                        Speaker.CreatedBy = ImportUserID;
                                        Speaker.LastUpdatedBy = ImportUserID;
                                    }

                                    var FDOnFile = (from f in db.FacultyDisclosures
                                                    where f.UserID == uc.UserID && f.EventType == "EnduringMaterial" && f.EventID == uc.EventID
                                                    select f).Any();

                                    Speaker.FacultyDisclosureOnFile = FDOnFile;

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }

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

        private static void RSSeriesSpeakerCredit(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();

            var olddb = new OldOSUCCMEEntities();


            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var RSSeriesSpeakersToImport = (from uc in olddb.UserCredits
                                                where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == false && uc.EventType == "RSSeries"
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
                    Console.Write("Processing Speakers : (" + Index + "/" + Total + ") " + u.UserID);

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

                                var Speaker = (from ce in db.RSSeriesSpeakers
                                               where ce.RSSeriesID == uc.EventID && ce.UserID == uc.UserID
                                               select ce).FirstOrDefault();

                                if (Speaker != null)
                                {

                                    Speaker.SpeakerHours = OutSpeakerHours;
                                    Speaker.SpeakerHoursAssignedOn = uc.AssignedOn;
                                    Speaker.CreatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.LastUpdatedOn = uc.AssignedOn ?? DateTime.Now;
                                    Speaker.SpeakerCheckListOnFile = false;

                                    if (CommonFunctions.DoesUserExist(db, uc.AssignedBy))
                                    {
                                        Speaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                        Speaker.CreatedBy = uc.AssignedBy;
                                        Speaker.LastUpdatedBy = uc.AssignedBy;
                                    }
                                    else
                                    {
                                        Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                        Speaker.CreatedBy = ImportUserID;
                                        Speaker.LastUpdatedBy = ImportUserID;
                                    }

                                    var FDOnFile = (from f in db.FacultyDisclosures
                                                    where f.UserID == uc.UserID && f.EventType == "RSSeries" && f.EventID == uc.EventID
                                                    select f).Any();

                                    Speaker.FacultyDisclosureOnFile = FDOnFile;

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }

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

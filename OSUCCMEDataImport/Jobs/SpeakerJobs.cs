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
            //ConferenceSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            //WebcastSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringSpeakerCredit(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            //RSSeriesSpeakerCredit(ImportUserID);
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
                var SpeakersToImport = (from c in olddb.Speakers
                                        where c.IsDeleted == false && c.Type == "Enduring"
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
                    Console.WriteLine("Processing Speaker: (" + Index + "/" + Total + ") " + c.UserID);
                    if (CommonFunctions.DoesUserExist(db, c.UserID))
                    {
                        var EventIndex = 1;
                        var EventTotal = c.Speakers.Count();
                        foreach (var s in c.Speakers)
                        {
                            Console.Write("Processing Speaker Event: (" + Index + "/" + Total + ") (" + EventIndex + "/" + EventTotal + ")" + s.EventID + " " + s.Type + " ");
                            if (CommonFunctions.DoesEventExist(db, s.EventID.Value, s.Type))
                            {
                                switch (s.Type.ToLower())
                                {
                                    case ("conference"):
                                        {

                                            //var NewConferenceSpeaker = new ConferenceSpeakers()
                                            //{
                                            //    ConferenceID = s.EventID ?? 0,
                                            //    UserID = s.UserID,
                                            //    CreatedOn = DateTime.Now,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedBy = ImportUserID,
                                            //    SpeakerCheckListOnFile = false
                                            //};
                                            //db.ConferenceSpeakers.Add(NewConferenceSpeaker);
                                            //db.SaveChanges();
                                            //Console.Write(" - Speaker Saved");

                                            //var NewSpeakerTopic = new ConferenceSpeakerTopics()
                                            //{
                                            //    ConferenceID = s.EventID ?? 0,
                                            //    ConferenceSpeakerID = NewConferenceSpeaker.ID,
                                            //    Topic = db.Conferences.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                            //    CreatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    LastUpdatedBy = ImportUserID
                                            //};
                                            //db.ConferenceSpeakerTopics.Add(NewSpeakerTopic);
                                            //db.SaveChanges();
                                            //Console.WriteLine(" - Topic Saved");
                                            break;
                                        }
                                    case ("webcast"):
                                        {
                                            //var NewWebcastSpeaker = new WebcastSpeakers()
                                            //{
                                            //    WebcastID = s.EventID ?? 0,
                                            //    UserID = s.UserID,
                                            //    CreatedOn = DateTime.Now,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedBy = ImportUserID,
                                            //    SpeakerCheckListOnFile = false
                                            //};
                                            //db.WebcastSpeakers.Add(NewWebcastSpeaker);
                                            //db.SaveChanges();
                                            //Console.Write(" - Speaker Saved");

                                            //var NewSpeakerTopic = new WebcastSpeakerTopics()
                                            //{
                                            //    WebcastID = s.EventID ?? 0,
                                            //    WebcastSpeakerID = NewWebcastSpeaker.ID,
                                            //    Topic = db.Webcasts.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                            //    CreatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    LastUpdatedBy = ImportUserID
                                            //};
                                            //db.WebcastSpeakerTopics.Add(NewSpeakerTopic);
                                            //db.SaveChanges();
                                            //Console.WriteLine(" - Topic Saved");
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
                                            Console.Write(" - Speaker Saved");

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

                                            //var NewRSSeriesSpeaker = new RSSeriesSpeakers()
                                            //{
                                            //    RSSeriesID = s.EventID ?? 0,
                                            //    UserID = s.UserID,
                                            //    CreatedOn = DateTime.Now,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedBy = ImportUserID,
                                            //    SpeakerCheckListOnFile = false
                                            //};
                                            //db.RSSeriesSpeakers.Add(NewRSSeriesSpeaker);
                                            //db.SaveChanges();
                                            //Console.Write(" - Speaker Saved");

                                            //var NewSpeakerTopic = new RSSeriesSpeakerTopics()
                                            //{
                                            //    RSSeriesID = s.EventID ?? 0,
                                            //    RSSeriesSpeakerID = NewRSSeriesSpeaker.ID,
                                            //    Topic = db.RSSeries.Where(x => x.ID == s.EventID).Select(x => x.Title).FirstOrDefault(),
                                            //    CreatedOn = DateTime.Now,
                                            //    CreatedBy = ImportUserID,
                                            //    LastUpdatedOn = DateTime.Now,
                                            //    LastUpdatedBy = ImportUserID
                                            //};
                                            //db.RSSeriesSpeakerTopics.Add(NewSpeakerTopic);
                                            //db.SaveChanges();
                                            //Console.WriteLine(" - Topic Saved");

                                            break;
                                        }
                                    case ("podcast"):
                                        {
                                            Console.WriteLine(" - Skipped");
                                            break;
                                        }

                                }
                            }
                            else
                            {
                                Console.WriteLine(" - Skipped");
                            }
                            EventIndex++;
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

                var ConferenceIDs = (from ce in db.Conferences
                                     where ce.IsDeleted == false
                                     select ce.ID).ToList();

                foreach (var u in ConferenceSpeakersToImport)
                {
                    Console.WriteLine("Processing Conference Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var FacultyDisclosures = (from f in db.FacultyDisclosures
                                                  where f.UserID == u.UserID
                                                  select f).ToList();

                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Conference Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


                            if (ConferenceIDs.Contains(uc.EventID.Value))
                            {
                                decimal OutSpeakerHours = 0.0m;
                                decimal.TryParse(uc.CreditHours.ToString(), out OutSpeakerHours);

                                var Speaker = (from ce in db.ConferenceSpeakers
                                               where ce.ConferenceID == uc.EventID && ce.UserID == uc.UserID
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

                                    var FacultyDisclosure = (from f in FacultyDisclosures
                                                             where f.EventType == "Conference" && f.EventID == uc.EventID
                                                             select f).FirstOrDefault();

                                    if (FacultyDisclosure != null)
                                    {
                                        Speaker.FacultyDisclosureOnFile = true;
                                        Speaker.FacultyDisclosureID = FacultyDisclosure.ID;
                                    }
                                    else
                                    {
                                        Speaker.FacultyDisclosureOnFile = false;
                                    }

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped No Speaker");
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
                                               where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && (uc.EventType == "Webcast-Live" || uc.EventType == "Webcast-VOD")
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

                var WebcastIDs = (from ce in db.Webcasts
                                  where ce.IsDeleted == false
                                  select ce.ID).ToList();

                foreach (var u in WebcastSpeakersToImport)
                {
                    Console.WriteLine("Processing Webcast Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var FacultyDisclosures = (from f in db.FacultyDisclosures
                                                  where f.UserID == u.UserID
                                                  select f).ToList();

                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Webcast Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


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

                                    Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                    Speaker.CreatedBy = ImportUserID;
                                    Speaker.LastUpdatedBy = ImportUserID;


                                    var FacultyDisclosure = (from f in FacultyDisclosures
                                                             where f.EventType == "Webcasts" && f.EventID == uc.EventID
                                                             select f).FirstOrDefault();

                                    if (FacultyDisclosure != null)
                                    {
                                        Speaker.FacultyDisclosureOnFile = true;
                                        Speaker.FacultyDisclosureID = FacultyDisclosure.ID;
                                    }
                                    else
                                    {
                                        Speaker.FacultyDisclosureOnFile = false;
                                    }

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped No Speaker");
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
                                                where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && uc.EventType == "Enduring"
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

                var EnduringIDs = (from ce in db.EnduringMaterials
                                   where ce.IsDeleted == false
                                   select ce.ID).ToList();

                foreach (var u in EnduringSpeakersToImport)
                {
                    Console.WriteLine("Processing Enduring Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var FacultyDisclosures = (from f in db.FacultyDisclosures
                                                  where f.UserID == u.UserID
                                                  select f).ToList();

                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("Enduring Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");


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

                                    Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                    Speaker.CreatedBy = ImportUserID;
                                    Speaker.LastUpdatedBy = ImportUserID;

                                    var FacultyDisclosure = (from f in FacultyDisclosures
                                                             where f.EventType == "EnduringMaterial" && f.EventID == uc.EventID
                                                             select f).FirstOrDefault();

                                    if (FacultyDisclosure != null)
                                    {
                                        Speaker.FacultyDisclosureOnFile = true;
                                        Speaker.FacultyDisclosureID = FacultyDisclosure.ID;
                                    }
                                    else
                                    {
                                        Speaker.FacultyDisclosureOnFile = false;
                                    }

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped No Speaker");
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
                                                where uc.IsDeleted == false && uc.AssignedOn > TransferStartDate && uc.IsSpeaker == true && uc.EventType == "RSSeries"
                                                group uc by uc.UserID into ucg
                                                select new
                                                {
                                                    UserID = ucg.Key,
                                                    SpeakingCredits = ucg
                                                });

                var Total = RSSeriesSpeakersToImport.Count();
                Console.Write("Importing RSSeries Speakers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var RSSeriesIDs = (from ce in db.RSSeries
                                   where ce.IsDeleted == false
                                   select ce.ID).ToList();

                foreach (var u in RSSeriesSpeakersToImport)
                {
                    Console.WriteLine("Processing RSSeries Speakers : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var FacultyDisclosures = (from f in db.FacultyDisclosures
                                                  where f.UserID == u.UserID
                                                  select f).ToList();

                        var TotalCredits = u.SpeakingCredits.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.SpeakingCredits)
                        {
                            Console.Write("RSSeries Speaker Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");

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
                                    Speaker.SpeakerHoursAssignedBy = ImportUserID;
                                    Speaker.CreatedBy = ImportUserID;
                                    Speaker.LastUpdatedBy = ImportUserID;

                                    var FacultyDisclosure = (from f in FacultyDisclosures
                                                             where f.EventType == "RSSeries" && f.EventID == uc.EventID
                                                             select f).FirstOrDefault();

                                    if (FacultyDisclosure != null)
                                    {
                                        Speaker.FacultyDisclosureOnFile = true;
                                        Speaker.FacultyDisclosureID = FacultyDisclosure.ID;
                                    }
                                    else
                                    {
                                        Speaker.FacultyDisclosureOnFile = false;
                                    }

                                    db.SaveChanges();
                                    Console.WriteLine(" - Speaker Saved");
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped No Speaker");
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

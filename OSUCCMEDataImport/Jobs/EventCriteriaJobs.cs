using OldOSUDatabase.Models;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class EventCriteriaJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            EventCriteriaC23(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC24(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC25(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC27(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC28(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC30(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC32(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC35(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EventCriteriaC37(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo23();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo24();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo25();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo27();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo30();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            GetEventInfo32();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void EventCriteriaC23(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 1
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 23 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria23 = new Models.Criteria23()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria23.Add(Criteria23);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC24(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 2
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 24 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria24 = new Models.Criteria24()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria24.Add(Criteria24);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC25(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 3
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 25 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria25 = new Models.Criteria25()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria25.Add(Criteria25);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC27(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 4
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 27 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria27 = new Models.Criteria27()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria27.Add(Criteria27);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC28(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 5
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 28 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria28 = new Models.Criteria28()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria28.Add(Criteria28);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC30(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 6
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 30 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria30 = new Models.Criteria30()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria30.Add(Criteria30);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC32(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 7
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 32 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria32 = new Models.Criteria32()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria32.Add(Criteria32);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC35(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 9
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 35 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria35 = new Models.Criteria35()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria35.Add(Criteria35);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void EventCriteriaC37(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EventCriteriaToImport = (from c in olddb.EventCriteria
                                             where c.IsDeleted == false && c.CriteriaID == 10
                                             select c).ToList();

                var Total = EventCriteriaToImport.Count();
                Console.Write("Importing Criteria 37 - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EventCriteriaToImport)
                {
                    Console.Write("Processing Criteria: (" + Index + "/" + Total + ") " + c.ID);
                    var Criteria37 = new Models.Criteria37()
                    {
                        EventType = c.EventType,
                        EventID = c.EventID
                    };
                    db.Criteria37.Add(Criteria37);
                    Console.WriteLine(" - Pending");
                    Index++;
                }
                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }

        }

        private static void GetEventInfo23()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {

                var Criteria23 = (from c in db.Criteria23
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria23.Count();
                foreach (var criteria in Criteria23)
                {
                    Console.Write("Getting Event Info 23: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityTitle = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityTitle = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityTitle = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

        private static void GetEventInfo24()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {

                var Criteria24 = (from c in db.Criteria24
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria24.Count();
                foreach (var criteria in Criteria24)
                {
                    Console.Write("Getting Event Info 24: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityTitle = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityTitle = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityTitle = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

        private static void GetEventInfo25()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {



                var Criteria25 = (from c in db.Criteria25
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria25.Count();
                foreach (var criteria in Criteria25)
                {
                    Console.Write("Getting Event Info 25: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityTitle = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityTitle = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityTitle = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

        private static void GetEventInfo27()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {

                var Criteria27 = (from c in db.Criteria27
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria27.Count();
                foreach (var criteria in Criteria27)
                {
                    Console.Write("Getting Event Info 27: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityTitle = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityTitle = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityTitle = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

        private static void GetEventInfo30()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {

                var Criteria30 = (from c in db.Criteria30
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria30.Count();
                foreach (var criteria in Criteria30)
                {
                    Console.Write("Getting Event Info 30: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityName = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityName = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityName = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

        private static void GetEventInfo32()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {

                var Criteria32 = (from c in db.Criteria32
                                  select c).ToList();

                var Index = 1;
                var Total = Criteria32.Count();
                foreach (var criteria in Criteria32)
                {
                    Console.Write("Getting Event Info 32: (" + Index + "/" + Total + ") " + criteria.ID + " ");
                    switch (criteria.EventType.ToLower())
                    {
                        case ("conference"):
                            {
                                var ConferenceInfo = (from i in db.Conferences
                                                      where i.ID == criteria.EventID
                                                      select i).FirstOrDefault();

                                if (ConferenceInfo != null)
                                {
                                    criteria.ActivityTitle = ConferenceInfo.Title;
                                    criteria.ActivityDate = ConferenceInfo.StartDate;
                                    db.SaveChanges();
                                }



                                break;
                            }
                        case ("webcast"):
                            {
                                var WebcastInfo = (from i in db.Webcasts
                                                   where i.ID == criteria.EventID
                                                   select i).FirstOrDefault();

                                if (WebcastInfo != null)
                                {
                                    criteria.ActivityTitle = WebcastInfo.Title;
                                    criteria.ActivityDate = WebcastInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }
                        case ("enduringmaterial"):
                            {
                                var EnduringInfo = (from i in db.EnduringMaterials
                                                    where i.ID == criteria.EventID
                                                    select i).FirstOrDefault();

                                if (EnduringInfo != null)
                                {
                                    criteria.ActivityTitle = EnduringInfo.Title;
                                    criteria.ActivityDate = EnduringInfo.StartDate;
                                    db.SaveChanges();
                                }

                                break;
                            }

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

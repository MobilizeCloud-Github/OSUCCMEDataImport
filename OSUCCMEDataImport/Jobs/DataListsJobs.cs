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
    class DataListsJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();


            CommercialSupport(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            Exhibitors(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            Expenses(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            Revenue(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            InKind(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");


            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void CommercialSupport(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var CommercialSupports = (from c in olddb.CommercialSupporters
                                          where c.IsDeleted == false
                                          group c by new { c.EventID, c.EventType } into cg
                                          select new
                                          {
                                              EventID = cg.Key.EventID,
                                              EventType = cg.Key.EventType,
                                              Records = cg
                                          }).ToList();

                var Total = CommercialSupports.Count();
                Console.Write("Importing Commercial Support - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var c in CommercialSupports)
                {
                    Console.Write("Processing Commercial Support : (" + Index + "/" + Total + ") " + c.EventID + " " + c.EventType + " ");

                    switch (c.EventType.ToLower())
                    {
                        case "conference":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (ConferenceIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Commercial Support : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "Conference",
                                                EventID = EventID.Value,
                                                Type = "Monetary",
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "enduring":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (EnduringIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Commercial Support : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "EnduringMaterial",
                                                EventID = EventID.Value,
                                                Type = "Monetary",
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "rsseries":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (RSSeriesIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Commercial Support : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "RSSeries",
                                                EventID = EventID.Value,
                                                Type = "Monetary",
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "webcast":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (WebcastIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Commercial Support : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "Webcasts",
                                                EventID = EventID.Value,
                                                Type = "Monetary",
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
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

        private static void Exhibitors(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Displays = (from c in olddb.Displays
                                          where c.IsDeleted == false
                                          group c by new { c.EventID, c.EventType } into cg
                                          select new
                                          {
                                              EventID = cg.Key.EventID,
                                              EventType = cg.Key.EventType,
                                              Records = cg
                                          }).ToList();

                var Total = Displays.Count();
                Console.Write("Importing Displays - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var c in Displays)
                {
                    Console.Write("Processing Displays : (" + Index + "/" + Total + ") " + c.EventID + " " + c.EventType + " ");

                    switch (c.EventType.ToLower())
                    {
                        case "conference":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (ConferenceIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventAdvertisers>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Display : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventAdvertisers()
                                            {
                                                EventType = "Conference",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventAdvertisers.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "enduring":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (EnduringIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventAdvertisers>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Display : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventAdvertisers()
                                            {
                                                EventType = "EnduringMaterial",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventAdvertisers.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "rsseries":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (RSSeriesIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventAdvertisers>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Display : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventAdvertisers()
                                            {
                                                EventType = "RSSeries",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventAdvertisers.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "webcast":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (WebcastIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventAdvertisers>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Display : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventAdvertisers()
                                            {
                                                EventType = "Webcasts",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventAdvertisers.AddRange(CSRange);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
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

        private static void Expenses(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Expenses = (from c in olddb.Expenses
                                where c.IsDeleted == false
                                group c by new { c.EventID, c.EventType } into cg
                                select new
                                {
                                    EventID = cg.Key.EventID,
                                    EventType = cg.Key.EventType,
                                    Records = cg
                                }).ToList();

                var Total = Expenses.Count();
                Console.Write("Importing Expenses - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var c in Expenses)
                {
                    Console.Write("Processing Expenses : (" + Index + "/" + Total + ") " + c.EventID + " " + c.EventType + " ");

                    switch (c.EventType.ToLower())
                    {
                        case "conference":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (ConferenceIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventExpenses>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Expense : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventExpenses()
                                            {
                                                EventType = "Conference",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventExpenses.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "enduring":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (EnduringIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventExpenses>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Expense : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventExpenses()
                                            {
                                                EventType = "EnduringMaterial",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventExpenses.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "rsseries":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (RSSeriesIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventExpenses>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Expense : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventExpenses()
                                            {
                                                EventType = "RSSeries",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventExpenses.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "webcast":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (WebcastIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventExpenses>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Expense : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventExpenses()
                                            {
                                                EventType = "Webcasts",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventExpenses.AddRange(CSRange);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
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
        private static void Revenue(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Revenues = (from c in olddb.Revenues
                                where c.IsDeleted == false
                                group c by new { c.EventID, c.EventType } into cg
                                select new
                                {
                                    EventID = cg.Key.EventID,
                                    EventType = cg.Key.EventType,
                                    Records = cg
                                }).ToList();

                var Total = Revenues.Count();
                Console.Write("Importing Revenues - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var c in Revenues)
                {
                    Console.Write("Processing Revenues : (" + Index + "/" + Total + ") " + c.EventID + " " + c.EventType + " ");

                    switch (c.EventType.ToLower())
                    {
                        case "conference":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (ConferenceIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventRevenues>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventRevenues()
                                            {
                                                EventType = "Conference",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                Type = "Offline Registration Fees",
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            if (cs.Name.Contains("grant"))
                                            {
                                                NewEventSupport.Type = "Government Monetary Grants";
                                            }
                                            if (cs.Name.Contains("gift"))
                                            {
                                                NewEventSupport.Type = "Private Monetary Donations";
                                            }

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventRevenues.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "enduring":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (EnduringIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventRevenues>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventRevenues()
                                            {
                                                EventType = "EnduringMaterial",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                Type = "Offline Registration Fees",
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            if (cs.Name.Contains("grant"))
                                            {
                                                NewEventSupport.Type = "Government Monetary Grants";
                                            }
                                            if (cs.Name.Contains("gift"))
                                            {
                                                NewEventSupport.Type = "Private Monetary Donations";
                                            }

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventRevenues.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "rsseries":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (RSSeriesIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventRevenues>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventRevenues()
                                            {
                                                EventType = "RSSeries",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                Type = "Offline Registration Fees",
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            if (cs.Name.Contains("grant"))
                                            {
                                                NewEventSupport.Type = "Government Monetary Grants";
                                            }
                                            if (cs.Name.Contains("gift"))
                                            {
                                                NewEventSupport.Type = "Private Monetary Donations";
                                            }

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventRevenues.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "webcast":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (WebcastIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventRevenues>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventRevenues()
                                            {
                                                EventType = "Webcasts",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                Type = "Offline Registration Fees",
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            if(cs.Name.Contains("grant"))
                                            {
                                                NewEventSupport.Type = "Government Monetary Grants";
                                            }
                                            if (cs.Name.Contains("gift")){
                                                NewEventSupport.Type = "Private Monetary Donations";
                                            }

                                            decimal OutAmount = 0.0m;
                                            decimal.TryParse(cs.Value, out OutAmount);

                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventRevenues.AddRange(CSRange);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
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

        private static void InKind(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var InKinds = (from c in olddb.InKind
                                where c.IsDeleted == false
                                group c by new { c.EventID, c.EventType } into cg
                                select new
                                {
                                    EventID = cg.Key.EventID,
                                    EventType = cg.Key.EventType,
                                    Records = cg
                                }).ToList();

                var Total = InKinds.Count();
                Console.Write("Importing InKinds - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var c in InKinds)
                {
                    Console.Write("Processing InKinds : (" + Index + "/" + Total + ") " + c.EventID + " " + c.EventType + " ");

                    switch (c.EventType.ToLower())
                    {
                        case "conference":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (ConferenceIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "Conference",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };


                                            decimal OutAmount = 0.0m;
                                            if(decimal.TryParse(cs.Value, out OutAmount))
                                            {
                                                NewEventSupport.Type = "Monetary";
                                            }
                                            else
                                            {
                                                NewEventSupport.Type = "In Kind";
                                                NewEventSupport.Name = cs.Name + " - " + cs.Value;
                                            }
                                            NewEventSupport.Value = OutAmount;


                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "enduring":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (EnduringIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "EnduringMaterial",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            if (decimal.TryParse(cs.Value, out OutAmount))
                                            {
                                                NewEventSupport.Type = "Monetary";
                                            }
                                            else
                                            {
                                                NewEventSupport.Type = "In Kind";
                                                NewEventSupport.Name = cs.Name + " - " + cs.Value;
                                            }
                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "rsseries":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (RSSeriesIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing Revenue : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "RSSeries",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            if (decimal.TryParse(cs.Value, out OutAmount))
                                            {
                                                NewEventSupport.Type = "Monetary";
                                            }
                                            else
                                            {
                                                NewEventSupport.Type = "In Kind";
                                                NewEventSupport.Name = cs.Name + " - " + cs.Value;
                                            }
                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();
                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
                        case "webcast":
                            {
                                if (c.EventID != null)
                                {
                                    var EventID = c.EventID;
                                    if (WebcastIDs.Contains(EventID.Value))
                                    {
                                        var CSRange = new List<Models.EventSupport>();
                                        var TotalSupport = c.Records.Count();
                                        var SupportIndex = 1;
                                        foreach (var cs in c.Records)
                                        {
                                            Console.Write("Processing InKind : (" + Index + "/" + Total + ") (" + SupportIndex + "/" + TotalSupport + ") " + c.EventID + " " + c.EventType + " ");
                                            var NewEventSupport = new EventSupport()
                                            {
                                                EventType = "Webcasts",
                                                EventID = EventID.Value,
                                                Name = cs.Name,
                                                IsDeleted = false,
                                                CreatedOn = DateTime.Now,
                                                CreatedBy = ImportUserID,
                                                LastUpdatedOn = DateTime.Now,
                                                LastUpdatedBy = ImportUserID
                                            };

                                            decimal OutAmount = 0.0m;
                                            if (decimal.TryParse(cs.Value, out OutAmount))
                                            {
                                                NewEventSupport.Type = "Monetary";
                                            }
                                            else
                                            {
                                                NewEventSupport.Type = "In Kind";
                                                NewEventSupport.Name = cs.Name + " - " + cs.Value;
                                            }
                                            NewEventSupport.Value = OutAmount;

                                            CSRange.Add(NewEventSupport);
                                            Console.WriteLine(" - Saved");
                                            SupportIndex++;
                                        }
                                        db.EventSupport.AddRange(CSRange);
                                        db.SaveChanges();

                                    }
                                    else
                                    {
                                        Console.WriteLine(" - Skipped");
                                    }
                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                break;
                            }
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

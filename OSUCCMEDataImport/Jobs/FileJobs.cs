using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OSUCCMEDataImport.Jobs
{
    class FileJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            ConferenceFiles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            RSSeriesFiles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            WebcastFiles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringFiles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void ConferenceFiles(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Files = (from c in olddb.ConferenceFiles
                                                        where c.IsDeleted == false && c.Filename != "" && c.Filename != null
                             orderby c.ConferenceID
                                                        select c).ToList();

                var Total = Files.Count();
                Console.Write("Importing Conference Files - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var Rank = 1;
                int? LastConferenceID = null;
                foreach (var c in Files)
                {
                    Console.Write("Processing Conferences Files : (" + Index + "/" + Total + ") " + c.ID + " ");

                    if (ConferenceIDs.Contains(c.ConferenceID))
                    {
                        var FullUrl = "";
                        if(c.Filename.StartsWith("~/"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("~/", "");
                        }
                        else if (c.Filename.StartsWith("../"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("../", "");
                        }
                        else
                        {
                            FullUrl = c.Filename;
                        }

                        var NewFile = new Models.ConferenceFiles()
                        {
                            ConferenceID = c.ConferenceID,
                            Title = CommonFunctions.GetTrimedString(c.Title, 128),
                            Description = CommonFunctions.GetTrimedString(c.Description, 512),
                            FileName = FileFunctions.GetFileNameFromPath(FullUrl),
                            Location = FileFunctions.GetNewFileLocationFromPath(FullUrl),
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedOn = DateTime.Now,
                            LastUpdatedBy = ImportUserID,
                            IsDeleted = false,
                            LoginRequired = c.IsRegisteredOnly,
                            RegisteredRequired = c.IsRegisteredOnly
                        };

                        if(LastConferenceID != c.ConferenceID)
                        {
                            Rank = 1;
                            LastConferenceID = c.ConferenceID;
                        }
                        else
                        {
                            Rank++;
                        }
                        NewFile.Rank = Rank;

                        db.ConferenceFiles.Add(NewFile);
                        if (Index % 5 == 0)
                        {
                            db.SaveChanges();
                            Console.WriteLine(" - Saved");
                        }
                        else
                        {
                            Console.WriteLine(" - Pending");
                        }

                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
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

        private static void RSSeriesFiles(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Files = (from c in olddb.RSSeriesFiles
                             where c.IsDeleted == false && c.RSSeriesID != null && c.Filename != "" && c.Filename != null
                             orderby c.RSSeriesID
                             select c).ToList();

                var Total = Files.Count();
                Console.Write("Importing RSSeries Files - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var RSSeriesIDs = (from c in db.RSSeries
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var Rank = 1;
                int? LastRSSeriesID = null;
                foreach (var c in Files)
                {
                    Console.Write("Processing RSSeries Files : (" + Index + "/" + Total + ") " + c.ID + " ");

                    if (RSSeriesIDs.Contains(c.RSSeriesID.Value))
                    {
                        var FullUrl = "";
                        if (c.Filename.StartsWith("~/"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("~/", "");
                        }
                        else if (c.Filename.StartsWith("../"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("../", "");
                        }
                        else
                        {
                            FullUrl = c.Filename;
                        }

                        var NewFile = new Models.RSSeriesFiles()
                        {
                            RSSeriesID = c.RSSeriesID.Value,
                            Title = CommonFunctions.GetTrimedString(c.Title, 128),
                            Description = CommonFunctions.GetTrimedString(c.Description, 512),
                            FileName = FileFunctions.GetFileNameFromPath(FullUrl),
                            Location = FileFunctions.GetNewFileLocationFromPath(FullUrl),
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedOn = DateTime.Now,
                            LastUpdatedBy = ImportUserID,
                            IsDeleted = false,
                            LoginRequired = false,
                            RegisteredRequired = false
                        };

                        if (LastRSSeriesID != c.RSSeriesID)
                        {
                            Rank = 1;
                            LastRSSeriesID = c.RSSeriesID;
                        }
                        else
                        {
                            Rank++;
                        }
                        NewFile.Rank = Rank;

                        db.RSSeriesFiles.Add(NewFile);
                        if (Index % 5 == 0)
                        {
                            db.SaveChanges();
                            Console.WriteLine(" - Saved");
                        }
                        else
                        {
                            Console.WriteLine(" - Pending");
                        }

                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
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

        private static void WebcastFiles(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Files = (from c in olddb.WebcastFiles
                             where c.IsDeleted == false && c.WebcastID != null && c.Filename != "" && c.Filename != null
                             orderby c.WebcastID
                             select c).ToList();

                var Total = Files.Count();
                Console.Write("Importing Webcast Files - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var Rank = 1;
                int? LastWebcastID = null;
                foreach (var c in Files)
                {
                    Console.Write("Processing Webcast Files : (" + Index + "/" + Total + ") " + c.ID + " ");

                    if (WebcastIDs.Contains(c.WebcastID.Value))
                    {
                        var FullUrl = "";
                        if (c.Filename.StartsWith("~/"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("~/", "");
                        }
                        else if (c.Filename.StartsWith("../"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("../", "");
                        }
                        else
                        {
                            FullUrl = c.Filename;
                        }

                        var NewFile = new Models.WebcastFiles()
                        {
                            WebcastID = c.WebcastID.Value,
                            Title = CommonFunctions.GetTrimedString(c.Title, 128),
                            Description = CommonFunctions.GetTrimedString(c.Description, 512),
                            FileName = FileFunctions.GetFileNameFromPath(FullUrl),
                            Location = FileFunctions.GetNewFileLocationFromPath(FullUrl),
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedOn = DateTime.Now,
                            LastUpdatedBy = ImportUserID,
                            IsDeleted = false,
                            LoginRequired = false,
                            RegisteredRequired = false
                        };

                        if (LastWebcastID != c.WebcastID)
                        {
                            Rank = 1;
                            LastWebcastID = c.WebcastID;
                        }
                        else
                        {
                            Rank++;
                        }
                        NewFile.Rank = Rank;

                        db.WebcastFiles.Add(NewFile);
                        if (Index % 5 == 0)
                        {
                            db.SaveChanges();
                            Console.WriteLine(" - Saved");
                        }
                        else
                        {
                            Console.WriteLine(" - Pending");
                        }

                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
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

        private static void EnduringFiles(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var Files = (from c in olddb.EnduringMaterialFiles
                             where c.IsDeleted == false && c.EnduringMaterialID != null && c.Filename != "" && c.Filename != null
                             orderby c.EnduringMaterialID
                             select c).ToList();

                var Total = Files.Count();
                Console.Write("Importing Enduring Material Files - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var EnduringIDs = (from c in db.EnduringMaterials
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                var Rank = 1;
                int? LastEnduringID = null;
                foreach (var c in Files)
                {
                    Console.Write("Processing Enduring Material Files : (" + Index + "/" + Total + ") " + c.ID + " ");

                    if (EnduringIDs.Contains(c.EnduringMaterialID.Value))
                    {
                        var FullUrl = "";
                        if (c.Filename.StartsWith("~/"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("~/", "");
                        }
                        else if (c.Filename.StartsWith("../"))
                        {
                            FullUrl = "http://ccme.osu.edu/" + c.Filename.Replace("../", "");
                        }
                        else
                        {
                            FullUrl = c.Filename;
                        }

                        var NewFile = new Models.EnduringMaterialFiles()
                        {
                            EnduringMaterialID = c.EnduringMaterialID.Value,
                            Title = CommonFunctions.GetTrimedString(c.Title, 128),
                            Description = CommonFunctions.GetTrimedString(c.Description, 512),
                            FileName = FileFunctions.GetFileNameFromPath(FullUrl),
                            Location = FileFunctions.GetNewFileLocationFromPath(FullUrl),
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedOn = DateTime.Now,
                            LastUpdatedBy = ImportUserID,
                            IsDeleted = false,
                            LoginRequired = false,
                            RegisteredRequired = false
                        };

                        if (LastEnduringID != c.EnduringMaterialID)
                        {
                            Rank = 1;
                            LastEnduringID = c.EnduringMaterialID;
                        }
                        else
                        {
                            Rank++;
                        }
                        NewFile.Rank = Rank;

                        db.EnduringMaterialFiles.Add(NewFile);
                        if (Index % 5 == 0)
                        {
                            db.SaveChanges();
                            Console.WriteLine(" - Saved");
                        }
                        else
                        {
                            Console.WriteLine(" - Pending");
                        }

                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
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
    }
}

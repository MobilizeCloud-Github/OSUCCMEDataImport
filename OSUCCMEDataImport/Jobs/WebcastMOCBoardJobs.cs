using OldOSUDatabase.Models;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class WebcastMOCBoardJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();


            WebcastMOCBoards(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            WebcastACCME(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void WebcastMOCBoards(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var WebcastMOCBoardsToImport = (from c in olddb.WebcastMOCBoards
                                                where c.IsDeleted == false
                                                select c).ToList();

                var Total = WebcastMOCBoardsToImport.Count();
                Console.Write("Importing Webcast MOC Boards - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastMOCBoardsToImport)
                {
                    var BoardID = (from b in db.Boards
                                   where b.Abbreviation == c.Board
                                   select b.ID).FirstOrDefault();

                    Console.Write("Processing Webcast MOC Boards: (" + Index + "/" + Total + ") " + c.ID);
                    var board = new Models.WebcastBoards()
                    {
                        WebcastID = c.WebcastID,
                        BoardID = BoardID
                    };
                    db.WebcastBoards.Add(board);
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

        private static void WebcastACCME(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var WebcastACCMEToImport = (from c in olddb.WebcastsACCMEIDs
                                            where c.IsDeleted == false && c.Year > 2011
                                            select c).ToList();

                var Total = WebcastACCMEToImport.Count();
                Console.Write("Importing Webcast ACCME - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastACCMEToImport)
                {
                    Console.Write("Processing Webcast ACCME: (" + Index + "/" + Total + ") " + c.ID);
                    var accme = new Models.WebcastACCMEIDs()
                    {
                        WebcastID = c.WebcastID,
                        Year = c.Year,
                        ACCMEActivityID = c.ACCMEActivityID
                    };
                    db.WebcastACCMEIDs.Add(accme);
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

    }
}

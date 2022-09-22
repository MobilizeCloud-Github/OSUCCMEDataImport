using OSUCCMEDataImport.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class TruncateJobs
    {
        public static void Process()
        {
            var db = new NewOSUCCMEEntities();
            var TablesToProcess = new List<string>()
            {
                "AspNetUserRoles",
                "AspNetUsers",
                "ConferenceCreditImportErrors",
                "ConferenceCreditImportRecords",
                "ConferenceCreditImports",
                "ConferenceEvaluationCompetencies",
                "ConferenceEvaluationPanels",
                "ConferenceEvaluationProgramResults",
                "ConferenceEvaluations",
                "ConferenceEvaluationSpeakers",
                "ConferenceFiles",
                "ConferenceJointProviders",
                "ConferenceNotes",
                "ConferenceOptions",
                "ConferenceOptionsGroups"
            };

            var TotalTables = TablesToProcess.Count();
            Console.Write("Truncating and Reseeding Tables - Starting ");
            Console.WriteLine(TablesToProcess.Count() + " Table to Process");
            var Index = 1;
            foreach (var TableToProcess in TablesToProcess)
            {
                Console.Write("Processing Table: " + TableToProcess + " (" + Index + "/" + TotalTables + ") ");
                var SQLTruncate = $"TRUNCATE TABLE {TableToProcess}";
                var Status = db.Database.ExecuteSqlCommand(SQLTruncate);
                if (Status == 1)
                {
                    Console.WriteLine(" - Truncate Success");
                }
                else
                {
                    Console.WriteLine(" - Truncate Failure");
                    throw new Exception("Truncate Failure - " + TableToProcess);
                }

                var SQLResetIdentity = "DBCC CHECKIDENT ('" + TableToProcess + "', RESEED, 0)";
                var status = db.Database.ExecuteSqlCommand(SQLResetIdentity);

                if (Status == 1)
                {
                    Console.WriteLine(" - Reseed Success");
                }
                else
                {
                    Console.WriteLine(" - Reseed Failure");
                    throw new Exception("Reseed Failure - " + TableToProcess);
                }
                Index++;
            }
            Console.Write("Truncating and Reseeding Tables - Complete");
        }
    }
}

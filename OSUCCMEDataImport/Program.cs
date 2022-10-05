using OSUCCMEDataImport.Jobs;
using System;
using System.Collections.Generic;

namespace OSUCCMEDataImport
{
    class Program
    {
        static void Main(string[] args)
        {
        Selection:
            Console.WriteLine("Which job would you like to process:");
            Console.WriteLine(" 1. Import Job User");
            Console.WriteLine(" 2. System Data");
            Console.WriteLine(" 3. User Data");
            Console.WriteLine(" 4. Conferences");
            Console.WriteLine(" 5. Webcasts");
            Console.WriteLine(" 6. Enduring");
            Console.WriteLine(" 7. RSSeries");
            Console.WriteLine(" 8. Hospitals");
            Console.WriteLine(" 9. FacultyDisclosures");
            Console.WriteLine(" 10. Conference Speakers");
            Console.WriteLine(" 11. Webcasts Speakers");
            Console.WriteLine(" 12. RSSeries Speakers");
            Console.WriteLine(" 13. Enduring Speakers");
            Console.WriteLine(" 14. Files");
            Console.WriteLine(" 15. Criteria");
            Console.WriteLine(" 16. Conference Options");
            Console.WriteLine(" 17. Webcast MOC Boards and ACCME");
            Console.WriteLine(" 18. Data Lists");
            Console.WriteLine("");
            Console.WriteLine("Please select 1-15 and hit enter.");

            var JobNumber = Console.ReadLine();
            var ImportUserID = "b942c30a-575c-4263-8028-28fad69beacf";
            var ApprovedJobs = new List<string> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21" };
            try
            {

                if (ApprovedJobs.Contains(JobNumber))
                {
                    switch (JobNumber)
                    {
                        case "1":
                            {
                                ImportJobUser.Process();
                                break;
                            }
                        case "2":
                            {
                                //Nothing for Now
                                Console.WriteLine("Nothing for now");
                                break;
                            }
                        case "3":
                            {
                                UserJobs.Process(ImportUserID);
                                break;
                            }
                        case "4":
                            {
                                ConferenceJobs.Process(ImportUserID);
                                break;
                            }
                        case "5":
                            {
                                WebcastJobs.Process(ImportUserID);
                                break;
                            }
                        case "6":
                            {
                                EnduringJobs.Process(ImportUserID);
                                break;
                            }
                        case "7":
                            {
                                RSSeriesJobs.Process(ImportUserID);
                                break;
                            }
                        case "8":
                            {
                                HospitalJobs.Process(ImportUserID);
                                break;
                            }
                        case "9":
                            {
                                FacultyDisclosureJobs.Process(ImportUserID);
                                break;
                            }                        
                        case "10":
                            {
                                ConferenceSpeakerJobs.Process(ImportUserID);
                                break;
                            }                        
                        case "11":
                            {
                                WebcastsSpeakerJobs.Process(ImportUserID);
                                break;
                            }                        
                        case "12":
                            {
                                RSSeriesSpeakerJobs.Process(ImportUserID);
                                break;
                            }                        
                        case "13":
                            {
                                EnduringSpeakerJobs.Process(ImportUserID);
                                break;
                            }
                        case "14":
                            {
                                FileJobs.Process(ImportUserID);
                                break;
                            }
                        case "15":
                            {
                                EventCriteriaJobs.Process(ImportUserID);
                                break;
                            }
                        case "16":
                            {
                                ConferenceOptionsImportJobs.Process(ImportUserID);
                                break;
                            }
                        case "17":
                            {
                                WebcastMOCBoardJobs.Process(ImportUserID);
                                break;
                            }
                        case "18":
                            {
                                DataListsJobs.Process(ImportUserID);
                                break;
                            }
                    }
                }
                else
                {
                    Console.WriteLine("That was an invalid selection, please try again.");
                    Console.WriteLine("");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine("");
                Console.WriteLine(e.Message);
            }

            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            goto Selection;
        }
    }
}

﻿using OSUCCMEDataImport.Jobs;
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
            Console.WriteLine(" 10. Conference Credits & MOC");
            Console.WriteLine(" 11. Conference Speakers");
            Console.WriteLine(" 12. Webcasts Credits & MOC");
            Console.WriteLine(" 13. Webcasts Speakers");
            Console.WriteLine(" 14. RSSeries Credits & MOC");
            Console.WriteLine(" 15. RSSeries Speakers");
            Console.WriteLine(" 16. Enduring Credits & MOC");
            Console.WriteLine(" 17. Enduring Speakers");
            Console.WriteLine(" 18. Files");
            Console.WriteLine("");
            Console.WriteLine("Please select 1-11 and hit enter.");

            var JobNumber = Console.ReadLine();
            var ImportUserID = "b942c30a-575c-4263-8028-28fad69beacf";
            var ApprovedJobs = new List<string> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18" };
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
                                ConferenceCreditJobs.Process(ImportUserID);
                                break;
                            }
                        case "11":
                            {
                                ConferenceSpeakerJobs.Process(ImportUserID);
                                break;
                            }
                        case "12":
                            {
                                WebcastsCreditJobs.Process(ImportUserID);
                                break;
                            }
                        case "13":
                            {
                                WebcastsSpeakerJobs.Process(ImportUserID);
                                break;
                            }
                        case "14":
                            {
                                RSSeriesCreditJobs.Process(ImportUserID);
                                break;
                            }
                        case "15":
                            {
                                RSSeriesSpeakerJobs.Process(ImportUserID);
                                break;
                            }
                        case "16":
                            {
                                EnduringCreditJobs.Process(ImportUserID);
                                break;
                            }
                        case "17":
                            {
                                EnduringSpeakerJobs.Process(ImportUserID);
                                break;
                            }
                        case "18":
                            {
                                FileJobs.Process(ImportUserID);
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

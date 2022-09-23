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
            Console.WriteLine(" 9. Registrations & Credits");
            Console.WriteLine("");
            Console.WriteLine("Please select 1-9 and hit enter.");
        
            var JobNumber = Console.ReadLine();
            var ImportUserID = "b942c30a-575c-4263-8028-28fad69beacf";
            var ApprovedJobs = new List<string> { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
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
                                break;
                            }
                        case "5":
                            {
                                break;
                            }
                        case "6":
                            {
                                break;
                            }
                        case "7":
                            {
                                break;
                            }
                        case "8":
                            {
                                HospitalJobs.Process(ImportUserID);
                                break;
                            }
                        case "9":
                            {
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
            catch(Exception e)
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

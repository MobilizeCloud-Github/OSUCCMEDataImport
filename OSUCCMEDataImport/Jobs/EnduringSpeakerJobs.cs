using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class EnduringSpeakerJobs
    {
        public static void Process(string ImportUserID)
        {
            EnduringSpeakers(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");


        }

        private static void EnduringSpeakers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

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

                foreach (var u in EnduringSpeakersToImport)
                {
                    Console.Write("Processing Enduring Speakers : (" + Index + "/" + Total + ") " + u.UserID);

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

                                var NewEnduringSpeaker = new EnduringMaterialSpeakers()
                                {
                                    EnduringMaterialID = uc.EventID ?? 0,
                                    UserID = uc.UserID,
                                    SpeakerHours = OutSpeakerHours,
                                    SpeakerHoursAssignedOn = uc.AssignedOn,
                                    CreatedOn = uc.AssignedOn ?? DateTime.Now,
                                    LastUpdatedOn = uc.AssignedOn ?? DateTime.Now,
                                    SpeakerCheckListOnFile = false
                                };

                                if (CommonFunctions.DoesUserExist(db, uc.UserID))
                                {
                                    NewEnduringSpeaker.SpeakerHoursAssignedBy = uc.AssignedBy;
                                    NewEnduringSpeaker.CreatedBy = uc.AssignedBy;
                                    NewEnduringSpeaker.LastUpdatedBy = uc.AssignedBy;
                                }
                                else
                                {
                                    NewEnduringSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                    NewEnduringSpeaker.CreatedBy = ImportUserID;
                                    NewEnduringSpeaker.LastUpdatedBy = ImportUserID;
                                }

                                var FDOnFile = (from f in db.FacultyDisclosures
                                                where f.UserID == uc.UserID && f.EventType == "RSSeries" && f.EventID == uc.EventID
                                                select f).Any();

                                NewEnduringSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                db.EnduringMaterialSpeakers.Add(NewEnduringSpeaker);
                                db.SaveChanges();
                                Console.WriteLine(" - Speaker Saved");

                                var NewSpeakerTopic = new EnduringMaterialSpeakerTopics()
                                {
                                    EnduringMaterialID = uc.EventID ?? 0,
                                    EnduringMaterialSpeakerID = NewEnduringSpeaker.ID,
                                    Topic = Enduring.Where(x => x.ID == uc.EventID).Select(x => x.Title).FirstOrDefault(),
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.EnduringMaterialSpeakerTopics.Add(NewSpeakerTopic);
                                db.SaveChanges();
                                Console.WriteLine(" - Topic Saved");
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

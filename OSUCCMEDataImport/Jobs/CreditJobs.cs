using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class CreditJobs
    {
        public static void Process(string ImportUserID)
        {
            //FacultyDisclosures(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            Credits(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");


        }

        private static void FacultyDisclosures(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var SpeakerDisclosureToImport = (from s in olddb.SpeakerDisclosures
                                                 where s.IsDeleted == false
                                                 select s).ToList();

                var Total = SpeakerDisclosureToImport.Count();
                Console.Write("Importing User Credits - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var sd in SpeakerDisclosureToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + sd.ID);
                    if (CommonFunctions.DoesUserExist(db, sd.UserID))
                    {
                        var NewFacultyDisclosure = new FacultyDisclosures()
                        {
                            Type = sd.EventType,
                            UserID = sd.UserID,
                            ResolutionOfConflictPlannersActivityDirectors = "",
                            ResolutionOfConflictPresentersAuthors = "",
                            NonConflictedCoDirector = "",
                            FullName = CommonFunctions.GetUserFullName(sd.UserID),
                            Expires = sd.Expire ?? DateTime.Now,
                            IsDeleted = false,
                            CreatedOn = sd.Submitted ?? DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedBy = ImportUserID,
                            LastUpdatedOn = sd.Submitted ?? DateTime.Now
                        };

                        NewFacultyDisclosure.Disclosure = false;

                        if (sd.EventType != "Annual" && sd.EventType != null && sd.EventType != "")
                        {
                            switch (sd.EventType)
                            {
                                case "WebCast":
                                    {
                                        NewFacultyDisclosure.EventType = "Webcasts";
                                        break;
                                    }
                                case "Conference":
                                    {
                                        NewFacultyDisclosure.EventType = "Conference";
                                        break;
                                    }
                                case "Enduring":
                                    {
                                        NewFacultyDisclosure.EventType = "EnduringMaterial";
                                        break;
                                    }
                                case "RSSeries":
                                    {
                                        NewFacultyDisclosure.EventType = "RSSeries";
                                        break;
                                    }

                            }

                        }
                        else
                        {
                            NewFacultyDisclosure.EventType = null;
                        }

                        if (sd.EventID != 0)
                        {
                            NewFacultyDisclosure.EventID = sd.EventID;
                        }
                        db.FacultyDisclosures.Add(NewFacultyDisclosure);
                        db.SaveChanges();

                        if (sd.Grants == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.GrantsName, "Grants");
                        }
                        if (sd.Consultant == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.ConsultantName, "Consultant");
                        }
                        if (sd.Advisory == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.AdvisoryName, "Advisory");
                        }
                        if (sd.Stockholder == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.StockholderName, "Stockholder");
                        }
                        if (sd.Honararium == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.HonarariumName, "Honararium");
                        }
                        if (sd.Editorial == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.EditorialName, "Editorial");
                        }
                        if (sd.Other == true)
                        {
                            NewFacultyDisclosure.Disclosure = true;
                            CommonFunctions.SaveCommercialInterest(NewFacultyDisclosure.ID, sd.OtherName, "Other");
                        }

                        db.SaveChanges();
                        Console.WriteLine(" - Saved");
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

        private static void Credits(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var UserCreditsToImport = (from uc in olddb.UserCredits
                                           where uc.IsDeleted == false
                                           select uc).ToList();

                var Total = UserCreditsToImport.Count();
                Console.Write("Importing User Credits - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in UserCreditsToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + u.ID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        switch (u.EventType)
                        {
                            case "Conference":
                                {
                                    if (u.IsSpeaker == true)
                                    {
                                        var ConferenceExist = (from ce in db.Conferences
                                                               where ce.ID == u.EventID && ce.IsDeleted == false
                                                               select ce.ID).FirstOrDefault();

                                        if (ConferenceExist > 0)
                                        {
                                            decimal OutSpeakerHours = 0.0m;
                                            decimal.TryParse(u.CreditHours.ToString(), out OutSpeakerHours);

                                            var NewConferenceSpeaker = new ConferenceSpeakers()
                                            {
                                                ConferenceID = u.EventID ?? 0,
                                                UserID = u.UserID,
                                                SpeakerHours = OutSpeakerHours,
                                                SpeakerHoursAssignedOn = u.AssignedOn,
                                                CreatedOn = u.AssignedOn ?? DateTime.Now,
                                                LastUpdatedOn = u.AssignedOn ?? DateTime.Now,
                                                SpeakerCheckListOnFile = false
                                            };

                                            if (CommonFunctions.DoesUserExist(db, u.UserID))
                                            {
                                                NewConferenceSpeaker.SpeakerHoursAssignedBy = u.AssignedBy;
                                                NewConferenceSpeaker.CreatedBy = u.AssignedBy;
                                                NewConferenceSpeaker.LastUpdatedBy = u.AssignedBy;
                                            }
                                            else
                                            {
                                                NewConferenceSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                                NewConferenceSpeaker.CreatedBy = ImportUserID;
                                                NewConferenceSpeaker.LastUpdatedBy = ImportUserID;
                                            }

                                            var FDOnFile = (from f in db.FacultyDisclosures
                                                            where f.UserID == u.UserID && f.EventType == "Conference" && f.EventID == u.EventID
                                                            select f).Any();

                                            NewConferenceSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                            db.ConferenceSpeakers.Add(NewConferenceSpeaker);
                                            db.SaveChanges();
                                        }
                                        Console.WriteLine(" - Saved");

                                    }
                                    else
                                    {
                                        var Registration = (from c in db.ConferenceRegistrations
                                                            where c.ConferenceID == u.EventID && c.UserID == u.UserID
                                                            select c).FirstOrDefault();

                                        if (Registration != null)
                                        {

                                            if (u.IsMOC == true)
                                            {
                                                decimal OutMOCPoints = 0.0m;
                                                decimal.TryParse(u.CreditHours.ToString(), out OutMOCPoints);

                                                Registration.MOCPoints = OutMOCPoints;
                                                Registration.MOCPointsAssignedOn = u.AssignedOn;
                                                if (CommonFunctions.DoesUserExist(db, u.UserID))
                                                {
                                                    Registration.MOCPointsAssignedBy = u.AssignedBy;
                                                }
                                                else
                                                {
                                                    Registration.MOCPointsAssignedBy = ImportUserID;
                                                }

                                            }
                                            else
                                            {
                                                decimal OutCreditHours = 0.0m;
                                                decimal.TryParse(u.CreditHours.ToString(), out OutCreditHours);

                                                Registration.CreditHours = OutCreditHours;
                                                Registration.CreditAssignedOn = u.AssignedOn;
                                                if (CommonFunctions.DoesUserExist(db, u.UserID))
                                                {
                                                    Registration.CreditAssignedBy = u.AssignedBy;
                                                }
                                                else
                                                {
                                                    Registration.CreditAssignedBy = ImportUserID;
                                                }
                                            }

                                            db.SaveChanges();
                                        }
                                        Console.WriteLine(" - Saved");
                                    }

                                    break;
                                }
                            case "WebCast-Live":
                            case "WebCast-VOD":
                                {
                                    if (u.IsSpeaker == true)
                                    {
                                        var WebcastExist = (from ce in db.Webcasts
                                                            where ce.ID == u.EventID && ce.IsDeleted == false
                                                            select ce.ID).FirstOrDefault();

                                        if (WebcastExist > 0)
                                        {
                                            decimal OutSpeakerHours = 0.0m;
                                            decimal.TryParse(u.CreditHours.ToString(), out OutSpeakerHours);

                                            var NewWebcastSpeaker = new WebcastSpeakers()
                                            {
                                                WebcastID = u.EventID ?? 0,
                                                UserID = u.UserID,
                                                SpeakerHours = OutSpeakerHours,
                                                SpeakerHoursAssignedOn = u.AssignedOn,
                                                CreatedOn = u.AssignedOn ?? DateTime.Now,
                                                LastUpdatedOn = u.AssignedOn ?? DateTime.Now,
                                                SpeakerCheckListOnFile = false
                                            };

                                            if (CommonFunctions.DoesUserExist(db, u.UserID))
                                            {
                                                NewWebcastSpeaker.SpeakerHoursAssignedBy = u.AssignedBy;
                                                NewWebcastSpeaker.CreatedBy = u.AssignedBy;
                                                NewWebcastSpeaker.LastUpdatedBy = u.AssignedBy;
                                            }
                                            else
                                            {
                                                NewWebcastSpeaker.SpeakerHoursAssignedBy = ImportUserID;
                                                NewWebcastSpeaker.CreatedBy = ImportUserID;
                                                NewWebcastSpeaker.LastUpdatedBy = ImportUserID;
                                            }

                                            var FDOnFile = (from f in db.FacultyDisclosures
                                                            where f.UserID == u.UserID && f.EventType == "Conference" && f.EventID == u.EventID
                                                            select f).Any();

                                            NewWebcastSpeaker.FacultyDisclosureOnFile = FDOnFile;

                                            db.WebcastSpeakers.Add(NewWebcastSpeaker);
                                            db.SaveChanges();
                                        }
                                        Console.WriteLine(" - Saved");

                                    }
                                    else
                                    {
                                        var Registration = (from c in db.WebcastRegistrations
                                                            where c.WebcastID == u.EventID && c.UserID == u.UserID
                                                            select c).FirstOrDefault();

                                        if (Registration != null)
                                        {

                                            if (u.IsMOC == true)
                                            {
                                                decimal OutMOCPoints = 0.0m;
                                                decimal.TryParse(u.CreditHours.ToString(), out OutMOCPoints);

                                                Registration.MOCPoints = OutMOCPoints;
                                                Registration.MOCPointsAssignedOn = u.AssignedOn;
                                                if (CommonFunctions.DoesUserExist(db, u.UserID))
                                                {
                                                    Registration.MOCPointsAssignedBy = u.AssignedBy;
                                                }
                                                else
                                                {
                                                    Registration.MOCPointsAssignedBy = ImportUserID;
                                                }

                                            }
                                            else
                                            {
                                                decimal OutCreditHours = 0.0m;
                                                decimal.TryParse(u.CreditHours.ToString(), out OutCreditHours);

                                                Registration.CreditHours = OutCreditHours;
                                                Registration.CreditAssignedOn = u.AssignedOn;
                                                if (CommonFunctions.DoesUserExist(db, u.UserID))
                                                {
                                                    Registration.CreditAssignedBy = u.AssignedBy;
                                                }
                                                else
                                                {
                                                    Registration.CreditAssignedBy = ImportUserID;
                                                }
                                            }

                                            db.SaveChanges();
                                        }
                                        Console.WriteLine(" - Saved");
                                    }

                                    break;
                                }
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

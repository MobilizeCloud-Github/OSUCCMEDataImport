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
    class RSSeriesJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            //RSSeriesSeries(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //RSSeries(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //JointProviders();
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //RSSeriesRegistrations(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            RSSeriespecialties(ImportUserID);

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void RSSeriesSeries(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var RSSeriesSeriesToImport = (from c in olddb.EventTitles
                                              where c.IsDeleted == false
                                              select c).ToList();

                var Total = RSSeriesSeriesToImport.Count();
                Console.Write("Importing RSSeriesSeries - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in RSSeriesSeriesToImport)
                {
                    Console.Write("Processing RSSeries Series: (" + Index + "/" + Total + ") " + c.ID + " ");
                    var RSSeriesSeries = new RSSeriesSeries()
                    {
                        ID = c.ID,
                        Name = c.Title,
                        URL = CommonFunctions.URLFriendly(c.Title),
                        AttendanceOverrideExpiration = c.AdminAttendanceOverride,
                        CreatedBy = ImportUserID,
                        CreatedOn = DateTime.Now,
                        LastUpdatedOn = DateTime.Now,
                        LastUpdatedBy = ImportUserID,

                    };

                    db.RSSeriesSeries.Add(RSSeriesSeries);
                    if (Index % 5 == 0)
                    {
                        db.SaveChanges();
                        Console.WriteLine(" - Saved");
                    }
                    else
                    {
                        Console.WriteLine(" - Pending");
                    }
                    Index++;
                }

                var ArchivedSeries = new RSSeriesSeries()
                {
                    ID = 341,
                    Name = "ARCH",
                    URL = CommonFunctions.URLFriendly("ARCH"),
                    AttendanceOverrideExpiration = null,
                    CreatedBy = ImportUserID,
                    CreatedOn = DateTime.Now,
                    LastUpdatedOn = DateTime.Now,
                    LastUpdatedBy = ImportUserID,
                    IsDeleted = false

                };
                db.RSSeriesSeries.Add(ArchivedSeries);

                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }
        }

        private static void RSSeries(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            TextWriter tw = new StreamWriter("RSSeriesImportLog.txt");
            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var RSSeriesToImport = (from c in olddb.RSSeries
                                        where c.IsDeleted == false && c.EventDateTime >= TransferStartDate
                                        select c).ToList();

                var Total = RSSeriesToImport.Count();
                Console.Write("Importing RSSeries - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ArchiveSeriesID = (from r in db.RSSeriesSeries
                                       where r.Name == "ARCH"
                                       select r.ID).FirstOrDefault();

                var RSSeriesToAdd = new List<Models.RSSeries>();
                foreach (var c in RSSeriesToImport)
                {
                    Console.Write("Processing RSSeries: (" + Index + "/" + Total + ") " + c.ID + " ");
                    var RSSeries = new Models.RSSeries()
                    {
                        ID = c.ID,
                        Title = c.Title,
                        URL = CommonFunctions.URLFriendly(c.Title),
                        Description = c.Description ?? "",
                        Objectives = c.Objective ?? "",
                        StartDate = c.EventDateTime ?? DateTime.Now,
                        EndDate = c.EventDateTime ?? DateTime.Now,
                        Credits = decimal.Parse(c.Credits.ToString()),
                        IsAccredited = c.Accredited ?? false,
                        LearnerCompetence = c.ActivityGoalsChangeCompetence,
                        LearnerCompetenceObjective = false,
                        LearnerCompetenceSubjective = c.ToChangeCompetence,
                        LearnerPerformance = c.ActivityGoalsChangePerformance,
                        LearnerPerformanceObjective = false,
                        LearnerPerformanceSubjective = c.ToChangePerformance,
                        PatientHealth = c.ActivityGoalsChangePatientOutcomes,
                        PatientHealthObjective = false,
                        PatientHealthSubjective = c.ToChangePatientOutcomes,
                        CommunityPopulationHealth = false,
                        CommunityPopulationHealthObjective = false,
                        CommunityPopulationHealthSubjective = false,
                        ContactName = "",
                        ContactDepartment = "",
                        ContactEmail = "",
                        ContactPhone = "",
                        ABMSPatientCareAndProceduralSkills = c.ABMSPatientCareAndProceduralSkills.Value,
                        ABMSMedicalKnowledge = c.ABMSMedicalKnowledge.Value,
                        ABMSPracticeBasedLearningAndImprovement = c.ABMSPracticeBasedLearningAndImprovement.Value,
                        ABMSInterpersonalAndCommunicationSkills = c.ABMSInterpersonalAndCommunicationSkills.Value,
                        ABMSProfessionalism = c.ABMSProfessionalism.Value,
                        ABMSSystemsBasedPractice = c.ABMSSystemsBasedPractice.Value,
                        IOMProvidePatientCenteredCare = c.IOMProvidePatientCenteredCare.Value,
                        IOMWorkInInterdisciplinaryTeams = c.IOMWorkInInterdisciplinaryTeams.Value,
                        IOMEmployEvidenceBasedPractice = c.IOMEmployEvidenceBasedPractice.Value,
                        IOMApplyQualityImprovement = c.IOMApplyQualityImprovement.Value,
                        IOMUtilizeInformatics = c.IOMUtilizeInformatics.Value,
                        IECValueEthicsForInterprofessionalPractice = c.IECValuesEthicsForInterprofessionalPractice ?? false,
                        IECRolesResponsibilities = c.IECRolesResponsibilities.Value,
                        IECInterprofessionalCommunication = c.IECInterprofessionalCommunication.Value,
                        IECTeamsAndTeamwork = c.IECTeamsAndTeamwork.Value,
                        OCCompetenciesOtherThanThoseListedWereAddressed = c.OCCompetenciesOtherThanThoseListedWereAddressed.Value,
                        AdditionalInformation = "",
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = DateTime.Now,
                        IsDeleted = c.IsDeleted ?? false,
                        LastUpdatedBy = ImportUserID,
                        LastUpdatedOn = DateTime.Now
                    };

                    if (c.SeriesTitleID == 0 || c.SeriesTitleID == null)
                    {

                        RSSeries.SeriesID = ArchiveSeriesID;
                    }
                    else
                    {
                        RSSeries.SeriesID = c.SeriesTitleID ?? ArchiveSeriesID;
                    }


                    if (c.IsCancelled == true)
                    {
                        RSSeries.Status = "Canceled";
                    }
                    else if (c.PublicViewable == true)
                    {
                        RSSeries.Status = "Occurring";
                    }
                    else if (c.PublicViewable == false)
                    {
                        RSSeries.Status = "Hidden";
                    }
                    else if (c.IsCancelled == false && c.PublicViewable == null)
                    {
                        RSSeries.Status = "Unpublished";
                    }

                    if (c.isJointSponsor == true)
                    {
                        RSSeries.Providership = "Joint";
                    }
                    else
                    {
                        RSSeries.Providership = "Direct";
                    }

                    if (CommonFunctions.DoesUserExist(db, c.CreatingUserID))
                    {
                        RSSeries.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        RSSeries.CreatedBy = ImportUserID;
                    }

                    if (c.LocationState == "None" || string.IsNullOrWhiteSpace(c.LocationState))
                    {
                        RSSeries.LocationKnown = false;
                        RSSeries.LocationName = "";
                        RSSeries.LocationAddressLine1 = "";
                        RSSeries.LocationAddressLine2 = "";
                        RSSeries.LocationCity = "";
                        RSSeries.LocationState = "";
                        RSSeries.LocationZipCode = "";

                    }
                    else
                    {
                        RSSeries.LocationKnown = true;
                        RSSeries.LocationName = c.Location ?? "";
                        RSSeries.LocationAddressLine1 = c.LocationAddress1 ?? "";
                        RSSeries.LocationAddressLine2 = c.LocationAddress2 ?? "";
                        RSSeries.LocationCity = c.LocationCity ?? "";
                        RSSeries.LocationState = c.LocationState ?? "";
                        RSSeries.LocationZipCode = CommonFunctions.GetTrimedString(c.LocationZip, 5);

                    }

                    RSSeriesToAdd.Add(RSSeries);

                    if (Index % 5 == 0 || Index == Total)
                    {
                        db.RSSeries.AddRange(RSSeriesToAdd);
                        db.SaveChanges();
                        RSSeriesToAdd.Clear();
                        Console.WriteLine(" - Saved");
                    }
                    else
                    {
                        Console.WriteLine(" - Pending");
                    }
                    Index++;
                }
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
                tw.WriteLineAsync(e.Message);
            }

            tw.Close();
        }

        private static void JointProviders()
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var RSSeriesWithJointProvidership = (from c in db.RSSeries
                                                     where c.Providership == "Joint" && c.IsDeleted == false
                                                     select c.ID).ToList();

                var Total = RSSeriesWithJointProvidership.Count();
                Console.Write("Importing RSSeries Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in RSSeriesWithJointProvidership)
                {
                    Console.Write("Processing RSSeries Joint Providers: (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.RSSeries
                                                 where j.ID == c && j.JointSponsor != null && j.JointSponsor != ""
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {

                        var JointProviders = new RSSeriesJointProviders()
                        {
                            RSSeriesID = c,
                            Name = JointProviderToImport
                        };
                        db.RSSeriesJointProviders.Add(JointProviders);
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

        private static void RSSeriesRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var RSSeriesRegistrationsToImport = (from c in olddb.RSSeriesRegistrations
                                                     where c.IsDeleted == false && c.RSSeriesID != null && c.Confirmation != "Speaker"
                                                     group c by c.RSSeriesID into cg
                                                     select new
                                                     {
                                                         RSSeriesID = cg.Key,
                                                         Registrations = cg
                                                     }).ToList();

                var Total = RSSeriesRegistrationsToImport.Count();
                Console.Write("Importing RSSeries Registrations - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();

                foreach (var RSS in RSSeriesRegistrationsToImport)
                {
                    Console.WriteLine("Processing RSSeries Registrations : (" + Index + "/" + Total + ") " + RSS.RSSeriesID + " ");
                    if (RSS.RSSeriesID != null)
                    {
                        var RSSeriesID = RSS.RSSeriesID;
                        if (RSSeriesIDs.Contains(RSSeriesID.Value))
                        {
                            var OldUserCredits = (from uc in olddb.UserCredits
                                                  where uc.EventID == RSS.RSSeriesID && uc.IsDeleted == false && uc.IsSpeaker == false && uc.EventType == "RSSeries"
                                                  select uc).ToList();

                            var TotalCredits = RSS.Registrations.Count();
                            var CreditsIndex = 1;

                            var NewRegistrationsToAdd = new List<Models.RSSeriesRegistrations>();
                            foreach (var RSSeriesRegistration in RSS.Registrations)
                            {
                                Console.Write("Processing RSSeries Registrations User Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + RSSeriesRegistration.ID + " ");

                                if (CommonFunctions.DoesUserExist(db, RSSeriesRegistration.UserID))
                                {
                                    var Registration = new Models.RSSeriesRegistrations()
                                    {
                                        RSSeriesID = RSSeriesRegistration.RSSeriesID.Value,
                                        UserID = RSSeriesRegistration.UserID,
                                        IsDeleted = false,
                                        EvaluationSent = RSSeriesRegistration.EvaluationSent ?? false,
                                        EvaluationSentOn = null,
                                        CreatedOn = DateTime.Now,
                                        CreatedBy = ImportUserID,
                                        LastUpdatedOn = DateTime.Now,
                                        LastUpdatedBy = ImportUserID
                                    };

                                    var OldUserCredit = (from c in OldUserCredits
                                                         where c.UserID == RSSeriesRegistration.UserID
                                                         select c).FirstOrDefault();
                                    if (OldUserCredit != null)
                                    {
                                        var AssignedByUserID = ImportUserID;
                                        if (CommonFunctions.DoesUserExist(db, OldUserCredit.AssignedBy))
                                        {
                                            AssignedByUserID = OldUserCredit.AssignedBy;
                                        }

                                        if (OldUserCredit.IsMOC == true)
                                        {
                                            decimal OutMOCPoints = 0.0m;
                                            decimal.TryParse(OldUserCredit.CreditHours.ToString(), out OutMOCPoints);

                                            Registration.MOCPoints = OutMOCPoints;
                                            Registration.MOCPointsAssignedOn = OldUserCredit.AssignedOn;
                                            Registration.MOCPointsAssignedBy = AssignedByUserID;
                                        }

                                        decimal OutCreditHours = 0.0m;
                                        decimal.TryParse(OldUserCredit.CreditHours.ToString(), out OutCreditHours);

                                        Registration.CreditHours = OutCreditHours;
                                        Registration.CreditAssignedOn = OldUserCredit.AssignedOn;
                                        Registration.CreditAssignedBy = AssignedByUserID;
                                    }

                                    NewRegistrationsToAdd.Add(Registration);
                                    Console.WriteLine(" - Saved");

                                }
                                else
                                {
                                    Console.WriteLine(" - Skipped");
                                }
                                CreditsIndex++;
                            }
                            db.RSSeriesRegistrations.AddRange(NewRegistrationsToAdd);
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

        private static void RSSeriespecialties(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var RSSeriespecialtiesToImport = (from cs in olddb.RSSeriesSearchCategories
                                                  where cs.IsDeleted == false
                                                  select cs).Distinct().ToList();

                var Total = RSSeriespecialtiesToImport.Count();
                Console.Write("Importing RSSeries Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var CategoryMappings = (from v in db.CategoryMapping
                                        select new
                                        {
                                            v.OldID,
                                            v.NewID
                                        }).ToList();

                var RSSeriesIDs = (from c in db.RSSeries
                                   where c.IsDeleted == false
                                   select c.ID).ToList();


                foreach (var c in RSSeriespecialtiesToImport)
                {
                    Console.Write("Processing Specialties: (" + Index + "/" + Total + ") " + c.RSSeriesID + " " + c.CategoryID);
                    var RSSeriesID = c.RSSeriesID;
                    if (RSSeriesIDs.Contains(RSSeriesID.Value))
                    {
                        var NewSpecialtyID = (from v in CategoryMappings
                                              where v.OldID == c.CategoryID
                                              select v.NewID).FirstOrDefault();                                             


                        var AlreadyExists = (from v in db.RSSeriesSpecialties
                                             where v.RSSeriesID == c.RSSeriesID && v.SpecialtyID == NewSpecialtyID
                                             select v).Any();

                        if (!AlreadyExists)
                        {

                            var Specialty = new RSSeriesSpecialties()
                            {
                                RSSeriesID = c.RSSeriesID ?? 0,
                                SpecialtyID = NewSpecialtyID ?? 0
                            };
                            db.RSSeriesSpecialties.Add(Specialty);
                            db.SaveChanges();
                            Console.WriteLine(" - Saved");
                        }
                        else
                        {
                            Console.WriteLine(" - Already Exists");
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

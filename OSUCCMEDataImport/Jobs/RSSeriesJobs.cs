using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class RSSeriesJobs
    {
        public static void Process(string ImportUserID)
        {
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
            RSSeriesRegistrations(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //RSSeriespecialties(ImportUserID);

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
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c.ID + " ");
                    var RSSeriesSeries = new Models.RSSeriesSeries()
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
                    db.SaveChanges();
                    Index++;
                    Console.WriteLine(" - Saved");
                }
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
                var RSSeriesToImport = (from c in olddb.RSSeries
                                        where c.IsDeleted == false
                                        select c).ToList();

                var Total = RSSeriesToImport.Count();
                Console.Write("Importing RSSeries - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ArchiveSeriesID = (from r in db.RSSeriesSeries
                                       where r.Name == "ARCH"
                                       select r.ID).FirstOrDefault();

                foreach (var c in RSSeriesToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c.ID + " ");
                    var RSSerie = new Models.RSSeries()
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

                        RSSerie.SeriesID = ArchiveSeriesID;
                    }
                    else
                    {
                        RSSerie.SeriesID = c.SeriesTitleID ?? ArchiveSeriesID;
                    }


                    if (c.IsCancelled == true)
                    {
                        RSSerie.Status = "Canceled";
                    }
                    else if (c.PublicViewable == true)
                    {
                        RSSerie.Status = "Occurring";
                    }
                    else if (c.PublicViewable == false)
                    {
                        RSSerie.Status = "Hidden";
                    }
                    else if (c.IsCancelled == false && c.PublicViewable == null)
                    {
                        RSSerie.Status = "Unpublished";
                    }

                    if (c.isJointSponsor == true)
                    {
                        RSSerie.Providership = "Joint";
                    }
                    else
                    {
                        RSSerie.Providership = "Direct";
                    }

                    if (CommonFunctions.DoesUserExist(db, c.CreatingUserID))
                    {
                        RSSerie.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        RSSerie.CreatedBy = ImportUserID;
                    }

                    if (c.LocationState == "None" || string.IsNullOrWhiteSpace(c.LocationState))
                    {
                        RSSerie.LocationKnown = false;
                        RSSerie.LocationName = "";
                        RSSerie.LocationAddressLine1 = "";
                        RSSerie.LocationAddressLine2 = "";
                        RSSerie.LocationCity = "";
                        RSSerie.LocationState = "";
                        RSSerie.LocationZipCode = "";

                    }
                    else
                    {
                        RSSerie.LocationKnown = true;
                        RSSerie.LocationName = c.Location ?? "";
                        RSSerie.LocationAddressLine1 = c.LocationAddress1 ?? "";
                        RSSerie.LocationAddressLine2 = c.LocationAddress2 ?? "";
                        RSSerie.LocationCity = c.LocationCity ?? "";
                        RSSerie.LocationState = c.LocationState ?? "";
                        RSSerie.LocationZipCode = CommonFunctions.GetTrimedString(c.LocationZip, 5);

                    }

                    db.RSSeries.Add(RSSerie);
                    db.SaveChanges();
                    Index++;
                    Console.WriteLine(" - Saved");
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
                                                     where c.Providership == "Joint"
                                                     select c.ID).ToList();

                var Total = RSSeriesWithJointProvidership.Count();
                Console.Write("Importing RSSeries Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in RSSeriesWithJointProvidership)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.RSSeries
                                                 where j.ID == c
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {

                        var JointProviders = new RSSeriesJointProviders()
                        {
                            RSSeriesID = c,
                            Name = JointProviderToImport
                        };
                        db.RSSeriesJointProviders.Add(JointProviders);
                        db.SaveChanges();
                        Index++;
                        Console.WriteLine(" - Saved");
                    }
                    Console.WriteLine(" - Complete");
                }

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
                var RSSerieRegistrationsToImport = (from c in olddb.RSSeriesRegistrations
                                                    where c.IsDeleted == false && c.RSSeriesID != null
                                                    select c).ToList();

                var Total = RSSerieRegistrationsToImport.Count();
                Console.Write("Importing RSSeries Prices - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var r in RSSerieRegistrationsToImport)
                {
                    if (r.RSSeriesID != null)
                    {
                        Console.Write("Processing : RSSerieID exist.");
                        var RSSeriesExist = (from s in db.RSSeries
                                             where s.ID == r.RSSeriesID
                                             select s.ID).Any();
                        if (RSSeriesExist)
                        {
                            Console.Write("Processing : RSSeries exist.");
                            if (CommonFunctions.DoesUserExist(db, r.UserID))
                            {
                                Console.Write("Processing : User Does Exist.");
                                if (r.Confirmation != "Speaker")
                                {
                                    Console.Write("Processing : (" + Index + "/" + Total + ") " + r.ID + " ");

                                    var Registration = new Models.RSSeriesRegistrations()
                                    {
                                        RSSeriesID = r.RSSeriesID ?? 0,
                                        UserID = r.UserID,
                                        IsDeleted = false,
                                        EvaluationSent = r.EvaluationSent ?? false,
                                        EvaluationSentOn = null,
                                        CreatedOn = DateTime.Now,
                                        CreatedBy = ImportUserID,
                                        LastUpdatedOn = DateTime.Now,
                                        LastUpdatedBy = ImportUserID
                                    };
                                    db.RSSeriesRegistrations.Add(Registration);

                                    db.SaveChanges();
                                    Index++;
                                    Console.WriteLine(" - Saved");
                                }
                            }
                        }
                    }

                    Console.WriteLine(" - Complete");

                }

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
                                                  select cs).ToList();

                var Total = RSSeriespecialtiesToImport.Count();
                Console.Write("Importing RSSeries Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in RSSeriespecialtiesToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c.RSSeriesID + " " + c.CategoryID);

                    var NewSpecialtyID = (from v in db.CategoryMapping
                                          where v.OldID == c.CategoryID
                                          select v.NewID).FirstOrDefault();

                    var RSSerie = (from v in db.RSSeries
                                   where v.ID == c.RSSeriesID
                                   select v.ID).FirstOrDefault();

                    if (RSSerie > 0)
                    {
                        var Specialty = new Models.RSSeriesSpecialties()
                        {
                            RSSeriesID = c.RSSeriesID ?? 0,
                            SpecialtyID = NewSpecialtyID ?? 0
                        };
                        db.RSSeriesSpecialties.Add(Specialty);
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

    }
}

using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class EnduringJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            EnduringMaterialsSeries(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringMaterials(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            JointProviders();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringMaterialRegistrations(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            EnduringMaterialspecialties(ImportUserID);

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }

        private static void EnduringMaterialsSeries(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var EnduringMaterialsSeriesToImport = (from c in olddb.EnduringMaterialSeries
                                                       where c.IsDeleted == false
                                                       select c).ToList();

                var Total = EnduringMaterialsSeriesToImport.Count();
                Console.Write("Importing EnduringMaterials - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EnduringMaterialsSeriesToImport)
                {
                    Console.Write("Processing Enduring Series: (" + Index + "/" + Total + ") " + c.ID + " ");
                    var EnduringMaterialSeries = new Models.EnduringMaterialSeries()
                    {
                        ID = c.ID,
                        Name = c.Name,
                        URL = CommonFunctions.URLFriendly(c.Name),
                        CreatedBy = ImportUserID,
                        CreatedOn = DateTime.Now,
                        LastUpdatedOn = DateTime.Now,
                        LastUpdatedBy = ImportUserID,
                    };

                    db.EnduringMaterialSeries.Add(EnduringMaterialSeries);
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

                var ArchivedSeries = new Models.EnduringMaterialSeries()
                {
                    ID = 9,
                    Name = "ARCH",
                    URL = CommonFunctions.URLFriendly("ARCH"),
                    AttendanceOverrideExpiration = null,
                    CreatedBy = ImportUserID,
                    CreatedOn = DateTime.Now,
                    LastUpdatedOn = DateTime.Now,
                    LastUpdatedBy = ImportUserID,
                    IsDeleted = false

                };
                db.EnduringMaterialSeries.Add(ArchivedSeries);

                db.SaveChanges();
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);

            }


        }

        private static void EnduringMaterials(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            TextWriter tw = new StreamWriter("EnduringMaterialsImportLog.txt");
            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var EnduringMaterialsToImport = (from c in olddb.EnduringMaterials
                                                 where c.IsDeleted == false && c.ExpirationDate >= TransferStartDate
                                                 select c).ToList();

                var Total = EnduringMaterialsToImport.Count();
                Console.Write("Importing EnduringMaterials - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EnduringMaterialsToImport)
                {
                    Console.Write("Processing Enduring: (" + Index + "/" + Total + ") " + c.ID + " ");
                    var EnduringMaterial = new Models.EnduringMaterials()
                    {
                        ID = c.ID,
                        Title = c.Title,
                        URL = CommonFunctions.URLFriendly(c.Title),
                        Description = c.Description ?? "",
                        Objectives = c.Objectives ?? "",
                        StartDate = c.ReleaseDate ?? DateTime.Now,
                        EndDate = c.ExpirationDate ?? DateTime.Now,
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
                        ExternalRegistrationButtonEnabled = false,
                        PublicRegistrationEnabled = c.PublicViewable ?? false,
                        RegistrationNoticeEmails = "",
                        AdditionalInformation = "",
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = DateTime.Now,
                        IsDeleted = c.IsDeleted ?? false,
                        PublicRegistrationLinkUrl = "",
                        PublicRegistrationLinkText = "",
                        LastUpdatedBy = ImportUserID,
                        LastUpdatedOn = DateTime.Now
                    };

                    if (c.SeriesID == 0 || c.SeriesID == null)
                    {
                        EnduringMaterial.EnduringMaterialSeriesID = 9;
                    }
                    else
                    {
                        EnduringMaterial.EnduringMaterialSeriesID = c.SeriesID ?? 9;
                    }


                    if (c.IsCancelled == true)
                    {
                        EnduringMaterial.Status = "Canceled";
                    }
                    else if (c.PublicViewable == true)
                    {
                        EnduringMaterial.Status = "Occurring";
                    }
                    else if (c.PublicViewable == false)
                    {
                        EnduringMaterial.Status = "Hidden";
                    }
                    else if (c.IsCancelled == false && c.PublicViewable == null)
                    {
                        EnduringMaterial.Status = "Unpublished";
                    }

                    if (c.isJointSponsor == true)
                    {
                        EnduringMaterial.Providership = "Joint";
                    }
                    else
                    {
                        EnduringMaterial.Providership = "Direct";
                    }

                    if (CommonFunctions.DoesUserExist(db, c.CreatingUserID))
                    {
                        EnduringMaterial.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        EnduringMaterial.CreatedBy = ImportUserID;
                    }

                    db.EnduringMaterials.Add(EnduringMaterial);
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
                db.SaveChanges();
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
                var EnduringMaterialsWithJointProvidership = (from c in db.EnduringMaterials
                                                              where c.Providership == "Joint" && c.IsDeleted == false
                                                              select c.ID).ToList();

                var Total = EnduringMaterialsWithJointProvidership.Count();
                Console.Write("Importing EnduringMaterials Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in EnduringMaterialsWithJointProvidership)
                {
                    Console.Write("Processing Enduring Joint Providers : (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.EnduringMaterials
                                                 where j.ID == c && j.JointSponsor != null && j.JointSponsor != ""
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {

                        var JointProviders = new EnduringMaterialJointProviders()
                        {
                            EnduringMaterialID = c,
                            Name = JointProviderToImport
                        };
                        db.EnduringMaterialJointProviders.Add(JointProviders);
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

        private static void EnduringMaterialRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var EnduringMaterialRegistrationsToImport = (from c in olddb.EnduringMaterialRegistrations
                                                             where c.IsDeleted == false && c.EnduringID != null && c.Confirmation != "Speaker"
                                                             select c).ToList();

                var Total = EnduringMaterialRegistrationsToImport.Count();
                Console.Write("Importing EnduringMaterials Prices - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var EnduringIDs = (from c in db.EnduringMaterials
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var r in EnduringMaterialRegistrationsToImport)
                {
                    Console.Write("Processing Enduring Registrations : (" + Index + "/" + Total + ") " + r.ID + " ");

                    if (r.EnduringID != null)
                    {
                        var EnduringID = r.EnduringID;
                        if (EnduringIDs.Contains(EnduringID.Value))
                        {
                            if (CommonFunctions.DoesUserExist(db, r.UserID))
                            {

                                var Registration = new Models.EnduringMaterialRegistrations()
                                {
                                    EnduringMaterialID = r.EnduringID ?? 0,
                                    UserID = r.UserID,
                                    IsDeleted = false,
                                    ConfirmationNumber = r.Confirmation ?? "",
                                    EvaluationSent = r.EvaluationSent ?? false,
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    FileAccessEnabled = true,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.EnduringMaterialRegistrations.Add(Registration);

                                if (r.PaymentAmount != null)
                                {
                                    decimal OutPaymentAmount = 0.0m;
                                    decimal.TryParse(r.PaymentAmount, out OutPaymentAmount);

                                    Registration.PaymentAmount = OutPaymentAmount;
                                }
                                else
                                {
                                    Registration.PaymentAmount = 0.0m;
                                }

                                if (r.PaymentType.Contains("HA:"))
                                {
                                    Registration.PaymentMethod = "Hospital Assigned";
                                }
                                else if (Registration.PaymentMethod == null)
                                {
                                    Registration.PaymentMethod = "Null";
                                }
                                else
                                {
                                    switch (r.PaymentType.ToLower())
                                    {
                                        case "check":
                                        case "free":
                                        case "waived":
                                        case "other":
                                        case "erequest":
                                        case "scholarship":
                                            {
                                                Registration.PaymentMethod = r.PaymentType;
                                                break;
                                            }
                                        case "credit":
                                            {
                                                Registration.PaymentMethod = "Credit Card - Manual";
                                                break;
                                            }
                                        case "none":
                                        case "attendance only":
                                        case "N/A":
                                            {
                                                Registration.PaymentMethod = "Free";
                                                break;
                                            }
                                        case "cash":
                                            {
                                                Registration.PaymentMethod = "Other";
                                                break;
                                            }
                                        case "credit card":
                                            {
                                                Registration.PaymentMethod = "Credit Card - Auto";
                                                break;
                                            }
                                        case null:
                                            {
                                                Registration.PaymentMethod = "Credit Card - Auto";
                                                break;
                                            }
                                    }
                                }

                                db.EnduringMaterialRegistrations.Add(Registration);

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
                                Console.WriteLine(" - Skipped User Doesn't Exist");
                            }
                        }
                        else
                        {
                            Console.WriteLine(" - Skipped Prior to 2012");
                        }
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped No ID");
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

        private static void EnduringMaterialspecialties(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var EnduringMaterialspecialtiesToImport = (from cs in olddb.EnduringMaterialsSearchCategories
                                                           select cs).ToList();

                var Total = EnduringMaterialspecialtiesToImport.Count();
                Console.Write("Importing EnduringMaterials Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var CategoryMappings = (from v in db.CategoryMapping
                                        select new
                                        {
                                            v.OldID,
                                            v.NewID
                                        }).ToList();

                var EnduringIDs = (from c in db.EnduringMaterials
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                foreach (var c in EnduringMaterialspecialtiesToImport)
                {
                    Console.Write("Processing Specialties : (" + Index + "/" + Total + ") " + c.EnduringID + " " + c.CategoryID);

                    
                    var EnduringID = c.EnduringID;
                    if (EnduringIDs.Contains(EnduringID.Value))
                    {
                        var NewSpecialtyID = (from v in CategoryMappings
                                              where v.OldID == c.CategoryID
                                              select v.NewID).FirstOrDefault();

                        var Specialty = new Models.EnduringMaterialSpecialties()
                        {
                            EnduringMaterialID = c.EnduringID ?? 0,
                            SpecialtyID = NewSpecialtyID ?? 0
                        };
                        db.EnduringMaterialSpecialties.Add(Specialty);
                        if (Index % 10 == 0)
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

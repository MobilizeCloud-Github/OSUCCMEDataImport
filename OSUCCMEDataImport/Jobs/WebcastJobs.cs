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
    class WebcastJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            Webcasts(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            JointProviders();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            WebcastRegistrations(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            Webcastspecialties(ImportUserID);

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);

        }

        private static void Webcasts(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            TextWriter tw = new StreamWriter("WebcastsImportLog.txt");
            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var WebcastsToImport = (from c in olddb.Webcasts
                                        where c.IsDeleted == false && c.ExpirationDate >= TransferStartDate
                                        select c).ToList();

                var Total = WebcastsToImport.Count();
                Console.Write("Importing Webcasts - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastsToImport)
                {
                    Console.Write("Processing Webcasts : (" + Index + "/" + Total + ") " + c.ID + " ");
                    var Webcast = new Models.Webcasts()
                    {
                        ID = c.ID,
                        Title = c.Title,
                        URL = CommonFunctions.URLFriendly(c.Title),
                        Description = c.Description ?? "",
                        Objectives = c.Objectives,
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
                        RegistrationNoticeEmails = c.NotificationEmail ?? "",
                        AdditionalInformation = "",
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = DateTime.Now,
                        IsDeleted = c.IsDeleted ?? false,
                        PublicRegistrationLinkUrl = "",
                        PublicRegistrationLinkText = "",
                        LastUpdatedBy = ImportUserID,
                        LastUpdatedOn = DateTime.Now
                    };

                    if (c.IsCancelled == true)
                    {
                        Webcast.Status = "Canceled";
                    }
                    else if (c.PublicViewable == true)
                    {
                        Webcast.Status = "Occurring";
                    }
                    else if (c.PublicViewable == false)
                    {
                        Webcast.Status = "Hidden";
                    }
                    else if (c.IsCancelled == false && c.PublicViewable == null)
                    {
                        Webcast.Status = "Unpublished";
                    }

                    if (c.IsJointSponsor == true)
                    {
                        Webcast.Providership = "Joint";
                    }
                    else
                    {
                        Webcast.Providership = "Direct";
                    }

                    if (CommonFunctions.DoesUserExist(db, c.CreatingUserID))
                    {
                        Webcast.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        Webcast.CreatedBy = ImportUserID;
                    }

                    db.Webcasts.Add(Webcast);
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
                var WebcastsWithJointProvidership = (from c in db.Webcasts
                                                     where c.Providership == "Joint" && c.IsDeleted == false
                                                     select c.ID).ToList();

                var Total = WebcastsWithJointProvidership.Count();
                Console.Write("Importing Webcasts Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastsWithJointProvidership)
                {
                    Console.Write("Processing Conferences Joint Providers : (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.Webcasts
                                                 where j.ID == c && j.JointSponsor != null && j.JointSponsor != ""
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {

                        var JointProviders = new WebcastJointProviders()
                        {
                            WebcastID = c,
                            Name = JointProviderToImport
                        };
                        db.WebcastJointProviders.Add(JointProviders);
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

        private static void WebcastRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var WebcastRegistrationsToImport = (from c in olddb.WebcastRegistrations
                                                    where c.IsDeleted == false && c.WebCastID != null && c.Confirmation != "Speaker"
                                                    group c by c.WebCastID into cg
                                                    select new
                                                    {
                                                        WebcastID = cg.Key,
                                                        Registrations = cg
                                                    }).ToList();

                var Total = WebcastRegistrationsToImport.Count();
                Console.Write("Importing Webcasts Prices - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                foreach (var Webcast in WebcastRegistrationsToImport)
                {
                    Console.WriteLine("Processing Webcast Registrations : (" + Index + "/" + Total + ") " + Webcast.WebcastID + " ");
                    if (Webcast.WebcastID != null)
                    {
                        var WebcastID = Webcast.WebcastID;
                        if (WebcastIDs.Contains(WebcastID.Value))
                        {
                            var OldUserCredits = (from uc in olddb.UserCredits
                                                  where uc.EventID == Webcast.WebcastID && uc.IsDeleted == false && uc.IsSpeaker == false && (uc.EventType == "Webcast-Live" || uc.EventType == "Webcast-VOD")
                                                  select uc).ToList();

                            var TotalCredits = Webcast.Registrations.Count();
                            var CreditsIndex = 1;

                            var NewRegistrationsToAdd = new List<Models.WebcastRegistrations>();
                            foreach (var WebcastRegistration in Webcast.Registrations)
                            {
                                Console.Write("Processing Webcast Registrations User Credits : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + WebcastRegistration.ID + " ");

                                if (CommonFunctions.DoesUserExist(db, WebcastRegistration.UserID))
                                {
                                    var Registration = new Models.WebcastRegistrations()
                                    {
                                        WebcastID = WebcastRegistration.WebCastID ?? 0,
                                        UserID = WebcastRegistration.UserID,
                                        IsCanceled = WebcastRegistration.IsCancelled,
                                        IsDeleted = false,
                                        ConfirmationNumber = WebcastRegistration.Confirmation ?? "",
                                        EvaluationSent = WebcastRegistration.EvaluationSent ?? false,
                                        CreatedOn = DateTime.Now,
                                        CreatedBy = ImportUserID,
                                        FileAccessEnabled = true,
                                        LastUpdatedOn = DateTime.Now,
                                        LastUpdatedBy = ImportUserID
                                    };


                                    if (WebcastRegistration.PaymentAmount != null)
                                    {
                                        decimal OutPaymentAmount = 0.0m;
                                        decimal.TryParse(WebcastRegistration.PaymentAmount, out OutPaymentAmount);

                                        Registration.PaymentAmount = OutPaymentAmount;
                                    }
                                    else
                                    {
                                        Registration.PaymentAmount = 0.0m;
                                    }

                                    if (WebcastRegistration.PaymentType.Contains("HA:"))
                                    {
                                        Registration.PaymentMethod = "Hospital Assigned";
                                    }
                                    else if (Registration.PaymentMethod == null)
                                    {
                                        Registration.PaymentMethod = "Null";
                                    }
                                    else
                                    {
                                        switch (WebcastRegistration.PaymentType.ToLower())
                                        {
                                            case "check":
                                            case "free":
                                            case "waived":
                                            case "other":
                                            case "erequest":
                                            case "scholarship":
                                                {
                                                    Registration.PaymentMethod = WebcastRegistration.PaymentType;
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

                                    var OldUserCredit = (from c in OldUserCredits
                                                         where c.UserID == WebcastRegistration.UserID
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
                            db.WebcastRegistrations.AddRange(NewRegistrationsToAdd);
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

        private static void Webcastspecialties(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var WebcastspecialtiesToImport = (from cs in olddb.WebcastSearchCategories
                                                  select new
                                                  {
                                                      cs.WebcastID,
                                                      cs.CategoryID
                                                  }).ToList();

                var Total = WebcastspecialtiesToImport.Count();
                Console.Write("Importing Webcasts Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var CategoryMappings = (from v in db.CategoryMapping
                                        select new
                                        {
                                            v.OldID,
                                            v.NewID
                                        }).ToList();

                var WebcastIDs = (from c in db.Webcasts
                                  where c.IsDeleted == false
                                  select c.ID).ToList();

                foreach (var c in WebcastspecialtiesToImport)
                {
                    Console.Write("Processing Specialties : (" + Index + "/" + Total + ") " + c.WebcastID + " " + c.CategoryID);

                    var WebcastID = c.WebcastID;
                    if (WebcastIDs.Contains(WebcastID.Value))
                    {
                        var NewSpecialtyID = (from v in CategoryMappings
                                              where v.OldID == c.CategoryID
                                              select v.NewID).FirstOrDefault();

                        var Specialty = new Models.WebcastSpecialties()
                        {
                            WebcastID = c.WebcastID ?? 0,
                            SpecialtyID = NewSpecialtyID ?? 0
                        };
                        db.WebcastSpecialties.Add(Specialty);
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

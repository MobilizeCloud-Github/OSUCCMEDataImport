using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class WebcastJobs
    {
        public static void Process(string ImportUserID)
        {
            //Webcasts(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //JointProviders();
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            //WebcastRegistrations(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            Webcastspecialties(ImportUserID);

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
                var WebcastsToImport = (from c in olddb.Webcasts
                                        where c.IsDeleted == false
                                        select c).ToList();

                var Total = WebcastsToImport.Count();
                Console.Write("Importing Webcasts - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastsToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c.ID + " ");
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
                var WebcastsWithJointProvidership = (from c in db.Webcasts
                                                     where c.Providership == "Joint"
                                                     select c.ID).ToList();

                var Total = WebcastsWithJointProvidership.Count();
                Console.Write("Importing Webcasts Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastsWithJointProvidership)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.Webcasts
                                                 where j.ID == c
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {

                        var JointProviders = new WebcastJointProviders()
                        {
                            WebcastID = c,
                            Name = JointProviderToImport
                        };
                        db.WebcastJointProviders.Add(JointProviders);
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

        private static void WebcastRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var WebcastRegistrationsToImport = (from c in olddb.WebcastRegistrations
                                                    where c.IsDeleted == false && c.WebCastID != null
                                                    select c).ToList();

                var Total = WebcastRegistrationsToImport.Count();
                Console.Write("Importing Webcasts Prices - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var r in WebcastRegistrationsToImport)
                {
                    if (r.WebCastID != null)
                    {
                        Console.Write("Processing : WebcastID exist.");
                        if (CommonFunctions.DoesUserExist(db, r.UserID))
                        {
                            Console.Write("Processing : User Does Exist.");
                            if (r.PaymentType != "N/A" && r.Confirmation != "Speaker")
                            {
                                Console.Write("Processing : (" + Index + "/" + Total + ") " + r.ID + " ");

                                var Registration = new Models.WebcastRegistrations()
                                {
                                    WebcastID = r.WebCastID ?? 0,
                                    UserID = r.UserID,
                                    IsCanceled = r.IsCancelled,
                                    IsDeleted = false,
                                    ConfirmationNumber = r.Confirmation ?? "",
                                    EvaluationSent = r.EvaluationSent ?? false,
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    FileAccessEnabled = true,
                                    LastUpdatedOn = DateTime.Now,
                                    LastUpdatedBy = ImportUserID
                                };
                                db.WebcastRegistrations.Add(Registration);

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

                                if (r.PaymentType == "Check")
                                {
                                    Registration.PaymentMethod = r.PaymentType;
                                }
                                if (r.PaymentType == "Free")
                                {
                                    Registration.PaymentMethod = r.PaymentType;
                                }
                                if (r.PaymentType.ToLower() == "credit")
                                {
                                    Registration.PaymentMethod = "Credit Card - Manual";
                                }
                                if (r.PaymentType == "None")
                                {
                                    Registration.PaymentMethod = "Free";
                                }
                                if (r.PaymentType == "Scholarship")
                                {
                                    Registration.PaymentMethod = "Waived";
                                }
                                if (r.PaymentType == "Waived")
                                {
                                    Registration.PaymentMethod = r.PaymentType;
                                }
                                if (r.PaymentType == "Attendance Only")
                                {
                                    Registration.PaymentMethod = "Free";
                                }
                                if (r.PaymentType == "Cash")
                                {
                                    Registration.PaymentMethod = "Other";
                                }
                                if (r.PaymentType == "Other")
                                {
                                    Registration.PaymentMethod = r.PaymentType;
                                }
                                if (r.PaymentType == "Credit Card")
                                {
                                    Registration.PaymentMethod = "Credit Card - Auto";
                                }
                                if (r.PaymentType == "eRequest")
                                {
                                    Registration.PaymentMethod = r.PaymentType;
                                }
                                if (r.PaymentType == "N/A")
                                {
                                    Registration.PaymentMethod = "Free";
                                }
                                if (r.PaymentType.Contains("HA:"))
                                {
                                    Registration.PaymentMethod = "Hospital Assigned";
                                }

                                if (Registration.PaymentMethod == null)
                                {
                                    Registration.PaymentMethod = "Null";
                                }

                                db.SaveChanges();
                                Index++;
                                Console.WriteLine(" - Saved");
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

        private static void Webcastspecialties(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var WebcastspecialtiesToImport = (from cs in olddb.WebcastSearchCategories
                                                  select cs).ToList();

                var Total = WebcastspecialtiesToImport.Count();
                Console.Write("Importing Webcasts Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in WebcastspecialtiesToImport)
                {
                    Console.Write("Processing : (" + Index + "/" + Total + ") " + c.WebcastID + " " + c.CategoryID);

                    var NewSpecialtyID = (from v in db.CategoryMapping
                                          where v.OldID == c.CategoryID
                                          select v.NewID).FirstOrDefault();

                    var Specialty = new Models.WebcastSpecialties()
                    {
                        WebcastID = c.WebcastID ?? 0,
                        SpecialtyID = NewSpecialtyID ?? 0
                    };
                    db.WebcastSpecialties.Add(Specialty);
                    db.SaveChanges();

                    Console.WriteLine(" - Saved");

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

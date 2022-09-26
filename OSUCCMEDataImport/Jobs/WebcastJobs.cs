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
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

        }

        private static void Webcasts(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            TextWriter tw = new StreamWriter("WebcastsImportLog.txt");
            try
            {
                var WebcastsToImport = (from c in olddb.Webcasts
                                        where c.IsDeleted == false
                                        select c).ToList();


                foreach (var c in WebcastsToImport)
                {

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
                        //ExternalRegistrationButtonEnabled = ,
                        PublicRegistrationEnabled = c.PublicViewable ?? false,
                        RegistrationNoticeEmails = c.NotificationEmail,
                        AdditionalInformation = "",
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = TimeZoneInfo.ConvertTime(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time")),
                        CreatedBy = c.CreatingUserID,
                        IsDeleted = c.IsDeleted ?? false
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

                    if (Webcast.ExternalRegistrationButtonEnabled == true)
                    {
                        //Conference.PublicRegistrationLinkUrl = c.PublicRegistrationLinkUrl;
                        //Conference.PublicRegistrationLinkText = c.PublicRegistrationLinkText;
                    }
                    else
                    {
                        Webcast.PublicRegistrationLinkUrl = "";
                        Webcast.PublicRegistrationLinkText = "";
                    }

                    db.Webcasts.Add(Webcast);
                }
                db.SaveChanges();
            }
            catch (Exception e)
            {
                tw.WriteLine(e.Message);
            }

            tw.Close();
        }

        private static void JointProviders()
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            try
            {


                var WebcastsWithJointProvidership = (from c in db.Webcasts
                                                     where c.Providership == "Joint"
                                                     select c).ToList();

                foreach (var c in WebcastsWithJointProvidership)
                {
                    var JointProviderToImport = (from j in olddb.Webcasts
                                                 where j.ID == c.ID
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {
                        var JointProviders = new WebcastJointProviders()
                        {
                            WebcastID = c.ID,
                            Name = JointProviderToImport
                        };
                        db.WebcastJointProviders.Add(JointProviders);

                    }
                }
                db.SaveChanges();
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
            var olddb = new OldOSUCCMEEntities();

            try
            {
                var WebcastRegistrationsToImport = (from c in olddb.WebcastRegistrations
                                                    where c.IsDeleted == false && c.WebCastID != null
                                                    select c).ToList();

                foreach (var r in WebcastRegistrationsToImport)
                {
                    if (r.WebCastID != null)
                    {
                        var Registration = new Models.WebcastRegistrations()
                        {
                            WebcastID = r.WebCastID ?? 0,
                            UserID = r.UserID,
                            PaymentMethod = r.PaymentType,
                            PaymentAmount = decimal.Parse(r.PaymentAmount),
                            IsCanceled = r.IsCancelled,
                            IsDeleted = false,
                            ConfirmationNumber = r.Confirmation,
                            EvaluationSent = r.EvaluationSent ?? false,
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            FileAccessEnabled = true
                        };
                        db.WebcastRegistrations.Add(Registration);
                    }

                }
                db.SaveChanges();

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
            var olddb = new OldOSUCCMEEntities();

            try
            {


            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

    }
}

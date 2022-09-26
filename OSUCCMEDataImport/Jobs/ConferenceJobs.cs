using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class ConferenceJobs
    {
        public static void Process(string ImportUserID)
        {
            Conferences(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            JointProviders();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceOptionGroup(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceOptions(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferencePrices(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceRegistrations(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceSpecialties(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceStreams(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ConferenceStreamViews(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
        }

        private static void Conferences(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            TextWriter tw = new StreamWriter("ConferencesImportLog.txt");
            try
            {
                var ConferencesToImport = (from c in olddb.Conferences
                                           where c.IsDeleted == false
                                           select c).ToList();


                foreach (var c in ConferencesToImport)
                {

                    var Conference = new Models.Conferences()
                    {
                        ID = c.ID,
                        Title = c.Title,
                        URL = CommonFunctions.URLFriendly(c.Title),
                        Description = c.Description ?? "",
                        Objectives = c.Objective,
                        CEUs = "",
                        Agenda = "",
                        StartDate = c.StartDate,
                        EndDate = c.EndDate,
                        Credits = decimal.Parse(c.Credits.ToString()),
                        IsAccredited = c.Accredited ?? false,
                        LocationKnown = false,
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
                        ContactName = c.ContactName ?? "",
                        ContactDepartment = c.ContactDepartment ?? "",
                        ContactEmail = c.ContactEmail ?? "",
                        ContactPhone = c.ContactPhone ?? "",
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
                        MaxRegistrations = c.MaxRegistrations ?? 0,
                        WaitingListEnabled = c.WaitListEnabled ?? false,
                        ExternalRegistrationButtonEnabled = false,
                        PublicRegistrationEnabled = c.PublicRegistration ?? false,
                        RegistrationNoticeEmails = c.RegistrationNoticeEmail,
                        AdditionalInformation = c.AdditionalInfo,
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = TimeZoneInfo.ConvertTime(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time")),
                        ConferenceType = c.ConferenceType,
                        IsDeleted = c.IsDeleted ?? false
                    };

                    if (c.IsCancelled == true)
                    {
                        Conference.Status = "Canceled";
                    }
                    else if (c.PublicViewable == true)
                    {
                        Conference.Status = "Occurring";
                    }
                    else if (c.PublicViewable == false)
                    {
                        Conference.Status = "Hidden";
                    }
                    else if (c.IsCancelled == false && c.PublicViewable == null)
                    {
                        Conference.Status = "Unpublished";
                    }

                    if (c.isJointSponsor == true)
                    {
                        Conference.Providership = "Joint";
                    }
                    else
                    {
                        Conference.Providership = "Direct";
                    }

                    if (Conference.ExternalRegistrationButtonEnabled == true)
                    {
                        //Conference.PublicRegistrationLinkUrl = c.PublicRegistrationLinkUrl;
                        //Conference.PublicRegistrationLinkText = c.PublicRegistrationLinkText;
                    }
                    else
                    {
                        Conference.PublicRegistrationLinkUrl = "";
                        Conference.PublicRegistrationLinkText = "";
                    }

                    if (CommonFunctions.DoesUserExist(c.CreatingUserID))
                    {
                        Conference.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        Conference.CreatedBy = ImportUserID;
                    }

                    Conference.LocationName = c.Location ?? "";
                    Conference.LocationAddressLine1 = c.LocationAddress1 ?? "";
                    Conference.LocationAddressLine2 = c.LocationAddress2 ?? "";
                    Conference.LocationCity = c.LocationCity ?? "";
                    Conference.LocationState = c.LocationState ?? "";
                    Conference.LocationZipCode = c.LocationZip ?? "";

                    db.Conferences.Add(Conference);
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
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {


                var ConferencesWithJointProvidership = (from c in db.Conferences
                                                        where c.Providership == "Joint"
                                                        select c).ToList();

                foreach (var c in ConferencesWithJointProvidership)
                {
                    var JointProviderToImport = (from j in olddb.Conferences
                                                 where j.ID == c.ID
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {
                        var JointProviders = new ConferenceJointProviders()
                        {
                            ConferenceID = c.ID,
                            Name = JointProviderToImport
                        };
                        db.ConferenceJointProviders.Add(JointProviders);

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

        private static void ConferenceOptionGroup(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferencesOptionGroupsToImport = (from c in olddb.ConferenceExtraGroups
                                                       where c.IsDeleted == false
                                                       select c).ToList();

                foreach (var c in ConferencesOptionGroupsToImport)
                {
                    var Option = new ConferenceOptionsGroups()
                    {
                        ConferenceID = c.ID,
                        Name = c.Title,
                        Description = c.Description,
                        Required = false,
                        MaxOneSelection = c.SingularChoice ?? false,
                        Rank = c.Order ?? 0,
                        CreatedOn = DateTime.Now,
                        CreatedBy = ImportUserID
                    };
                    db.ConferenceOptionsGroups.Add(Option);

                }
                db.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

        private static void ConferenceOptions(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferencesOptionsGroups = (from c in olddb.ConferenceExtraGroups
                                                where c.IsDeleted == false
                                                select c).ToList();

                foreach (var c in ConferencesOptionsGroups)
                {
                    var ConferenceOptionsToImport = (from ce in olddb.ConferenceExtras
                                                     where ce.ConferenceID == c.ConferenceID
                                                     select ce).ToList();
                    foreach (var o in ConferenceOptionsToImport)
                    {
                        var Option = new ConferenceOptions()
                        {
                            GroupID = c.ID,
                            Name = o.Title,
                            Description = o.Description,
                            Price = decimal.Parse(o.Price),
                            Rank = o.Order ?? 1,
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID
                        };
                        db.ConferenceOptions.Add(Option);

                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

        private static void ConferencePrices(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferencesPrices = (from c in olddb.ConferencePrices
                                         where c.IsDeleted == false
                                         select c).ToList();

                foreach (var c in ConferencesPrices)
                {
                    if (c.ConfID != null)
                    {
                        var Price = new Models.ConferencePrices()
                        {
                            ConferenceID = c.ConfID ?? 0,
                            Tier = c.Name,
                            Price = decimal.Parse(c.Value),
                            Rank = c.Order ?? 1,
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID
                        };
                        db.ConferencePrices.Add(Price);

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

        private static void ConferenceRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferenceRegistrationsToImport = (from c in olddb.ConferenceRegistrations
                                                       where c.IsDeleted == false && c.ConferenceID != null
                                                       select c).ToList();

                foreach (var r in ConferenceRegistrationsToImport)
                {
                    if (r.ConferenceID != null)
                    {
                        if (CommonFunctions.DoesUserExist(r.UserID))
                        {
                            var Registration = new Models.ConferenceRegistrations()
                            {
                                ConferenceID = r.ConferenceID ?? 0,
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
                            db.ConferenceRegistrations.Add(Registration);
                        }
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

        private static void ConferenceSpecialties(string ImportUserID)
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

        private static void ConferenceStreams(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferenceStreamsToImport = (from c in olddb.ConferenceStreams
                                                 where c.IsDeleted == false
                                                 select c).ToList();

                foreach (var c in ConferenceStreamsToImport)
                {

                    var Stream = new Models.ConferenceStreams()
                    {
                        ID = c.ID,
                        ConferenceID = c.ConferenceID,
                        StreamTitle = c.StreamTitle,
                        StreamDescription = c.StreamDescription,
                        StreamURL = c.StreamURL,
                        StartDateTime = c.StartDateTime,
                        EndDateTime = c.EndDateTime,
                        IsDeleted = false
                    };
                    db.ConferenceStreams.Add(Stream);

                }
                db.SaveChanges();

            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

        private static void ConferenceStreamViews(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferenceStreamViewToImport = (from c in olddb.ConferenceStreamViews
                                                    select c).ToList();

                foreach (var c in ConferenceStreamViewToImport)
                {
                    if (CommonFunctions.DoesUserExist(c.UserID))
                    {
                        var View = new Models.ConferenceStreamViews()
                        {
                            ConferenceID = c.ConferenceID,
                            ConferenceStreamID = c.ConferenceStreamID,
                            UserID = c.UserID,
                            TimeStamp = c.TimeStamp
                        };
                        db.ConferenceStreamViews.Add(View);
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
    }
}

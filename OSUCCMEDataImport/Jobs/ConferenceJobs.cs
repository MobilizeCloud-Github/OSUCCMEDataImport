using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class ConferenceJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

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

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
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
                var TransferStartDate = new DateTime(2012, 1, 1);
                var ConferencesToImport = (from c in olddb.Conferences
                                           where c.IsDeleted == false && c.StartDate >= TransferStartDate
                                           select c).ToList();

                var Total = ConferencesToImport.Count();
                Console.Write("Importing Conferences - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in ConferencesToImport)
                {
                    Console.Write("Processing Conferences: (" + Index + "/" + Total + ") " + c.ID + " ");
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
                        RegistrationNoticeEmails = c.RegistrationNoticeEmail ?? "",
                        AdditionalInformation = c.AdditionalInfo ?? "",
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = DateTime.Now,
                        ConferenceType = c.ConferenceType,
                        IsDeleted = c.IsDeleted ?? false,
                        PublicRegistrationLinkUrl = "",
                        PublicRegistrationLinkText = "",
                        LastUpdatedBy = ImportUserID,
                        LastUpdatedOn = DateTime.Now
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

                    if (CommonFunctions.DoesUserExist(db, c.CreatingUserID))
                    {
                        Conference.CreatedBy = c.CreatingUserID;
                    }
                    else
                    {
                        Conference.CreatedBy = ImportUserID;
                    }
                    if (c.LocationState == "None" || string.IsNullOrWhiteSpace(c.LocationState))
                    {
                        Conference.LocationKnown = false;
                        Conference.LocationName = "";
                        Conference.LocationAddressLine1 = "";
                        Conference.LocationAddressLine2 = "";
                        Conference.LocationCity = "";
                        Conference.LocationState = "";
                        Conference.LocationZipCode = "";
                        Conference.LocationPostalCode = "";
                        Conference.LocationProvinceRegion = "";
                        Conference.LocationCountry = "";
                    }
                    else
                    {
                        Conference.LocationKnown = true;
                        Conference.LocationName = c.Location ?? "";
                        Conference.LocationAddressLine1 = c.LocationAddress1 ?? "";
                        Conference.LocationAddressLine2 = c.LocationAddress2 ?? "";
                        Conference.LocationCity = c.LocationCity ?? "";
                        Conference.LocationState = c.LocationState ?? "";
                        Conference.LocationZipCode = CommonFunctions.GetTrimedString(c.LocationZip, 5);
                        Conference.LocationPostalCode = "";
                        Conference.LocationProvinceRegion = "";
                        Conference.LocationCountry = "US";
                    }

                    db.Conferences.Add(Conference);
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
                var ConferencesWithJointProvidership = (from c in db.Conferences
                                                        where c.Providership == "Joint" && c.IsDeleted == false
                                                        select c.ID).ToList();

                var Total = ConferencesWithJointProvidership.Count();
                Console.Write("Importing Conferences Joint Providers - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in ConferencesWithJointProvidership)
                {
                    Console.Write("Processing Conferences Joint Providers : (" + Index + "/" + Total + ") " + c + " ");
                    var JointProviderToImport = (from j in olddb.Conferences
                                                 where j.ID == c && j.JointSponsor != null && j.JointSponsor != ""
                                                 select j.JointSponsor).FirstOrDefault();

                    if (!string.IsNullOrWhiteSpace(JointProviderToImport))
                    {
                        var JointProviders = new ConferenceJointProviders()
                        {
                            ConferenceID = c,
                            Name = JointProviderToImport
                        };
                        db.ConferenceJointProviders.Add(JointProviders);
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
                                                       select new
                                                       {
                                                           c.ID,
                                                           c.ConferenceID,
                                                           c.Title,
                                                           c.Description,
                                                           c.SingularChoice,
                                                           c.Order
                                                       }).ToList();

                var Total = ConferencesOptionGroupsToImport.Count();
                Console.Write("Importing Conferences Option Groups - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var c in ConferencesOptionGroupsToImport)
                {
                    Console.Write("Processing Conference Options Groups : (" + Index + "/" + Total + ") " + c.ID + " ");

                    var ConferenceID = int.Parse(c.ConferenceID);
                    if (ConferenceIDs.Contains(ConferenceID))
                    {
                        var Option = new ConferenceOptionsGroups()
                        {
                            ID = c.ID,
                            ConferenceID = int.Parse(c.ConferenceID),
                            Name = c.Title,
                            Description = c.Description ?? "",
                            Required = false,
                            MaxOneSelection = c.SingularChoice ?? false,
                            Rank = c.Order ?? 0,
                            CreatedOn = DateTime.Now,
                            CreatedBy = ImportUserID,
                            LastUpdatedBy = ImportUserID,
                            LastUpdatedOn = DateTime.Now
                        };
                        db.ConferenceOptionsGroups.Add(Option);
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

        private static void ConferenceOptions(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferencesOptions = (from c in db.ConferenceOptionsGroups
                                          where c.IsDeleted == false
                                          select new { c.ID, c.ConferenceID }).ToList();

                var Total = ConferencesOptions.Count();
                Console.Write("Importing Conferences Options - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in ConferencesOptions)
                {
                    Console.WriteLine("Processing Conference Options : (" + Index + "/" + Total + ") " + c.ID + " ");

                    var ConferenceOptionsToImport = (from ce in olddb.ConferenceExtras
                                                     where ce.ConferenceID == c.ConferenceID.ToString() && ce.GroupBy == c.ID
                                                     select new
                                                     {
                                                         ce.ID,
                                                         ce.Title,
                                                         ce.Description,
                                                         ce.Price,
                                                         ce.Order
                                                     }).ToList();
                    if (ConferenceOptionsToImport.Any())
                    {
                        foreach (var o in ConferenceOptionsToImport)
                        {
                            var Option = new ConferenceOptions()
                            {
                                ID = o.ID,
                                GroupID = c.ID,
                                Name = CommonFunctions.GetTrimedString(o.Title, 128),
                                Description = CommonFunctions.GetTrimedString(o.Description, 512),
                                Price = decimal.Parse(o.Price),
                                Rank = o.Order ?? 1,
                                CreatedOn = DateTime.Now,
                                CreatedBy = ImportUserID,
                                LastUpdatedBy = ImportUserID,
                                LastUpdatedOn = DateTime.Now,

                            };
                            db.ConferenceOptions.Add(Option);
                            Console.WriteLine("Saved Option - " + o.ID);
                        }
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
                    }
                    db.SaveChanges();
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

                var Total = ConferencesPrices.Count();
                Console.Write("Importing Conferences Prices - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var c in ConferencesPrices)
                {

                    Console.Write("Processing Conference Prices : (" + Index + "/" + Total + ") " + c.ID + " ");

                    if (c.ConfID != null)
                    {
                        var ConferenceID = c.ConfID;
                        if (ConferenceIDs.Contains(ConferenceID.Value))
                        {
                            var Price = new Models.ConferencePrices()
                            {
                                ConferenceID = ConferenceID.Value,
                                Tier = c.Name,
                                Price = decimal.Parse(c.Value),
                                Rank = c.Order ?? 1,
                                CreatedOn = DateTime.Now,
                                CreatedBy = ImportUserID,
                                LastUpdatedBy = ImportUserID,
                                LastUpdatedOn = DateTime.Now
                            };
                            db.ConferencePrices.Add(Price);
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

        private static void ConferenceRegistrations(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferenceRegistrationsToImport = (from c in olddb.ConferenceRegistrations
                                                       where c.IsDeleted == false && c.ConferenceID != null && c.Confirmation != "Speaker"
                                                       select c).ToList();

                var Total = ConferenceRegistrationsToImport.Count();
                Console.Write("Importing Conferences Registrations - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var r in ConferenceRegistrationsToImport)
                {
                    Console.Write("Processing Conference Registrations : (" + Index + "/" + Total + ") " + r.ID + " ");
                    if (r.ConferenceID != null)
                    {
                        var ConferenceID = r.ConferenceID;
                        if (ConferenceIDs.Contains(ConferenceID.Value))
                        {
                            if (CommonFunctions.DoesUserExist(db, r.UserID))
                            {

                                var Registration = new Models.ConferenceRegistrations()
                                {
                                    ConferenceID = r.ConferenceID ?? 0,
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
                                }

                                db.ConferenceRegistrations.Add(Registration);

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
                db.SaveChanges();
                Console.WriteLine(" - Complete");


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
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var ConferenceSpecialtiesToImport = (from cs in olddb.ConferenceSearchCategories
                                                     select new
                                                     {
                                                         cs.ConferenceID,
                                                         cs.CategoryID
                                                     }).ToList();

                var Total = ConferenceSpecialtiesToImport.Count();
                Console.Write("Importing Conferences Specialties - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var CategoryMappings = (from v in db.CategoryMapping
                                        select new
                                        {
                                            v.OldID,
                                            v.NewID
                                        }).ToList();

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var c in ConferenceSpecialtiesToImport)
                {
                    Console.Write("Processing Specialties : (" + Index + "/" + Total + ") " + c.ConferenceID + " " + c.CategoryID);

                    var ConferenceID = c.ConferenceID;
                    if (ConferenceIDs.Contains(ConferenceID.Value))
                    {
                        var NewSpecialtyID = (from v in CategoryMappings
                                              where v.OldID == c.CategoryID
                                              select v.NewID).FirstOrDefault();

                        var Specialty = new ConferenceSpecialties()
                        {
                            ConferenceID = c.ConferenceID ?? 0,
                            SpecialtyID = NewSpecialtyID ?? 0
                        };
                        db.ConferenceSpecialties.Add(Specialty);
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

                var Total = ConferenceStreamsToImport.Count();
                Console.Write("Importing Conferences Streams - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                var ConferenceIDs = (from c in db.Conferences
                                     where c.IsDeleted == false
                                     select c.ID).ToList();

                foreach (var c in ConferenceStreamsToImport)
                {
                    Console.Write("Processing Streams: (" + Index + "/" + Total + ") " + c.ID + " ");

                    var ConferenceID = c.ConferenceID;
                    if (ConferenceIDs.Contains(ConferenceID))
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

                        if (c.StreamURL.Contains("zoom"))
                        {
                            Stream.StreamType = "Zoom";
                        }
                        else if (c.StreamURL.Contains("teams"))
                        {
                            Stream.StreamType = "Teams";
                        }
                        else
                        {
                            Stream.StreamType = "Other";
                        }

                        db.ConferenceStreams.Add(Stream);

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

        private static void ConferenceStreamViews(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            TextWriter tw = new StreamWriter("ConferenceStreamViewsLog.txt");

            try
            {
                var ConferenceStreams = (from cs in db.ConferenceStreams
                                         select cs.ID).ToList();

                var Total = ConferenceStreams.Count();
                Console.Write("Importing Conferences Stream Views - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in ConferenceStreams)
                {
                    Console.Write("Processing Stream Views : (" + Index + "/" + Total + ") " + c + " ");

                    var ConferenceStreamViewToImport = (from v in olddb.ConferenceStreamViews
                                                        where v.ConferenceStreamID == c
                                                        select v).ToList();

                    var TotalUser = ConferenceStreamViewToImport.Count();
                    Console.WriteLine(TotalUser + " to Process");
                    var UserIndex = 1;

                    foreach (var v in ConferenceStreamViewToImport)
                    {
                        Console.Write("Stream Users : (" + Index + "/" + Total + ") (" + UserIndex + "/" + TotalUser + ") " + c + " ");
                        if (CommonFunctions.DoesUserExist(db, v.UserID))
                        {
                            var View = new Models.ConferenceStreamViews()
                            {
                                ConferenceID = v.ConferenceID,
                                ConferenceStreamID = c,
                                UserID = v.UserID,
                                TimeStamp = v.TimeStamp
                            };
                            db.ConferenceStreamViews.Add(View);
                            if (UserIndex % 5 == 0)
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
                            Console.WriteLine(" - User Doesn't Exist");
                            tw.WriteLineAsync(v.UserID + " - User Doesn't Exist");
                        }
                        UserIndex++;
                    }
                    db.SaveChanges();
                    Index++;
                }
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }

            tw.Close();
        }
    }
}

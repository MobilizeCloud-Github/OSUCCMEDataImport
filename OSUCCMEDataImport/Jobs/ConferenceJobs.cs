using OldOSUDatabase.Models;
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
            Conferences();
        }

        private static void Conferences()
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var ConferencesToImport = (from c in olddb.Conferences
                                       select c).ToList();

            TextWriter tw = new StreamWriter("ConferencesImportLog.txt");
            foreach (var c in ConferencesToImport)
            {
                try
                {
                    var NewConference = new Models.Conferences()
                    {
                        ID = c.ID,
                        Title = c.Title,
                        URL = "",
                        Description = c.Description,
                        Objectives = c.Objective,
                        Agenda = "",
                        CEUs = "",
                        Providership = "",
                        StartDate = c.StartDate,
                        EndDate = c.EndDate,
                        Credits = decimal.Parse(c.Credits.ToString() ?? "0"),
                        IsAccredited = c.Accredited ?? false,
                        RegisterForMIPS = ,
                        LocationKnown = ,
                        LocationName = ,
                        LocationAddressLine1 = c.LocationAddress1,
                        LocationAddressLine2 = c.LocationAddress2,
                        LocationCity = c.LocationCity,
                        LocationState = c.LocationState,
                        LocationZipCode = c.LocationZip,
                        Latitude = ,
                        Longitude = ,
                        Status = ,
                        ContactName = ,
                        ContactDepartment = ,
                        ContactEmail = ,
                        ContactPhone = ,
                        MaxRegistrations = c.MaxRegistrations,
                        WaitingListEnabled = c.WaitListEnabled ?? false,
                        PublicRegistrationEnabled = c.PublicRegistration ?? false,
                        RegistrationNoticeEmails = c.RegistrationNoticeEmail,
                        AdditionalInformation = c.AdditionalInfo,
                        SendCreditNotifications = c.SendCreditNotifications,
                        CreatedOn = c.CreatedDate.Value,
                        CreatedBy = c.CreatingUserID,
                        LastUpdatedOn = DateTime.Now,
                        LastUpdatedBy = ,
                        IsDeleted = c.IsDeleted ?? false,
                        ABMSPatientCareAndProceduralSkills = c.ABMSPatientCareAndProceduralSkills ?? false,
                        ABMSMedicalKnowledge = c.ABMSMedicalKnowledge ?? false,
                        ABMSPracticeBasedLearningAndImprovement = c.ABMSPracticeBasedLearningAndImprovement ?? false,
                        ABMSInterpersonalAndCommunicationSkills = c.ABMSInterpersonalAndCommunicationSkills ?? false,
                        ABMSProfessionalism = c.ABMSProfessionalism ?? false,
                        ABMSSystemsBasedPractice = c.ABMSSystemsBasedPractice ?? false,
                        IOMProvidePatientCenteredCare = c.IOMProvidePatientCenteredCare ?? false,
                        IOMWorkInInterdisciplinaryTeams = c.IOMWorkInInterdisciplinaryTeams ?? false,
                        IOMEmployEvidenceBasedPractice = c.IOMEmployEvidenceBasedPractice ?? false,
                        IOMApplyQualityImprovement = c.IOMApplyQualityImprovement ?? false,
                        IOMUtilizeInformatics = c.IOMUtilizeInformatics ?? false,
                        IECValueEthicsForInterprofessionalPractice = c.IECValuesEthicsForInterprofessionalPractice ?? false,
                        IECRolesResponsibilities = c.IECRolesResponsibilities ?? false,
                        IECInterprofessionalCommunication = c.IECInterprofessionalCommunication ?? false,
                        IECTeamsAndTeamwork = c.IECTeamsAndTeamwork ?? false,
                        OCCompetenciesOtherThanThoseListedWereAddressed = c.OCCompetenciesOtherThanThoseListedWereAddressed ?? false,
                        LocationCountry = ,
                        LocationProvinceRegion = ,
                        LocationPostalCode = c.LocationZip,
                        ExternalRegistrationButtonEnabled = ,
                        PublicRegistrationLinkText = ,
                        PublicRegistrationLinkUrl = ,
                        ConferenceType = c.ConferenceType,
                        MOCPoints = ,
                        IsMOCEligible = ,
                        ShowContactInformation = ,
                        LearnerCompetence = ,
                        LearnerCompetenceObjective = ,
                        LearnerCompetenceSubjective = ,
                        LearnerPerformance = ,
                        LearnerPerformanceObjective = ,
                        LearnerPerformanceSubjective = ,
                        PatientHealth = ,
                        PatientHealthObjective = ,
                        PatientHealthSubjective = ,
                        CommunityPopulationHealth = ,
                        CommunityPopulationHealthObjective = ,
                        CommunityPopulationHealthSubjective = ,

                    };
                    db.Conferences.Add(NewConference);
                    db.SaveChanges();


                }
                catch (Exception e)
                {
                    tw.WriteLine(e.Message);
                }


            }
        }

        private static void SaveUserBoards(NewOSUCCMEEntities db, Users User)
        {

        }

        private static int GetMappedSpecialtyID(NewOSUCCMEEntities db, Users User)
        {

        }

        private static int GetMappedDegreeID(NewOSUCCMEEntities db, Users User)
        {

        }

        private static int GetMappedProfessionID(NewOSUCCMEEntities db, Users User)
        {

        }

        private static bool CheckIfSwitchbox(Users user)
        {
            if (user.Username.Contains("@switchboxinc"))
            {
                return false;
            }

            return true;
        }
    }
}

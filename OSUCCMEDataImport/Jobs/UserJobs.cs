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
    class UserJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            ImportUserProfiles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportUserEmailPreferences(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportUserRoles(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            ImportABIMNumbers(ImportUserID);

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }



        private static void ImportUserProfiles(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;

            Console.WriteLine("Starting User Profile Import");
            var UsersToImport = (from u in olddb.Users
                                 join m in olddb.aspnet_Membership
                                 on u.UserID equals m.UserId.ToString()
                                 where u.IsDeleted == false && m != null
                                 select new
                                 {
                                     u.Username,
                                     u.UserID,
                                     u.FirstName,
                                     u.LastName,
                                     u.MiddleName,
                                     u.ProfessionID,
                                     u.UserDegreeID,
                                     u.SpecialtyID,
                                     u.PrefixID,
                                     u.BusinessPhone,
                                     u.BusinessPhoneExtension,
                                     u.DateOfBirth,
                                     u.IsABIM,
                                     u.IsDeceased,
                                     u.IsDeleted,
                                     u.FaxNumber,
                                     u.SpecialNeeds,
                                     u.Department,
                                     u.NameTag,
                                     u.MailingAddress1,
                                     u.MailingAddress2,
                                     u.MailingCity,
                                     u.MailingState,
                                     u.MailingZip,
                                     u.MailingCountry,
                                     u.CreatedDate,
                                     u.LastAccessed,
                                     u.ABIMDiplomatNumber,
                                     m.Password,
                                     m.PasswordFormat,
                                     m.PasswordSalt
                                 }).ToList();

            Console.WriteLine("Old User Prfoiles Selected");

            TextWriter tw = new StreamWriter("UsersToImportLog.txt");

            var Total = UsersToImport.Count();
            Console.Write("Importing User Profiles - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            var MappedSpecialties = (from x in db.SpecialtyMapping
                                     select x).ToList();

            var MappedDegrees = (from x in db.DegreeMapping
                                 select x).ToList();

            var MappedTitle = (from x in db.TitleMapping
                               select x).ToList();

            var MappedProfessions = (from x in db.ProfessionMapping
                                     select x).ToList();


            var UsersToAdd = new List<UserProfiles>();
            foreach (var User in UsersToImport)
            {
                Console.Write("Processing : (" + Index + "/" + Total + ") " + User.Username + " ");
                if (IsValidEmail(User.Username))
                {
                    if (!CheckIfSwitchbox(User.Username))
                    {
                        try
                        {

                            var NewUserLogin = new AspNetUsers()
                            {
                                Id = User.UserID,
                                Email = User.Username,
                                EmailConfirmed = false,
                                PasswordHash = User.Password + '|' + User.PasswordFormat + '|' + User.PasswordSalt,
                                SecurityStamp = Guid.NewGuid().ToString(),
                                PhoneNumberConfirmed = false,
                                TwoFactorEnabled = false,
                                LockoutEnabled = true,
                                AccessFailedCount = 0,
                                UserName = User.Username,
                                PasswordHashUpdated = false
                            };
                            db.AspNetUsers.Add(NewUserLogin);

                            Console.Write(" - Login Created");

                            var NewUser = new UserProfiles()
                            {
                                UserID = User.UserID,
                                Email = User.Username,
                                TitleID = GetMappedTitleID(db, MappedTitle, User.PrefixID, User.UserID, User.Username),
                                FirstName = User.FirstName ?? "",
                                MiddleName = User.MiddleName ?? "",
                                LastName = User.LastName ?? "",
                                ProfessionID = GetMappedProfessionID(db, MappedProfessions, User.ProfessionID, User.UserID, User.Username),
                                DegreeID = GetMappedDegreeID(db, MappedDegrees, User.UserDegreeID, User.UserID, User.Username),
                                TraineeType = "",
                                SpecialtyID = GetMappedSpecialtyID(db, MappedSpecialties, User.SpecialtyID, User.UserID, User.Username),
                                Phone = CommonFunctions.GetTrimedString(User.BusinessPhone, 50),
                                PhoneExtension = CommonFunctions.GetTrimedString(User.BusinessPhoneExtension, 50),
                                Fax = CommonFunctions.GetTrimedString(User.FaxNumber, 50),
                                SpecialNeeds = CommonFunctions.GetTrimedString(User.SpecialNeeds, 256),
                                Department = CommonFunctions.GetTrimedString(User.Department, 128),
                                NameTag = CommonFunctions.GetTrimedString(User.NameTag, 128),
                                Address1 = CommonFunctions.GetTrimedString(User.MailingAddress1, 256),
                                Address2 = CommonFunctions.GetTrimedString(User.MailingAddress2, 256),
                                City = CommonFunctions.GetTrimedString(User.SpecialNeeds, 256),
                                CreatedBy = importUserID,
                                CreatedOn = User.CreatedDate ?? DateTime.Now,
                                LastAccessedOn = User.LastAccessed,
                                IsDeceased = User.IsDeceased ?? false,
                                IsDeleted = User.IsDeleted ?? false,
                                OSUID = "",
                                NationalProviderIdentifier = "",
                                AnnualFacultyDisclosureOverrideEnabled = false,
                                Birthdate = User.DateOfBirth,
                                IsBoardCertifiedPhysician = User.IsABIM
                            };

                            var MailingCountry = User.MailingCountry;

                            if (MailingCountry == "1")
                            {
                                MailingCountry = "US";
                            }
                            if (MailingCountry == "")
                            {
                                MailingCountry = "PK";
                            }
                            if (MailingCountry == "None")
                            {
                                MailingCountry = "PE";
                            }
                            if (MailingCountry == "United States")
                            {
                                MailingCountry = "US";
                            }

                            if (MailingCountry != "US")
                            {
                                NewUser.State = "";
                                NewUser.ZipCode = "";
                                NewUser.ProvinceRegion = CommonFunctions.GetTrimedString(User.MailingState, 256);
                                NewUser.PostalCode = CommonFunctions.GetTrimedString(User.MailingZip, 25);
                                NewUser.Country = MailingCountry.Trim();
                            }
                            else
                            {
                                NewUser.ProvinceRegion = "";
                                NewUser.PostalCode = "";
                                NewUser.State = CommonFunctions.GetTrimedString(User.MailingState, 256);
                                NewUser.ZipCode = CommonFunctions.GetTrimedString(User.MailingZip, 25);
                                NewUser.Country = "US";

                            }

                            UsersToAdd.Add(NewUser);

                            if (Index % 10 == 0 || Index == Total)
                            {
                                db.UserProfiles.AddRange(UsersToAdd);
                                db.SaveChanges();
                                UsersToAdd.Clear();
                                Console.WriteLine(" - Saved");
                            }
                            else
                            {
                                Console.WriteLine(" - Pending");
                            }
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("");
                            Console.WriteLine(" - " + e.Message);
                            tw.WriteLineAsync(e.Message);
                        }
                    }
                    else
                    {
                        Console.WriteLine(" - Old Switchbox Account");
                        tw.WriteLineAsync(User.Username + " " + User.UserID + " Error Importing - Old Switchbox Account");

                    }
                }
                else
                {
                    Console.WriteLine(" - Invalid Email");
                    tw.WriteLineAsync(User.Username + " " + User.UserID + " Error Importing - Invalid Email");
                }
                Index++;
            }
            Console.WriteLine(" - Complete");
            tw.Close();
        }

        private static bool IsValidEmail(string email)
        {
            var trimmedEmail = email.Trim();

            if (trimmedEmail.EndsWith("."))
            {
                return false;
            }
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == trimmedEmail;
            }
            catch
            {
                return false;
            }
        }



        private static void ImportUserEmailPreferences(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;


            var UserIDs = (from u in db.UserProfiles
                           where u.IsDeleted == false && u.IsDeceased == false
                           select u.UserID).ToList();


            TextWriter tw = new StreamWriter("UserEmailPreferencesLog.txt");

            var Total = UserIDs.Count();
            Console.Write("Importing User Email Preferences - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;

            var EmailPreferencesToAdd = new List<Models.EmailPreferences>();
            try
            {
                foreach (var UserID in UserIDs)
                {                    
                    Console.Write("Processing : " + UserID + " (" + Index + "/" + Total + ") ");
                    var Preferences = (from u in olddb.EmailPreferences
                                       where u.UserID == UserID
                                       select new
                                       {
                                           u.Type,
                                           u.FrequencyID
                                       }).ToList();
                    foreach (var Preference in Preferences)
                    {
                        var NewEmailPreference = new Models.EmailPreferences()
                        {
                            UserID = UserID,
                            EmailType = GetEmailType(Preference.Type),
                            EmailFrequency = GetEmailFrequency(Preference.FrequencyID),
                            LastUpdated = DateTime.Now
                        };
                        EmailPreferencesToAdd.Add(NewEmailPreference);

                        Console.Write(" - " + NewEmailPreference.EmailType + " saved");
                    }

                    var GeneralPreference = new Models.EmailPreferences()
                    {
                        UserID = UserID,
                        EmailType = "GeneralAnnouncements",
                        EmailFrequency = "Monthly",
                        LastUpdated = DateTime.Now
                    };
                    EmailPreferencesToAdd.Add(GeneralPreference);

                    Console.Write(" - GeneralAnnouncements saved");

                    var RSSeriesPreference = new Models.EmailPreferences()
                    {
                        UserID = UserID,
                        EmailType = "GrandRoundsNewsletters",
                        EmailFrequency = "Monthly",
                        LastUpdated = DateTime.Now
                    };
                    EmailPreferencesToAdd.Add(RSSeriesPreference);
                    

                    Console.Write(" - GrandRoundsNewsletters saved");

                    

                    if (Index % 10 == 0 || Index == Total)
                    {
                        db.EmailPreferences.AddRange(EmailPreferencesToAdd);
                        db.SaveChanges();
                        EmailPreferencesToAdd.Clear();
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

        private static void ImportUserRoles(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;

            var Roles = (from u in olddb.aspnet_Roles
                         select u);

            TextWriter tw = new StreamWriter("UserRolesLog.txt");

            var Total = Roles.Count();
            Console.Write("Importing User Roles - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;
            foreach (var Role in Roles)
            {
                var NewRole = GetNewRole(db, Role.RoleName);

                Console.WriteLine("Processing : " + Role.RoleName + " (" + Index + "/" + Total + ") ");
                var TotalUser = Role.aspnet_Users.Count();
                Console.WriteLine(TotalUser + " users to Process");
                foreach (var User in Role.aspnet_Users)
                {
                    try
                    {
                        var NewUser = (from u in db.UserProfiles
                                       where u.UserID == User.UserId.ToString() && u.IsDeleted == false
                                       select u).FirstOrDefault();
                        if (NewUser != null)
                        {
                            NewUser.AspNetUsers.AspNetRoles.Add(NewRole);
                            db.SaveChanges();
                        }
                        Console.WriteLine(User.UserName + " - Processed");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("");
                        Console.WriteLine(" - " + e.Message);
                        tw.WriteLineAsync(e.Message);
                    }
                }
            }
            tw.Close();
        }

        private static void ImportABIMNumbers(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            db.Configuration.AutoDetectChangesEnabled = false;
            olddb.Configuration.AutoDetectChangesEnabled = false;


            var OldUsers = (from u in olddb.Users
                            where u.IsDeleted == false && u.IsDeceased == false && u.IsABIM == true
                            select new
                            {
                                u.UserID,
                                u.ABIMDiplomatNumber
                            }).ToList();


            TextWriter tw = new StreamWriter("UserABIMNumbers.txt");

            var Total = OldUsers.Count();
            Console.Write("Importing ABIM Numbers - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;
            var UserBoardsToAdd = new List<UserBoardIdentificationNumbers>();
            foreach (var OldUser in OldUsers)
            {
                try
                {
                    Console.Write("Processing : " + OldUser.UserID + " (" + Index + "/" + Total + ") ");

                    if (CommonFunctions.DoesUserExist(db, OldUser.UserID))
                    {
                        var UserBoard = new UserBoardIdentificationNumbers()
                        {
                            UserProfileID = OldUser.UserID,
                            BoardID = 9,
                            IdentificationNumber = OldUser.ABIMDiplomatNumber
                        };
                        UserBoardsToAdd.Add(UserBoard);
                        Console.Write(" - pending");
                    }
                    else
                    {
                        Console.Write(" - skipped");
                    }

                    
                }
                catch (Exception e)
                {
                    Console.WriteLine("");
                    Console.WriteLine(" - " + e.Message);
                    tw.WriteLineAsync(e.Message);
                }
                Index++;
            }
            db.UserBoardIdentificationNumbers.AddRange(UserBoardsToAdd);
            db.SaveChanges();
            Console.Write(" - ABIM Nunbers saved");
            Console.WriteLine(" - Complete");
            tw.Close();
        }

        private static AspNetRoles GetNewRole(NewOSUCCMEEntities db, string OldRoleName)
        {
            var NewRoleId = "";
            switch (OldRoleName)
            {
                case "Administrator":
                    {
                        NewRoleId = "WebsiteAdmin";
                        break;
                    }
                case "ConferenceSuperAdmin":
                    {
                        NewRoleId = "ConferenceAdmin";
                        break;
                    }
                case "EnduringSuperAdmin":
                    {
                        NewRoleId = "EnduringMaterialAdmin";
                        break;
                    }
                case "HospitalAdmin":
                    {
                        NewRoleId = "IndividualHospitalAdmin";
                        break;
                    }
                case "HospitalSuperAdmin":
                    {
                        NewRoleId = "HospitalAdmin";
                        break;
                    }
                case "RSSeriesAdmin":
                    {
                        NewRoleId = "IndividualRSSeriesAdmin";
                        break;
                    }
                case "RSSeriesSuperAdmin":
                    {
                        NewRoleId = "RSSeriesAdmin";
                        break;
                    }
                case "SuperAdmin":
                    {
                        NewRoleId = "MasterAdmin";
                        break;
                    }
                case "WebcastSuperAdmin":
                    {
                        NewRoleId = "WebcastAdmin";
                        break;
                    }
                default:
                    {
                        return null;
                    }
            }

            if (NewRoleId != "")
            {
                return (from r in db.AspNetRoles
                        where r.Id == NewRoleId
                        select r).FirstOrDefault();
            }
            else
            {
                return null;
            }
        }

        private static string GetEmailFrequency(int FrequencyID)
        {
            switch (FrequencyID)
            {
                case 1:
                    {
                        return "Monthly";
                    }
                case 2:
                    {
                        return "Every Two Months";
                    }
                case 3:
                    {
                        return "Every Three Months";
                    }
                default:
                    {
                        return "Never";
                    }
            }
        }

        private static string GetEmailType(string Type)
        {
            if (Type == "Conferences")
            {
                return "ConferenceNewsletters";
            }
            else
            {
                return "WebcastNewsletters";
            }
        }

        private static void SaveUserBoards(NewOSUCCMEEntities db, string ABIMDiplomatNumber, string UserID)
        {
            var UserBoard = new UserBoardIdentificationNumbers()
            {
                UserProfileID = UserID,
                BoardID = 9,
                IdentificationNumber = ABIMDiplomatNumber
            };
            db.UserBoardIdentificationNumbers.Add(UserBoard);
            db.SaveChanges();
        }

        private static int GetMappedSpecialtyID(NewOSUCCMEEntities db, List<SpecialtyMapping> MappedSpecialties, int? SpecialtyID, string UserID, string Email)
        {
            if (SpecialtyID != null)
            {
                var NewID = (from x in MappedSpecialties
                             where x.OldID == SpecialtyID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(Email + " " + UserID + " Error Importing - Speciality ID No Match"));
                }
            }
            else
            {
                return 33;
            }
        }

        private static int GetMappedDegreeID(NewOSUCCMEEntities db, List<DegreeMapping> MappedDegress, int? DegreeID, string UserID, string Email)
        {
            if (DegreeID != null)
            {
                var NewID = (from x in MappedDegress
                             where x.OldID == DegreeID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(Email + " " + UserID + " Error Importing - Degree ID No Match"));
                }
            }
            else
            {
                return 19;
            }
        }

        private static int GetMappedProfessionID(NewOSUCCMEEntities db, List<ProfessionMapping> MappedProfessions, int? ProfessionID, string UserID, string Email)
        {
            if (ProfessionID != null)
            {
                var NewID = (from x in MappedProfessions
                             where x.OldID == ProfessionID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(Email + " " + UserID + " Error Importing - Mapped ID No Match"));
                }
            }
            else
            {
                return 29;
            }
        }

        private static int GetMappedTitleID(NewOSUCCMEEntities db, List<TitleMapping> MappedTitles, int? PrefixID, string UserID, string Email)
        {
            if (PrefixID != null)
            {
                var NewID = (from x in MappedTitles
                             where x.OldID == PrefixID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(Email + " " + UserID + " Error Importing - Prefix ID No Match"));
                }
            }
            else
            {
                throw (new Exception(Email + " " + UserID + " Error Importing - Prefix ID Blank"));
            }
        }

        private static bool CheckIfSwitchbox(string Username)
        {
            if (Username.ToLower().Contains("switchboxinc"))
            {
                return true;
            }

            return false;
        }
    }
}

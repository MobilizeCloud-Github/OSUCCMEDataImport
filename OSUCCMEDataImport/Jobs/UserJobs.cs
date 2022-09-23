using OSUCCMEDataImport.Models;
using OldOSUDatabase.Models;
using System;
using System.IO;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class UserJobs
    {
        public static void Process(string ImportUserID)
        {
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
        }



        private static void ImportUserProfiles(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var UsersToImport = (from u in olddb.Users
                                 where u.Username == "rob@mobilizecloud.com"
                                 select u).ToList();

            TextWriter tw = new StreamWriter("UsersToImportLog.txt");

            var Total = UsersToImport.Count();
            Console.Write("Importing User Profiles - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;
            foreach (var User in UsersToImport)
            {
                Console.Write("Processing : " + User.Username + " (" + Index + "/" + Total + ") ");
                Guid OldUserID = new Guid(User.UserID);
                var OldUserLogin = (from u in olddb.aspnet_Membership
                                    where u.UserId == OldUserID
                                    select u).FirstOrDefault();

                if (!CheckIfSwitchbox(User))
                {

                    if (OldUserLogin != null)
                    {
                        try
                        {

                            var NewUserLogin = new AspNetUsers()
                            {
                                Id = User.UserID,
                                Email = User.Username,
                                EmailConfirmed = false,
                                PasswordHash = OldUserLogin.Password + '|' + OldUserLogin.PasswordFormat + '|' + OldUserLogin.PasswordSalt,
                                SecurityStamp = new Guid().ToString(),
                                PhoneNumberConfirmed = false,
                                TwoFactorEnabled = false,
                                LockoutEnabled = false,
                                AccessFailedCount = 0,
                                UserName = User.Username,
                                PasswordHashUpdated = false
                            };
                            db.AspNetUsers.Add(NewUserLogin);
                            db.SaveChanges();

                            Console.Write(" - Login Created");

                            var NewUser = new UserProfiles()
                            {
                                UserID = User.UserID,
                                Email = User.Username,
                                TitleID = GetMappedTitleID(db, User),
                                FirstName = User.FirstName ?? "",
                                MiddleName = User.MiddleName ?? "",
                                LastName = User.LastName ?? "",
                                ProfessionID = GetMappedProfessionID(db, User),
                                DegreeID = GetMappedDegreeID(db, User),
                                TraineeType = "",
                                SpecialtyID = GetMappedSpecialtyID(db, User),
                                Phone = User.BusinessPhone ?? "",
                                PhoneExtension = User.BusinessPhoneExtension ?? "",
                                Fax = User.FaxNumber ?? "",
                                SpecialNeeds = User.SpecialNeeds ?? "",
                                Department = User.Department ?? "",
                                NameTag = User.NameTag ?? "",
                                Address1 = User.MailingAddress1 ?? "",
                                Address2 = User.MailingAddress2 ?? "",
                                City = User.MailingCity ?? "",
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

                            if (User.MailingCountry != "US")
                            {
                                NewUser.State = "";
                                NewUser.ZipCode = "";
                                NewUser.ProvinceRegion = User.MailingState;
                                NewUser.PostalCode = User.MailingZip ?? "";
                                NewUser.Country = User.MailingCountry;
                            }
                            else
                            {

                                NewUser.ProvinceRegion = "";
                                NewUser.PostalCode = "";
                                NewUser.State = User.MailingState ?? "";
                                NewUser.ZipCode = User.MailingZip ?? "";
                                NewUser.Country = "US";

                            }

                            db.UserProfiles.Add(NewUser);
                            db.SaveChanges();

                            Console.Write(" - Profile Created");

                            if (NewUser.IsBoardCertifiedPhysician == true)
                            {
                                SaveUserBoards(db, User);
                                Console.Write(" - Boards Saved");
                            }

                            Console.WriteLine(" - Complete");
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
                        Console.WriteLine(" - No Membership Account");
                        tw.WriteLineAsync(User.Email + " " + User.UserID + " Error Importing - No Membership Account");
                    }
                }
                else
                {
                    Console.WriteLine(" - Old Switchbox Account");
                    tw.WriteLineAsync(User.Email + " " + User.UserID + " Error Importing - Old Switchbox Account");
                    
                }
                Index++;
            }
            tw.Close();
        }

        private static void ImportUserEmailPreferences(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();
            var UserIDs = (from u in db.UserProfiles
                           where u.Email == "rob@mobilizecloud.com" && u.IsDeleted == false && u.IsDeceased == false
                           select u.UserID);


            TextWriter tw = new StreamWriter("UserEmailPreferencesLog.txt");

            var Total = UserIDs.Count();
            Console.Write("Importing User Email Preferences - Starting ");
            Console.WriteLine(Total + " to Process");
            var Index = 1;
            foreach (var UserID in UserIDs)
            {
                try
                {
                    Console.Write("Processing : " + UserID + " (" + Index + "/" + Total + ") ");
                    var Preferences = (from u in olddb.EmailPreferences
                                       where u.UserID == UserID
                                       select u);
                    foreach (var Preference in Preferences)
                    {
                        var NewEmailPreference = new Models.EmailPreferences()
                        {
                            UserID = UserID,
                            EmailType = GetEmailType(Preference.Type),
                            EmailFrequency = GetEmailFrequency(Preference.FrequencyID),
                            LastUpdated = DateTime.Now
                        };
                        db.EmailPreferences.Add(NewEmailPreference);
                        db.SaveChanges();

                        Console.Write(" - " + NewEmailPreference.EmailType + " saved");
                    }

                    var GeneralPreference = new Models.EmailPreferences()
                    {
                        UserID = UserID,
                        EmailType = "GeneralAnnouncements",
                        EmailFrequency = "Monthly",
                        LastUpdated = DateTime.Now
                    };
                    db.EmailPreferences.Add(GeneralPreference);
                    db.SaveChanges();

                    Console.Write(" - GeneralAnnouncements saved");

                    var RSSeriesPreference = new Models.EmailPreferences()
                    {
                        UserID = UserID,
                        EmailType = "GrandRoundsNewsletters",
                        EmailFrequency = "Monthly",
                        LastUpdated = DateTime.Now
                    };
                    db.EmailPreferences.Add(RSSeriesPreference);
                    db.SaveChanges();

                    Console.Write(" - GrandRoundsNewsletters saved");

                    Console.WriteLine(" - Complete");
                }
                catch (Exception e)
                {
                    Console.WriteLine("");
                    Console.WriteLine(" - " + e.Message);
                    tw.WriteLineAsync(e.Message);
                }
                Index++;
            }
            tw.Close();
        }

        private static void ImportUserRoles(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();
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

        private static void SaveUserBoards(NewOSUCCMEEntities db, Users User)
        {
            var UserBoard = new UserBoardIdentificationNumbers()
            {
                UserProfileID = User.UserID,
                BoardID = 9,
                IdentificationNumber = User.ABIMDiplomatNumber
            };
            db.UserBoardIdentificationNumbers.Add(UserBoard);
            db.SaveChanges();
        }

        private static int GetMappedSpecialtyID(NewOSUCCMEEntities db, Users User)
        {
            if (User.SpecialtyID != null)
            {
                var NewID = (from x in db.SpecialtyMapping
                             where x.OldID == User.SpecialtyID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Speciality ID No Match"));
                }
            }
            else
            {
                throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Speciality ID Blank"));
            }
        }

        private static int GetMappedDegreeID(NewOSUCCMEEntities db, Users User)
        {
            if (User.UserDegreeID != null)
            {
                var NewID = (from x in db.TitleMapping
                             where x.OldID == User.UserDegreeID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Degree ID No Match"));
                }
            }
            else
            {
                throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Degree ID Blank"));
            }
        }

        private static int GetMappedProfessionID(NewOSUCCMEEntities db, Users User)
        {
            if (User.ProfessionID != null)
            {
                var NewID = (from x in db.TitleMapping
                             where x.OldID == User.ProfessionID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Mapped ID No Match"));
                }
            }
            else
            {
                throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Mapped ID Blank"));
            }
        }

        private static int GetMappedTitleID(NewOSUCCMEEntities db, Users User)
        {
            if (User.PrefixID != null)
            {
                var NewID = (from x in db.TitleMapping
                             where x.OldID == User.PrefixID
                             select x.NewID).FirstOrDefault();
                if (NewID != null)
                {
                    return NewID.Value;
                }
                else
                {
                    throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Prefix ID No Match"));
                }
            }
            else
            {
                throw (new Exception(User.Email + " " + User.UserID + " Error Importing - Prefix ID Blank"));
            }
        }

        private static bool CheckIfSwitchbox(Users user)
        {
            if (user.Username.Contains("@switchboxinc"))
            {
                return true;
            }

            return false;
        }
    }
}

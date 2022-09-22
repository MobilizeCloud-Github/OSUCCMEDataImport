using OSUCCMEDataImport.Models;
using OSUCCMEDataImport.OldModels;
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
        }

        private static void ImportUserProfiles(string importUserID)
        {
            var db = new NewOSUCCMEEntities();
            var olddb = new OldOSUCCMEEntities();

            var UsersToImport = (from u in olddb.Users
                                 where u.Username == "rob@mobilizecloud.com"
                                 select u).ToList();

            TextWriter tw = new StreamWriter("UsersToImportLog.txt");
            foreach (var User in UsersToImport)
            {
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
                                PasswordHash = OldUserLogin.Password,
                                SecurityStamp = OldUserLogin.PasswordSalt,
                                PhoneNumberConfirmed = false,
                                TwoFactorEnabled = false,
                                LockoutEnabled = false,
                                AccessFailedCount = 0,
                                UserName = User.Username
                            };
                            db.AspNetUsers.Add(NewUserLogin);
                            db.SaveChanges();

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

                            if(User.MailingCountry != "US")
                            {
                                NewUser.ProvinceRegion = User.MailingState;
                                NewUser.PostalCode = User.MailingZip ?? "";
                                NewUser.Country = User.MailingCountry;
                            }
                            else
                            {

                                NewUser.State = User.MailingState ?? "";
                                NewUser.ZipCode = User.MailingZip ?? "";
                                NewUser.Country = "US";

                            }

                            db.UserProfiles.Add(NewUser);
                            db.SaveChanges();

                            if(NewUser.IsBoardCertifiedPhysician == true)
                            {
                                SaveUserBoards(db, User);
                            }
                        }
                        catch(Exception e)
                        {
                            tw.WriteLine(e.Message);
                        }
                    }
                    else
                    {
                        tw.WriteLine(User.Email + " " + User.UserID + " Error Importing - No Membership Account");
                    }
                }
                else
                {
                    tw.WriteLine(User.Email + " " + User.UserID + " Error Importing - Old Switchbox Account");
                }
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
                if(NewID != null)
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
                return false;
            }

            return true;
        }
    }
}

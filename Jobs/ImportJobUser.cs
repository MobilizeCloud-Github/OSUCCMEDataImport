using OSUCCMEDataImport.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OSUCCMEDataImport.Jobs
{
    class ImportJobUser
    {
        public static void Process()
        {
            var db = new NewOSUCCMEEntities();

            var SystemUserLogin = new AspNetUsers()
            {
                Id = "91e0cfda-95f3-4b6d-a901-4ee15c996848",
                Email = "ccmeadmin@osumc.edu",
                EmailConfirmed = false,
                PasswordHash = "AJ6lLMXBX7wyc8EIi/t1HKpHKOMz/KrI5nhTjS5EJFNOIWUpSHOPkYo6VyGHx1+oCg==",
                SecurityStamp = "415badec-cf0d-4d5d-8c61-331b0d7eae5b",
                PhoneNumberConfirmed = false,
                TwoFactorEnabled = false,
                LockoutEnabled = false,
                AccessFailedCount = 0,
                UserName = "ccmeadmin@osumc.edu"
            };
            db.AspNetUsers.Add(SystemUserLogin);
            db.SaveChanges();

            var SystemUser = new UserProfiles()
            {
                UserID = "91e0cfda-95f3-4b6d-a901-4ee15c996848",
                Email = "ccmeadmin@osumc.edu",
                TitleID = 1,
                FirstName = "CCME",
                MiddleName = "",
                LastName = "System",
                ProfessionID = 29,
                DegreeID = 22,
                TraineeType = "",
                SpecialtyID = 33,
                Phone = "",
                PhoneExtension = "",
                Fax = "",
                SpecialNeeds = "",
                Department = "",
                NameTag = "",
                Address1 = "600 Akerman Road",
                Address2 = "2nd Floor, Room E2055",
                City = "Columbus",
                State = "OH",
                ProvinceRegion = "",
                Country = "US",
                ZipCode = "43202",
                PostalCode = "",
                CreatedBy = "91e0cfda-95f3-4b6d-a901-4ee15c996848",
                CreatedOn = DateTime.Now,
                IsDeceased = false,
                IsDeleted = false,
                OSUID = "",
                NationalProviderIdentifier = "",
                AnnualFacultyDisclosureOverrideEnabled = false,
                AnnualFacultyDisclosureAccess = false
            };

            db.UserProfiles.Add(SystemUser);
            db.SaveChanges();

            var ImportUserLogin = new AspNetUsers()
            {
                Id = "b942c30a-575c-4263-8028-28fad69beacf",
                Email = "ccmeimport@osumc.edu",
                EmailConfirmed = false,
                PasswordHash = "AJ6lLMXBX7wyc8EIi/t1HKpHKOMz/KrI5nhTjS5EJFNOIWUpSHOPkYo6VyGHx1+oCg==",
                SecurityStamp = "415badec-cf0d-4d5d-8c61-331b0d7eae5b",
                PhoneNumberConfirmed = false,
                TwoFactorEnabled = false,
                LockoutEnabled = false,
                AccessFailedCount = 0,
                UserName = "ccmeimport@osumc.edu"
            };
            db.AspNetUsers.Add(ImportUserLogin);
            db.SaveChanges();

            var ImportUser = new UserProfiles()
            {
                UserID = "b942c30a-575c-4263-8028-28fad69beacf",
                Email = "ccmeimport@osumc.edu",
                TitleID = 1,
                FirstName = "CCME",
                MiddleName = "",
                LastName = "Import",
                ProfessionID = 29,
                DegreeID = 22,
                TraineeType = "",
                SpecialtyID = 33,
                Phone = "",
                PhoneExtension = "",
                Fax = "",
                SpecialNeeds = "",
                Department = "",
                NameTag = "",
                Address1 = "600 Akerman Road",
                Address2 = "2nd Floor, Room E2055",
                City = "Columbus",
                State = "OH",
                ProvinceRegion = "",
                Country = "US",
                ZipCode = "43202",
                PostalCode = "",
                CreatedBy = "b942c30a-575c-4263-8028-28fad69beacf",
                CreatedOn = DateTime.Now,
                IsDeceased = false,
                IsDeleted = false,
                OSUID = "",
                NationalProviderIdentifier = "",
                AnnualFacultyDisclosureOverrideEnabled = false,
                AnnualFacultyDisclosureAccess = false
            };

            db.UserProfiles.Add(ImportUser);
            db.SaveChanges();
        }
    }
}

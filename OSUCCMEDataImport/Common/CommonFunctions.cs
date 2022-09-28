using OSUCCMEDataImport.Models;
using System.Linq;
using System.Text;

namespace OSUCCMEDataImport.Common
{
    class CommonFunctions
    {
        public static string URLFriendly(string title)
        {
            if (title == null) return "";

            const int maxlen = 100;
            int len = title.Length;
            bool prevdash = false;
            var sb = new StringBuilder(len);
            char c;

            for (int i = 0; i < len; i++)
            {
                c = title[i];
                if ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9'))
                {
                    sb.Append(c);
                    prevdash = false;
                }
                else if (c >= 'A' && c <= 'Z')
                {
                    // tricky way to convert to lowercase
                    sb.Append((char)(c | 32));
                    prevdash = false;
                }
                else if (c == ' ' || c == ',' || c == '.' || c == '/' ||
                    c == '\\' || c == '-' || c == '_' || c == '=')
                {
                    if (!prevdash && sb.Length > 0)
                    {
                        sb.Append('-');
                        prevdash = true;
                    }
                }
                else if ((int)c >= 128)
                {
                    int prevlen = sb.Length;
                    sb.Append(RemapInternationalCharToAscii(c));
                    if (prevlen != sb.Length) prevdash = false;
                }
                if (i == maxlen) break;
            }

            if (prevdash)
                return sb.ToString().Substring(0, sb.Length - 1);
            else
                return sb.ToString();
        }

        public static string RemapInternationalCharToAscii(char c)
        {
            string s = c.ToString().ToLowerInvariant();
            if ("àåáâäãåą".Contains(s))
            {
                return "a";
            }
            else if ("èéêëę".Contains(s))
            {
                return "e";
            }
            else if ("ìíîïı".Contains(s))
            {
                return "i";
            }
            else if ("òóôõöøőð".Contains(s))
            {
                return "o";
            }
            else if ("ùúûüŭů".Contains(s))
            {
                return "u";
            }
            else if ("çćčĉ".Contains(s))
            {
                return "c";
            }
            else if ("żźž".Contains(s))
            {
                return "z";
            }
            else if ("śşšŝ".Contains(s))
            {
                return "s";
            }
            else if ("ñń".Contains(s))
            {
                return "n";
            }
            else if ("ýÿ".Contains(s))
            {
                return "y";
            }
            else if ("ğĝ".Contains(s))
            {
                return "g";
            }
            else if (c == 'ř')
            {
                return "r";
            }
            else if (c == 'ł')
            {
                return "l";
            }
            else if (c == 'đ')
            {
                return "d";
            }
            else if (c == 'ß')
            {
                return "ss";
            }
            else if (c == 'Þ')
            {
                return "th";
            }
            else if (c == 'ĥ')
            {
                return "h";
            }
            else if (c == 'ĵ')
            {
                return "j";
            }
            else
            {
                return "";
            }
        }

        public static bool DoesUserExist(string UserIDToCheck)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;

            var User = (from u in db.UserProfiles
                        where u.UserID == UserIDToCheck && u.IsDeleted == false
                        select u.UserID).FirstOrDefault();

            if (!string.IsNullOrWhiteSpace(User))
            {
                return true;
            }

            return false;
        }

        public static string GetUserFullName(string UserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;

            var UserFullName = (from u in db.UserProfiles
                                where u.UserID == UserID && u.IsDeleted == false
                                select u.FullName).FirstOrDefault();

            return UserFullName;
        }

        public static string GetTrimedString(string Content, int Length)
        {
            if (string.IsNullOrWhiteSpace(Content))
            {
                return "";
            }
            else if (Content.Length <= Length)
            {
                return Content.Trim();
            }
            else
            {
                return Content.Trim().Substring(0, Length).Trim();
            }
        }

        public static void SaveCommercialInterest(int FacultyDisclosureID, string CompanyName, string Relationship)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;

            var CommercialInterest = new FacultyDisclosureCommercialInterests()
            {
                FacultyDisclosureID = FacultyDisclosureID,
                CompanyName = CompanyName,
                Relationship = Relationship,
                RelationshipEnded = false
            };
            db.FacultyDisclosureCommercialInterests.Add(CommercialInterest);
            db.SaveChanges();
        }
    }
}

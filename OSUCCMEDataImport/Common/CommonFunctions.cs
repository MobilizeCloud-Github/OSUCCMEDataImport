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

        public static bool DoesUserExist(NewOSUCCMEEntities db, string UserID)
        {
            return (from u in db.UserProfiles
                    where u.UserID == UserID && u.IsDeleted == false
                    select u.UserID).Any();
        }

        public static bool DoesEventExist(NewOSUCCMEEntities db, int EventID, string EventType)
        {
            switch (EventType.ToLower())
            {
                case ("conference"):
                case ("conferences"):
                    {
                        return (from u in db.Conferences
                                where u.ID == EventID && u.IsDeleted == false
                                select u.ID).Any();

                    }

                case ("webcast"):
                case ("webcast-vod"):
                case ("webcast-live"):
                case ("webcasts"):
                    {
                        return (from u in db.Webcasts
                                where u.ID == EventID && u.IsDeleted == false
                                select u.ID).Any();

                    }
                case ("rsseries"):
                    {
                        return (from u in db.RSSeries
                                where u.ID == EventID && u.IsDeleted == false
                                select u.ID).Any();

                    }
                case ("enduring"):
                case ("enduringmaterial"):
                case ("enduring-material"):
                case ("enduringmaterials"):
                case ("enduring material"):
                    {
                        return (from u in db.EnduringMaterials
                                where u.ID == EventID && u.IsDeleted == false
                                select u.ID).Any();

                    }
                default:
                    {
                        return false;
                    }
            }

        }

        public static bool DoesSpeakerExist(NewOSUCCMEEntities db, int EventID, string EventType, string UserID)
        {
            switch (EventType.ToLower())
            {
                case ("conference"):
                    {
                        return (from u in db.ConferenceSpeakers
                                where u.ID == EventID && u.UserID == UserID && u.IsDeleted == false
                                select u.ID).Any();

                    }

                case ("webcast"):
                    {
                        return (from u in db.WebcastSpeakers
                                where u.ID == EventID && u.IsDeleted == false && u.UserID == UserID
                                select u.ID).Any();

                    }

                case ("enduring"):
                    {
                        return (from u in db.EnduringMaterialSpeakers
                                where u.ID == EventID && u.IsDeleted == false && u.UserID == UserID
                                select u.ID).Any();

                    }
                case ("rsseries"):
                    {
                        return (from u in db.RSSeriesSpeakers
                                where u.ID == EventID && u.IsDeleted == false && u.UserID == UserID
                                select u.ID).Any();

                    }
                default:
                    {
                        return false;
                    }
            }

        }

        public static bool DoesTestExist(NewOSUCCMEEntities db, int TestID)
        {
            return (from u in db.Testing
                    where u.ID == TestID && u.IsDeleted == false
                    select u.ID).Any();
        }

        public static string GetUserFullName(string UserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;

            return (from u in db.UserProfiles
                    where u.UserID == UserID && u.IsDeleted == false
                    select u.FullName).FirstOrDefault();
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

        public static void SaveCommercialInterest(NewOSUCCMEEntities db, int FacultyDisclosureID, string CompanyName, string Relationship)
        {
            var CommercialInterest = new FacultyDisclosureCommercialInterests()
            {
                FacultyDisclosureID = FacultyDisclosureID,
                CompanyName = CommonFunctions.GetTrimedString(CompanyName, 256),
                Relationship = Relationship,
                RelationshipEnded = false
            };
            db.FacultyDisclosureCommercialInterests.Add(CommercialInterest);
        }
    }
}

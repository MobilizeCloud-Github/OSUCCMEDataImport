using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OSUCCMEDataImport.Common
{
    class FileFunctions
    {
        public static string GetFileNameFromPath(string FullUrl)
        {
            Uri uri = new Uri(FullUrl);
            if (uri.IsFile)
            {
                return System.IO.Path.GetFileName(uri.LocalPath);
            }
            else
            {
                return "";
            }
        }

        internal static string GetNewFileLocationFromPath(string FullUrl)
        {
            FullUrl = FullUrl.Replace("https://ccme.osu.edu/", "/storage/");
            FullUrl = FullUrl.Replace("http://ccme.osu.edu/", "/storage/");
            return FullUrl;
        }
    }
}

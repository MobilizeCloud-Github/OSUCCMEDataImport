using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class ConferenceOptionsImportJobs
    {
        public static void Process(string ImportUserID)
        {
            //ConferenceOptions(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            ConferencePromoCodes(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");

        }

        private static void ConferenceOptions(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var OptionsToImport = (from uc in olddb.ConferenceShoppingCarts
                                       where uc.IsDeleted == false && uc.CartDate > TransferStartDate
                                       group uc by uc.UserID into ucg
                                       select new
                                       {
                                           UserID = ucg.Key,
                                           Options = ucg
                                       }).ToList();

                var Total = OptionsToImport.Count();
                Console.Write("Importing Conference Options - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in OptionsToImport)
                {
                    Console.Write("Processing Conference Options : (" + Index + "/" + Total + ") " + u.UserID);

                    if (CommonFunctions.DoesUserExist(db, u.UserID))
                    {
                        var TotalCredits = u.Options.Count();
                        var CreditsIndex = 1;

                        foreach (var uc in u.Options)
                        {
                            Console.Write("Conference Option : (" + Index + "/" + Total + ") (" + CreditsIndex + "/" + TotalCredits + ") " + uc.ID + " ");

                            var ContainsDash = false;
                            var GroupName = "";
                            var OptionName = uc.Item;

                            decimal ItemPrice = 0.0m;
                            decimal.TryParse(uc.Amount.Replace("$", ""), out ItemPrice);

                            var RegistrationID = (from c in db.ConferenceRegistrations
                                                  where c.ConferenceID == uc.EventID && c.UserID == uc.UserID
                                                  select (int?)c.ID).FirstOrDefault();
                            if (RegistrationID != null)
                            {
                                var ConferencePriceID = (from p in db.ConferencePrices
                                                         where p.ConferenceID == uc.EventID && p.Tier == uc.Item
                                                         select p).FirstOrDefault();
                                if (ConferencePriceID != null)
                                {
                                    var ConferencePriceIDs = (from p in db.ConferencePrices
                                                              where p.ConferenceID == uc.EventID && p.Tier == uc.Item
                                                              select p);
                                    if (ConferencePriceIDs != null)
                                    {
                                        if (ConferencePriceIDs.Count() > 1)
                                        {
                                            if (ConferencePriceIDs.Where(x => x.Price == ItemPrice).Any())
                                            {
                                                ConferencePriceIDs = ConferencePriceIDs.Where(x => x.Price == ItemPrice);
                                            }
                                        }

                                        var NewRegistrationItem = new ConferenceRegistrationItems()
                                        {
                                            ConferenceRegistrationID = RegistrationID.Value,
                                            Type = "Price",
                                            PriceID = ConferencePriceIDs.FirstOrDefault().ID,
                                            Name = ConferencePriceIDs.FirstOrDefault().Tier,
                                            Price = ItemPrice
                                        };
                                        db.ConferenceRegistrationItems.Add(NewRegistrationItem);
                                        db.SaveChanges();

                                        Console.WriteLine(" - Saved");
                                    }
                                }
                                else if (uc.Item.Contains("-"))
                                {
                                    ContainsDash = true;
                                    var DashIndex = uc.Item.IndexOf('-');
                                    GroupName = uc.Item.Substring(0, DashIndex).Trim();
                                    OptionName = uc.Item.Substring(DashIndex + 1).Trim();

                                    if (GroupName != "Promo Code")
                                    {
                                        var ConferenceOptions = (from o in db.ConferenceOptions
                                                                 where o.Name == OptionName && o.ConferenceOptionsGroups.ConferenceID == uc.EventID && o.ConferenceOptionsGroups.Name == GroupName
                                                                 select o);

                                        if (ConferenceOptions.Count() > 1)
                                        {
                                            if (ConferenceOptions.Where(x => x.Price == ItemPrice).Any())
                                            {
                                                ConferenceOptions = ConferenceOptions.Where(x => x.Price == ItemPrice);
                                            }
                                        }
                                        if (ConferenceOptions != null && ConferenceOptions.Any() && RegistrationID > 0)
                                        {

                                            var NewRegistrationItem = new ConferenceRegistrationItems()
                                            {
                                                ConferenceRegistrationID = RegistrationID.Value,
                                                Type = "Option",
                                                OptionID = ConferenceOptions.FirstOrDefault().ID,
                                                Name = ConferenceOptions.FirstOrDefault().Name,
                                                Price = ItemPrice
                                            };
                                            db.ConferenceRegistrationItems.Add(NewRegistrationItem);
                                            db.SaveChanges();

                                            Console.WriteLine(" - Saved");
                                        }
                                        else
                                        {
                                            Console.WriteLine(" - Skipped");
                                        }
                                    }
                                }

                            }
                            else
                            {
                                Console.WriteLine(" - Skipped");
                            }
                            CreditsIndex++;
                        }
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped User doesn't exist");
                    }

                    Index++;
                    Console.WriteLine(" - Complete");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }

        private static void ConferencePromoCodes(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var PromoCodesToImport = (from uc in olddb.ConferencePromoCodes
                                          where uc.IsDeleted == false && uc.CreatedOn > TransferStartDate
                                          select uc).ToList();

                var Total = PromoCodesToImport.Count();
                Console.Write("Importing Promo Codes - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var u in PromoCodesToImport)
                {
                    Console.Write("Processing Promo Codes : (" + Index + "/" + Total + ") " + u.ID);

                    if (!CommonFunctions.DoesUserExist(db, u.CreatedBy))
                    {
                        u.CreatedBy = ImportUserID;
                    }

                    var NewPromoCode = new EventPromoCode()
                    {
                        EventID = u.ConferenceID,
                        EventType = "Conference",
                        Code = u.Code,
                        Type = u.Type,
                        Amount = u.Amount,
                        StartDate = u.StartDate,
                        EndDate = u.EndDate,
                        IsDegreesRestricted = u.IsDegreesRestricted,
                        IsEmailRestricted = u.IsEmailRestricted,
                        IsProfessionsRestricted = u.IsProfessionsRestricted,
                        IsDeleted = false,
                        CreatedBy = u.CreatedBy,
                        CreatedOn = u.CreatedOn,
                        LastUpdatedBy = ImportUserID,
                        LastUpdatedOn = DateTime.Now
                    };
                    db.EventPromoCode.Add(NewPromoCode);
                    db.SaveChanges();
                    Console.WriteLine(" - Saved");

                }
                Index++;
                Console.WriteLine(" - Complete");
            }
            catch (Exception e)
            {
                Console.WriteLine("");
                Console.WriteLine(" - " + e.Message);
            }
        }
    }
}

using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class TestingJobs
    {
        public static void Process(string ImportUserID)
        {

            Test(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
            TestQuestionsAndAnswers(ImportUserID);
            //Console.WriteLine("");
            //Console.WriteLine("-----------------------------------");
            //Console.WriteLine("");
        }

        private static void Test(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var TestToImport = (from c in olddb.Testing
                                    where c.IsDeleted == false && c.DateCreated > TransferStartDate
                                    select c).ToList();

                var Total = TestToImport.Count();
                Console.Write("Importing Test - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;



                foreach (var c in TestToImport)
                {
                    Console.Write("Processing Test: (" + Index + "/" + Total + ") " + c.ID);

                    var EventExist = CommonFunctions.DoesEventExist(db, c.AssociatedEventID.Value, c.AssociatedEventType);

                    if (EventExist)
                    {
                        var test = new Models.Testing()
                        {
                            ID = c.ID,
                            EventID = c.AssociatedEventID ?? 0,
                            EventType = c.AssociatedEventType,
                            TestType = c.TestType,
                            PassingGrade = int.Parse(c.PassingGrade.ToString()),
                            CreatedOn = c.DateCreated.Value,
                            CreatedBy = ImportUserID,
                            LastUpdatedOn = c.LastUpdate.Value,
                            LastUpdatedBy = ImportUserID,
                            NumberOfAttempts = 1,
                            Random = false,
                            Layout = "Vertical",
                            IsDeleted = false

                        };
                        db.Testing.Add(test);
                        db.SaveChanges();
                    }

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

        private static void TestQuestionsAndAnswers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var QuestionsToImport = (from c in olddb.Questions
                                         where c.IsDeleted == false
                                         select c).ToList();

                var Total = QuestionsToImport.Count();
                Console.Write("Importing Test Questions - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in QuestionsToImport)
                {
                    if (c.TestID != null)
                    {
                        var TestExist = CommonFunctions.DoesTestExist(db, c.TestID.Value);

                        if (TestExist)
                        {

                            Console.Write("Processing Test Questions: (" + Index + "/" + Total + ") " + c.ID);
                            var questions = new Models.TestingQuestions()
                            {
                                TestID = c.TestID.Value,
                                Rank = c.Position.Value + 1,
                                QuestionText = c.QuestionText,
                                Explanation = c.AnswerExplanation,
                                CreatedOn = DateTime.Now,
                                CreatedBy = ImportUserID,
                                IsDeleted = false
                            };
                            db.TestingQuestions.Add(questions);
                            db.SaveChanges();
                            Console.Write("Saving Question");

                            switch (c.AnswerType)
                            {
                                case (1):
                                    {
                                        //Radio
                                        questions.QuestionTypeID = 3;
                                        break;
                                    }
                                case (2):
                                    {
                                        //Checkbox
                                        questions.QuestionTypeID = 2;
                                        break;
                                    }
                                case (3):
                                    {
                                        //Text
                                        questions.QuestionTypeID = 4;
                                        break;
                                    }
                                case (4):
                                    {
                                        questions.QuestionTypeID = 4;
                                        break;
                                    }
                                case (5):
                                    {
                                        //Dropdown
                                        questions.QuestionTypeID = 1;
                                        break;
                                    }
                            }

                            var AnswersToImport = (from a in olddb.Answers
                                                   where a.qID == c.ID && a.IsDeleted == false
                                                   select a).ToList();

                            var AnswerPosition = 1;

                            foreach (var a in AnswersToImport)
                            {
                                var Answer = new Models.TestingQuestionsAnswers()
                                {
                                    QuestionID = questions.ID,
                                    Position = AnswerPosition,
                                    AnswerText = a.Answer,
                                    CorrectAnswer = false,
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    IsDeleted = false
                                };

                                if (Answer.AnswerText == c.CorrectAnswer)
                                {
                                    Answer.CorrectAnswer = true;
                                }

                                db.TestingQuestionsAnswers.Add(Answer);

                                AnswerPosition++;
                            }
                            db.SaveChanges();
                        }
                    }
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

        private static void TestAnswers(string ImportUserID)
        {
            var db = new NewOSUCCMEEntities();
            db.Configuration.AutoDetectChangesEnabled = false;
            var olddb = new OldOSUCCMEEntities();
            olddb.Configuration.AutoDetectChangesEnabled = false;

            try
            {
                var TransferStartDate = new DateTime(2012, 1, 1);
                var QuestionsToImport = (from c in olddb.Questions
                                         where c.IsDeleted == false
                                         select c).ToList();

                var Total = QuestionsToImport.Count();
                Console.Write("Importing Test Questions - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in QuestionsToImport)
                {
                    Console.Write("Processing Test Questions: (" + Index + "/" + Total + ") " + c.ID);
                    var questions = new Models.TestingQuestions()
                    {
                        ID = c.ID,
                        TestID = c.TestID.Value,
                        Rank = c.Position.Value + 1,
                        QuestionText = c.QuestionText,
                        Explanation = c.AnswerExplanation,
                        CreatedOn = DateTime.Now,
                        CreatedBy = ImportUserID,
                        IsDeleted = false
                    };
                    db.TestingQuestions.Add(questions);

                    switch (c.AnswerType)
                    {
                        case (1):
                            {
                                //Radio
                                questions.QuestionTypeID = 3;
                                break;
                            }
                        case (2):
                            {
                                //Checkbox
                                questions.QuestionTypeID = 2;
                                break;
                            }
                        case (3):
                            {
                                //Text
                                questions.QuestionTypeID = 4;
                                break;
                            }
                        case (4):
                            {
                                questions.QuestionTypeID = 4;
                                break;
                            }
                        case (5):
                            {
                                //Dropdown
                                questions.QuestionTypeID = 1;
                                break;
                            }
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

    }
}

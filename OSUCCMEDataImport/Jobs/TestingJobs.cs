using OldOSUDatabase.Models;
using OSUCCMEDataImport.Common;
using OSUCCMEDataImport.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace OSUCCMEDataImport.Jobs
{
    class TestingJobs
    {
        public static void Process(string ImportUserID)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();


            Test(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");
            TestQuestionsAndAnswers(ImportUserID);
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("");

            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
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
                        Console.WriteLine(" - Saved");
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
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
                var TestsToImport = (from c in olddb.Questions
                                     where c.IsDeleted == false
                                     group c by c.TestID into cg
                                     select new
                                     {
                                         cg.Key,
                                         Questions = cg
                                     }).ToList();

                var Total = TestsToImport.Count();
                Console.Write("Importing Test Questions - Starting ");
                Console.WriteLine(Total + " to Process");
                var Index = 1;

                foreach (var c in TestsToImport)
                {
                    Console.Write("Processing Test Questions: (" + Index + "/" + Total + ") " + c.Key);
                    if (c.Key != null)
                    {
                        var TestExist = CommonFunctions.DoesTestExist(db, c.Key.Value);

                        if (TestExist)
                        {
                            var QuestionCount = c.Questions.Count();
                            var QuestionIndex = 1;
                            foreach (var Question in c.Questions)
                            {

                                Console.Write("Processing Test Questions: (" + Index + "/" + Total + ") (" + QuestionIndex + "/" + QuestionCount + ") " + Question.ID);
                                var NewQuestion = new Models.TestingQuestions()
                                {
                                    TestID = Question.TestID.Value,
                                    Rank = Question.Position.Value + 1,
                                    QuestionText = Question.QuestionText,
                                    Explanation = Question.AnswerExplanation,
                                    CreatedOn = DateTime.Now,
                                    CreatedBy = ImportUserID,
                                    IsDeleted = false
                                };
                                db.TestingQuestions.Add(NewQuestion);


                                switch (Question.AnswerType)
                                {
                                    case (1):
                                        {
                                            //Radio
                                            NewQuestion.QuestionTypeID = 3;
                                            break;
                                        }
                                    case (2):
                                        {
                                            //Checkbox
                                            NewQuestion.QuestionTypeID = 2;
                                            break;
                                        }
                                    case (3):
                                        {
                                            //Text
                                            NewQuestion.QuestionTypeID = 4;
                                            break;
                                        }
                                    case (4):
                                        {
                                            NewQuestion.QuestionTypeID = 4;
                                            break;
                                        }
                                    case (5):
                                        {
                                            //Dropdown
                                            NewQuestion.QuestionTypeID = 1;
                                            break;
                                        }
                                }

                                Console.WriteLine(" - Saving Question");
                                db.SaveChanges();

                                if (!string.IsNullOrWhiteSpace(Question.AssociatedFileName))
                                {
                                    var NewFile = new TestingQuestionsFiles()
                                    {
                                        QuestionID = NewQuestion.ID,
                                        FileName = Question.AssociatedFileURL.Substring(Question.AssociatedFileURL.LastIndexOf('/') + 1),
                                        Location = Question.AssociatedFileURL,
                                        CreatedOn = DateTime.Now,
                                        CreatedBy = ImportUserID,
                                        IsDeleted = false
                                    };
                                    db.TestingQuestionsFiles.Add(NewFile);
                                    db.SaveChanges();
                                }

                                var AnswersToImport = (from a in olddb.Answers
                                                       where a.qID == Question.ID && a.IsDeleted == false
                                                       select a).ToList();

                                var AnswerPosition = 1;
                                var TotalAnswers = AnswersToImport.Count();
                                var TestAnswers = new List<Models.TestingQuestionsAnswers>();
                                foreach (var a in AnswersToImport)
                                {
                                    Console.Write("Processing Test Question Answers: (" + Index + "/" + Total + ") (" + QuestionIndex + "/" + QuestionCount + ") (" + AnswerPosition + "/" + TotalAnswers + ")" + a.ID);

                                    var Answer = new Models.TestingQuestionsAnswers()
                                    {
                                        QuestionID = NewQuestion.ID,
                                        Position = AnswerPosition,
                                        AnswerText = a.Answer,
                                        CorrectAnswer = false,
                                        CreatedOn = DateTime.Now,
                                        CreatedBy = ImportUserID,
                                        IsDeleted = false
                                    };

                                    if (Answer.AnswerText == Question.CorrectAnswer)
                                    {
                                        Answer.CorrectAnswer = true;
                                    }

                                    Console.WriteLine(" - Answer Saved");

                                    TestAnswers.Add(Answer);
                                    AnswerPosition++;
                                }
                                db.TestingQuestionsAnswers.AddRange(TestAnswers);
                                db.SaveChanges();
                                QuestionIndex++;
                            }
                        }
                        else
                        {
                            Console.WriteLine(" - Skipped");
                        }
                    }
                    else
                    {
                        Console.WriteLine(" - Skipped");
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

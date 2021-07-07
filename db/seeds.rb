Category.destroy_all

category1 = Category.create!(title: "Frontend")
category2 = Category.create!(title: "Backend")

p "Created #{Category.count} categories"




Test.destroy_all

# byebug

categories = [category1, category2]

test1 = Test.create!(title: "Ruby", level: 1, category_id: categories[1].id)

test2 =	Test.create!(title: "Rails", level: 1, category_id: categories[1].id)

test3 = Test.create!(title: "HTML", level: 1, category_id: categories[0].id)

p "Created #{Test.count} tests"




Question.destroy_all

tests = [test1, test2, test3]

question1 = Question.create!(body: "What is HTML", test_id: tests[2].id)

question2 = Question.create!(body: "Data types in Ruby", test_id: tests[0].id)

question3 = Question.create!(body: "Rails ideas and principles", test_id: tests[1].id)

p "Created #{Question.count} questions"



Answer.destroy_all

questions = [question1, question2, question3]

answer1 = Answer.create!(body: "Document markup language 
	                      for web browsing in a browser",
  question_id: questions[0].id)        

answer2 = Answer.create!(body: "Numbers.Boolean.Strings.Hashes.
                         Arrays.Symbols.",
  question_id: questions[1].id)        

answer1 = Answer.create!(body: "Optimization for the happiness of programmers
                         Agreement is more important than configuration
                         Omakase menu
                         There is no single paradigm
                         Excellent beautiful code
                         Provide sharp knives
                         Value integrated systems
                         Progress is more important than stability
                         Raise a big tent",
  question_id: questions[2].id)                	       	

p "Created #{Answer.count} answers"



User.destroy_all

user1 = User.create!(name: "Sasha")

user2 = User.create!(name: "Valera")

p "Created #{User.count} users"



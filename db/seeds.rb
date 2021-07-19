Category.destroy_all


categories = Category.create([{
  title: "Frontend"
},
  {title: "Backend"
}])

p "Created #{Category.count} categories"


# byebug

Test.destroy_all

tests = Test.create([{
  title: "Ruby", level: 1, category_id: categories[1].id
},
  {title: "Rails", level: 1, category_id: categories[1].id
},
  {title: "HTML", level: 1, category_id: categories[0].id
}])     

p "Created #{Test.count} tests"




Question.destroy_all

questions = Question.create([{
  body: "What is HTML", test_id: tests[2].id
},
  {body: "Data types in Ruby", test_id: tests[0].id 
},
  {body: "Rails ideas and principles", test_id: tests[1].id    
}])

p "Created #{Question.count} questions"



Answer.destroy_all

answers = Answer.create([{
  body: "Document markup language 
	                      for web browsing in a browser",
  question_id: questions[0].id
},
  {body: "Numbers.Boolean.Strings.Hashes.
                         Arrays.Symbols.",
  question_id: questions[1].id
},
  {body: "Optimization for the happiness of programmers
                         Agreement is more important than configuration
                         Omakase menu
                         There is no single paradigm
                         Excellent beautiful code
                         Provide sharp knives
                         Value integrated systems
                         Progress is more important than stability
                         Raise a big tent",
  question_id: questions[2].id
}])          

p "Created #{Answer.count} answers"



User.destroy_all

# byebug

users = User.create!([{
  name: "Sasha"
},
  {name: "Valera" 
}])    
# user = User.create(name: "Sasha")


p "Created #{User.count} users"

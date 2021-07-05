Category.destroy_all

Category.create!([{
	title: "Frontend"
},
  {title: "Backend"
}])

p "Created #{Category.count} categories"


Test.destroy_all

Test.create!([{
	title: "Ruby", level: 1, category_id: 2
},
	{title: "Rails", level: 1, category_id: 2 
},
	{title: "HTML", level: 1, category_id: 1 
}])

p "Created #{Test.count} tests"


Question.destroy_all

Question.create!([{
	body: "What is HTML", test_id: 1
},
  {body: "Data types in Ruby", test_id: 2
},
  {body: "Rails ideas and principles", test_id: 3
}])

p "Created #{Question.count} questions"


Answer.destroy_all

Answer.create!([{
	body: "Document markup language 
	       for web browsing in a browser",
  question_id: 1        
},
  {body: "Numbers.Boolean.Strings.Hashes.
          Arrays.Symbols.",
  question_id: 2        
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
   question_id: 3                	       	
}])
 
p "Created #{Answer.count} answers"


User.destroy_all

User.create!([{
	name: "Sasha"
},
  {name: "Valera"	
}])

p "Created #{User.count} users"



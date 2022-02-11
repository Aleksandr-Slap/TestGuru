# frozen_string_literal: true

Category.destroy_all

categories = Category.create([
                               { title: 'Frontend'},
                               { title: 'Backend' }
                             ])

p "Created #{Category.count} categories"

User.destroy_all

users = User.create!([
                       { name: 'Sasha', password: 123456, password_confirmation: 123456, email: 'aleksandrslap@gmail.com' }
                     ])

p "Created #{User.count} users"

Test.destroy_all

tests = Test.create([
                      { title: 'Ruby', level: 1, category_id: categories[1].id, user_id: users[0].id },
                      { title: 'Rails', level: 2, category_id: categories[1].id, user_id: users[0].id },
                      { title: 'HTML', level: 3, category_id: categories[0].id, user_id: users[0].id }
                    ])

p "Created #{Test.count} tests"

Question.destroy_all

questions = Question.create([
                              { body: 'What is HTML?', test_id: tests[2].id },
                              { body: 'Who created Ruby?', test_id: tests[0].id },
                              { body: 'What language is Ruby on Rails written in?', test_id: tests[1].id }
                            ])

p "Created #{Question.count} questions"

Answer.destroy_all

answers = Answer.create([
                          { body: "Document markup language for web browsing in a browser",question_id: questions[0].id, correct: true},
                          { body: "Database management system", question_id: questions[0].id }, 
                           
                          { body: "Matz", question_id: questions[1].id, correct: true },
                          { body: "Bill Clinton", question_id: questions[1].id },
                          { body: "Tovarich Stalin", question_id: questions[1].id },
                          { body: "Mark Zuckerberg", question_id: questions[1].id },
                          
                          { body: "C++", question_id: questions[2].id}
                          { body: "React", question_id: questions[2].id },
                          { body: "Ruby", question_id: questions[2].id, correct: true },
                        ])
                           

p "Created #{Answer.count} answers"

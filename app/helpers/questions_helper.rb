module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else 
      "Edit #{question.test.title} Question" 
    end  
  end 

  def this_year
    Time.now.year
  end
  
  def github_url
    "https://github.com/Aleksandr-Slap/TestGuru"
  end   
end

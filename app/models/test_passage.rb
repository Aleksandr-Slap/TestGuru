class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :set_first_question, on: :create
  before_validation :assign_next_question, on: :update

  TEST_PASS_PERCENTAGE = 85.freeze

  def passed_the_test?
    success_rate >= TEST_PASS_PERCENTAGE    
  end

  def success_rate
    correct_questions / self.test.questions.count * 100
  end 

  def сurrent_question_number   
    test.questions.index(current_question) + 1
  end  
  
  
  def completed?
    current_question.nil?
  end  

  def accept!(answer_ids) 
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!  
  end  

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end 

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers 
    current_question.answers.correct
  end 

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end 

  def assign_next_question
    self.current_question = next_question
  end  

end  



# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true, dependent: :destroy     

  before_validation :set_first_question, on: :create
  before_validation :assign_next_question, on: :update 

  scope :successful, -> { where(passed: true) }

  TEST_PASS_PERCENTAGE = 85

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

  def successful_completion?
    if self.passed_the_test?
      self.update_attribute(:passed, true)
    end  
  end

  def accept!(answer_ids)
    if self.current_question.answers.size != 0
      self.correct_questions += 1 if correct_answer?(answer_ids)
    end
    save!  
  end

  def question_max
    self.test.questions.size
  end 

  def current_question_number
    self.test.questions.find_index(self.current_question)
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids != nil
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

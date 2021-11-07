# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :limit_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def limit_answers
    errors.add(:question_id, 'One question cannot have more than 4 answers') if question.answers.size >= 4
  end
end

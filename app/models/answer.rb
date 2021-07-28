class Answer < ApplicationRecord
	belongs_to :question

	scope :answers_true, -> { where(correct: true) }

	validates :body, presence: true

	validate :limit_answers
	

	private

	def limit_answers
		question_id = self.question.id
    if Answer.where(question_id: question_id).size >= 4
    	errors.add(:question_id, "One question cannot have more than 4 answers")
    end	
	end	
end

class Category < ApplicationRecord
	has_many :tests

	validates :title, presence: true
	
	scope :all_categories, -> { all.order('title') }

end

class Category < ApplicationRecord
	has_many :tests

	scope :all_categories, -> { all.order('title') }

	validates :title, presence: true
end

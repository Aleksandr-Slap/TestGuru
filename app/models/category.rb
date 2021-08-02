class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true
  
  scope :all_categories, -> { order('title') }

end

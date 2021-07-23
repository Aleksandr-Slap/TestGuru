class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :author, class_name: "User", foreign_key: :user_id
  
  def self.sorting_categories(name_category)
    self.joins(:category).where(categories: {title: name_category}).order('tests.title DESC').pluck('tests.title')
  end	
end

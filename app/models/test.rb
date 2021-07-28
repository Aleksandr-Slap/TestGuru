class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :author, class_name: "User", foreign_key: :user_id

  scope :tests_easy, -> { where(level: 0..1) }
  scope :tests_middle, -> { where(level: 2..4) }
  scope :tests_hard, -> { where(level: 5..) }
  scope :sorting_categories, -> (name_category) {self.joins(:category).where(categories: {title: name_category}).order('tests.title DESC').pluck('tests.title')}

  validates :title, presence: true, 
                    uniqueness: true

  validates :level, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: true
end

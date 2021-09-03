class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :title, :level, presence: true 
  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level }

  scope :tests_easy, -> { where(level: 0..1) }
  scope :tests_middle, -> { where(level: 2..4) }
  scope :tests_hard, -> { where(level: 5..) }
  scope :show_tests, -> (name_category) { joins(:category).where(categories: {title: name_category}) }
  
  def self.show_category_tests(name_category)
    show_tests(name_category).order('tests.title DESC').pluck('tests.title')
  end
end
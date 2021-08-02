class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: "Test"
  
  validates :name, :email, presence: true

  def result(level)
    tests.where(level: level)
  end
end

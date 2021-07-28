class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: "Test"


  def result(level)
	  tests.where(level: level)
	end

  validates :email, presence: true
  validates :name, presence: true
end

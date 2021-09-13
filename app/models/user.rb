require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: "Test", foreign_key: :user_id

  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
                           message: "@ and '.' should be used" }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end  

  def result(level)
    tests.where(level: level)
  end
 
end

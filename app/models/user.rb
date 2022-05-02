# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable
  

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :user_id, dependent: :nullify 
  has_many :gists, dependent: :destroy
  has_many :user_badges
  has_many :my_badges,class_name: 'Badge', foreign_key: :user_id
  has_many :badges, through: :user_badges


  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
                                                message: "@ and '.' should be used" }

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def result(level)
    tests.where(level: level)
  end
end

class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  belongs_to :user, optional: true
  has_one_attached :image
end

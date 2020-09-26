class Game < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :review_users, through: :reviews, source: :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
 
  validates :name, presence: true, length: { maximum: 255 }
  validates :platform, presence: true, length: { maximum: 255 }

end

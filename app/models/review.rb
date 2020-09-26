class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :score, presence: true
  validates :playtime, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  
end

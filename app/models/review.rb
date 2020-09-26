class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :score, presence: true,
            :numericality => {
              :greater_than_or_equal_to => 0,
              :less_than_or_equal_to => 10,
              :message => '入力値が0~10の範囲外です' 
           }
  validates :playtime, presence: true,
            :numericality => {
              :greater_than_or_equal_to => 0,
              :message => '入力値が正の整数以外です' 
           }
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  
end

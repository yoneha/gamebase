class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :games
  has_many :reviews
  has_many :review_games, through: :reviews, source: :game
  has_many :favorites
  has_many :favorite_games, through: :favorites, source: :game


  def favorite(game)
    self.favorites.find_or_create_by(game_id: game.id)
  end
  
  def unfavorite(game)
    game_post = self.favorites.find_by(game_id: game.id)
    game_post.destroy if game_post
  end
  
  def is_favorite?(game)
    self.favorite_games.include?(game)
  end

end
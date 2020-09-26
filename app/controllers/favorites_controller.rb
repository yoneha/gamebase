class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    game = Game.find(params[:game_id])
    current_user.favorite(game)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    game = Game.find(params[:game_id])
    current_user.unfavorite(game)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end


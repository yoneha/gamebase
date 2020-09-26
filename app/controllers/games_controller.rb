class GamesController < ApplicationController
  before_action :require_user_logged_in
  def show
    @game = Game.find(params[:id])
  end
  
  def create
    @game = current_user.games.build(game_params)

    if @game.save
      flash[:success] = 'ゲームを新規登録しました。'
      redirect_to root_url
    else
      flash[:danger] = 'ゲームの新規登録に失敗しました。'
      render "toppages/index"
    end
    
  end
  
  def game_params
    params.require(:game).permit(:name, :platform)
  end
end

class ToppagesController < ApplicationController
  def index
    if logged_in?
      @game = current_user.games.build  # form_with 用
      @games = Game.order(id: :desc).page(params[:page])
    end
  end
end

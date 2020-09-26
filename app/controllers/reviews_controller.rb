class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_review, only: [:edit, :destroy]
  before_action :posted_review, only: [:new]
  
  def new
    @review = Review.new
    @game = Game.find(params[:id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    @game = Game.find(params[:id])
    @review.game_id = @game.id
    
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to @game
      
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      flash[:success] = 'レビューを再投稿しました。'
      redirect_to @review.game
      
    else
      flash.now[:danger] = 'レビューの再投稿に失敗しました。'
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_to @review.game
  end
  
  private

  def review_params
    params.require(:review).permit(:score, :playtime, :title, :content)
  end
  
  def correct_review
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
  
  def posted_review
    if Game.find(params[:id]).reviews.find_by(user_id: current_user.id)
       redirect_to root_url
    end
  end
end

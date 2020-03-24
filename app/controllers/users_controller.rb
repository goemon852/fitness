class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show, :likes]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    
    muscle = SmallGenre.where(big_genre_id: 1).pluck(:id)
    @likes1 = @likes.where(small_genre_id: muscle)
    
    diet = SmallGenre.where(big_genre_id: 2).pluck(:id)
    @likes2 = @likes.where(small_genre_id: diet)
    
    food = SmallGenre.where(big_genre_id: 3).pluck(:id)
    @likes3 = @likes.where(small_genre_id: food)
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
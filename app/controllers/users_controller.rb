class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy,:likes]
  
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
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "退会に成功しました"
    redirect_to root_url
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.order(id: :desc).page(params[:page]).per(10)  #ジャンル関係なしにいいねした投稿をすべて取得
    
    muscle = SmallGenre.where(big_genre_id: 1).pluck(:id)  #big_genre_idが1の小ジャンルをすべて取得
    @likes1 = @likes.where(small_genre_id: muscle)  #いいねした投稿のうち、big_genre_idが1のものをすべて取得
    
    diet = SmallGenre.where(big_genre_id: 2).pluck(:id)  #big_genre_idが2の小ジャンルをすべて取得
    @likes2 = @likes.where(small_genre_id: diet)  #いいねした投稿のうち、big_genre_idが2のものをすべて取得
    
    food = SmallGenre.where(big_genre_id: 3).pluck(:id)  #big_genre_idが3の小ジャンルをすべて取得
    @likes3 = @likes.where(small_genre_id: food)  #いいねした投稿のうち、big_genre_idが3のものをすべて取得
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
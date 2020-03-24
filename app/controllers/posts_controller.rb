class PostsController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    if logged_in?
      @posts = Post.order(id: :desc).page(params[:page]).per(10)  #ジャンル関係なしに全投稿を取得
      
      muscle = SmallGenre.where(big_genre_id: 1).pluck(:id)   #big_genre_idが1の小ジャンルをすべて取得
      @posts1 = @posts.where(small_genre_id: muscle)  #big_genre_idが1の投稿をすべて取得
      
      diet = SmallGenre.where(big_genre_id: 2).pluck(:id)  #big_genre_idが2の小ジャンルをすべて取得
      @posts2 = @posts.where(small_genre_id: diet)  #big_genre_idが2の投稿をすべて取得
      
      food = SmallGenre.where(big_genre_id: 3).pluck(:id)  #big_genre_idが3の小ジャンルをすべて取得
      @posts3 = @posts.where(small_genre_id: food)  #big_genre_idが3の投稿をすべて取得
    end
  end
  
  def show
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました"
      redirect_to posts_url
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "投稿の更新に成功しました"
      redirect_to posts_url
    else
      flash.now[:danger] = "投稿の更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿の削除に成功しました"
    redirect_back(fallback_location: posts_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :small_genre_id)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_url
    end
  end
  
end

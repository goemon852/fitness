class FavoritesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    flash[:success] = "投稿をいいねしました。"
    redirect_back(fallback_location: posts_path)    
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    flash[:success] = "投稿のいいねを解除しました。"
    redirect_back(fallback_location: posts_path)    
  end
end

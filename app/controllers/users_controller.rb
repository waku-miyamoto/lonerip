class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
    @posts = Post.includes(:user).where(user_id: current_user.id).page(params[:page]).per(10).order('updated_at DESC')
  end
end

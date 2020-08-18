class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts.order('created_at DESC')
    @posts = @user.posts.page(params[:page]).per(10).order('updated_at DESC')
  end

  def profile
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

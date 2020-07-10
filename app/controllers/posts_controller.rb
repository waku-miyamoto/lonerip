class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to :root
  end

  private
  def post_params
    params.require(:post).permit(:text, :image, :name).merge(user_id: current_user.id)
  end
end

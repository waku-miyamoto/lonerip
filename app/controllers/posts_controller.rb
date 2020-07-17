class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order("created_at DESC")
    @posts = Post.page(params[:page]).per(10).order('updated_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to :root      
    else
      render :new, notice: "画像を選択してください"
    end

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
    post.destroy
    end
    redirect_to :root
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to :root      
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:text, :image, :name).merge(user_id: current_user.id)
  end
end

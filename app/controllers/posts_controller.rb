class PostsController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
               .includes(:user)
               .page(params[:page]).per(10)
               .order('updated_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to :root, notice: "投稿できました"  
    else
      flash.now[:alert] = "全て入力してください"
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).page(params[:page]).per(10).order('created_at DESC')
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
    post.destroy
    end
    redirect_back(fallback_location: root_path, notice: "削除しました")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to :root, notice: "編集しました"   
    else
      flash.now[:alert] = "全て入力してください"
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:text, :image, :name).merge(user_id: current_user.id)
  end
end

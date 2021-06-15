class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
    if params[:id]
      @genre = Genre.find(params[:id])
      @posts = @genre.posts.order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @genre = Genre.find(@post.genre_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:price, :image, :name, :body, :genre_id, :storage, :expired)
  end

end

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_current_user_posts, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.active.page(params[:page]).sorted_by_newest
    @all_tags = Tag.all
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @new_comment = @post.comments.build(params[:comment])
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Your post was successfully updated'
     else
       render :edit
     end
  end

  def destroy
    user = @post.user
    @post.destroy
    redirect_to user_path(user), notice: 'Your post was successfully deleted'
  end

  private

  def set_current_user_posts
    @post = current_user.posts.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :state, :created_at)
  end
end
class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_current_user_posts, only: %i[edit update destroy]
  before_action :set_post, only: :show

  def index
    @q = params[:query].present? ? Post.search(params[:query]) : Post.all

    @posts = @q.includes(:user, :tags, :post_tags)
               .active
               .sorted_by_newest
               .page(params[:page])

    @all_tags = Tag.top
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @new_comment = @post.comments.build(params[:comment])
  end

  def edit; end

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
    params.require(:post).permit(:title, :body, :active, :created_at)
  end
end

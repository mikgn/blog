class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_comment, except: :create
  before_action :set_post

  def create
    @new_comment = @post.comments.create(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @post, notice: 'Comment was successfully created'
    else
      render 'posts/show'
    end
  end

  def edit
  end

  def update
    if user_can_edit_comment?(@comment)
      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment was successfully updated'
      else
        render 'posts/show'
      end
    end
  end

  def destroy
    if user_can_edit_comment?(@comment)
      @comment.destroy!
      redirect_to @post, notice: 'Comment was successfully deleted'
    else
      render 'posts/show'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_current_user_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end

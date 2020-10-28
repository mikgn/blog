class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:name])
    @tag_posts = Post.joins(:tags).where(tags: { name: params[:name] })
    # @tag_posts = Tag.joins(:posts).where(tags: { name: params[:name] })
  end
end

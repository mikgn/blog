class TagsController < ApplicationController
  def show
    @tag = Tag.joins(:posts).find_by_name(params[:name])
    @posts = @tag.posts.sorted_by_most_commented.page(params[:page])
  end
end

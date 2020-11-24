class TagsController < ApplicationController
  def show
    @tag = Tag.joins(:posts).find_by_name(params[:name])
  end
end

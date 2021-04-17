class SearchController < ApplicationController
  def index
    @q =
      if params[:query].present?
        ::GlobalSearchService.new(params[:query]).call
      else
        {}
      end

    @query_string = params[:query] if params[:query]
  end
end

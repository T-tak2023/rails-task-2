class SearchesController < ApplicationController
  def search
    @query = params[:query]
    @records = Room.search_for(@query)
  end
end

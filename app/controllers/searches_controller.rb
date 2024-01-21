class SearchesController < ApplicationController
  def search
    @records = Room.search_for(area: params[:area], keyword: params[:keyword])
  end
end

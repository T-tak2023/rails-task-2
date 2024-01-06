class SearchesController < ApplicationController
  def search
    @area = params[:area]
    @records = Room.search_for(@area)
  end
end

class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end
  private
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :price_per_day, :room_address)
    end
end

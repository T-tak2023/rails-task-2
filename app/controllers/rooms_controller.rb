class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price_per_day, :room_address))
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end
end

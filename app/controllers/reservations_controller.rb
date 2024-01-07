class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @room_id = params[:room_id]
    @room = Room.find(params[:room_id])
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to :reservations
    else
      render "new"
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :person, :user_id, :room_id)
    end
end

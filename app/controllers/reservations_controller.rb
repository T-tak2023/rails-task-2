class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @room_id = params[:room_id]
    @room = Room.find(params[:room_id])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room_id = params[:room_id]
    @room = Room.find_by(params[:room_id])
    if @reservation.invalid?
      render :new
    end
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if params[:back] || !@reservation.save
      render :new and return
    end
    redirect_to reservations_path
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :person, :user_id, :room_id)
    end
end

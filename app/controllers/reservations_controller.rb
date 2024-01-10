class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @reservation = Reservation.new
    @room_id = params[:room_id]
    @room = Room.find(params[:room_id])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room_id = @reservation.room_id
    @room = Room.find_by(id: @room_id)
    @user_id = current_user.id
    if @reservation.invalid?
      render :new
    end
    @stay_duration = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @total_price = @stay_duration * @room.price_per_day * @reservation.person
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
      params.require(:reservation).permit(:check_in_date, :check_out_date, :person, :total_price, :user_id, :room_id)
    end
end

class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
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
      params.require(:reservation).permit(:check_in_date, :check_out_date, :person)
    end
end

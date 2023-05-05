class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[create destroy]


  def index
    render json: {
      data: {
        reservation: @current_user.reservations
      }
    }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user= @current_user
    @reservation.home_stay=HomeStay.find(params[:reservation][:home_stay_id])
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    unless @user == Reservation.find(params[:id]).user
      return render json: { error: 'You cannot destroy this reservation' },
                    status: :unauthorized
    end
    if @reservation.destroy
      render json: { id: @reservation.id, message: 'Reservation deleted successfully' }
    else
      render json: @reservation.errors.full_messages
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:no_of_persons, :start_date, :end_date, :home_stay_id)
  end
end

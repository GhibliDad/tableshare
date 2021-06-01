class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.event = Event.find(params[:event_id])
    authorize @reservation
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render "events/:id"
      #render "events/#{params[:event_id]}"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:message)
  end
end

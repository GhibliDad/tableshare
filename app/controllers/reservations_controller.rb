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

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    if params[:query] == "accept"
      @reservation.status = "accepted"
      @reservation.save
    else
      @reservation.status = "declined"
      @reservation.save
    end
    redirect_to user_path(@reservation.event.current_user)
  end

  def accept
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.status = "accepted"
    @reservation.save
    redirect_to dashboard_path(:status => "answered")
  end

  def decline
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.status = "declined"
    @reservation.save
    redirect_to dashboard_path(:status => "answered")
  end

  private

  def reservation_params
    params.require(:reservation).permit(:message, :status)
  end
end

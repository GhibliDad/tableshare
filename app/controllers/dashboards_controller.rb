class DashboardsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: @user)
    @events = Event.where(user_id: @user)
    authorize @user
    @reservations = @user.reservations
  end
end

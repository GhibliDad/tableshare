class DashboardController < ApplicationController
  def show
    @user = current_user
    @reservations = @user.reservations
    @pastReservations = @reservations.select do |reservation|
      reservation.event.end_time.past?
    end
    @reservations = @reservations.select do |reservation|
      reservation.event.end_time.future?
    end
    @events = @user.events
    @pastEvents = @events.select do |event|
      event.end_time.past?
    end
    @events = @events.select do |event|
      event.end_time.future?
    end
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    authorize @user
    redirect_to "/dashboard"
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :address, :phone_number, :about, :photo, :allergies, :password_confirmation, :message)
  end
end

class DashboardController < ApplicationController
  def show
    @user = current_user
    @reservations = Reservation.where(user_id: @user)
    @events = Event.where(user_id: @user)
    authorize @user
    @reservations = @user.reservations
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

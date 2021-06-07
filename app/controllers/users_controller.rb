class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: @user)
    @events = Event.where(user_id: @user)
    authorize @user
    @reservations = @user.reservations
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to dashboard_path(@user)
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :address, :phone_number, :about, :photo, :allergies)
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(user_id: @user)
    @events = Event.where(user_id: @user)
    authorize @user
    @reservations = @user.reservations
    counter = 0
    total = 0
    @user.reservations_as_host.each do |reservation|
      reservation.reviews.each do |review|
        counter += review.total_rating
        total += 1
      end
    end
    @rating = counter / total
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :address, :phone_number, :about, :photo, :allergies, :password_confirmation)
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @reservations = @user.reservations
  end
end

class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(params[:id])
    @event = Event.find(params[:event_id])
    @event.user = User.find(params[:user_id])
    authorize @review
  end

  def show
  end

  def new
    @review = Review.new
    authorize @review
    @event = Event.find(params[:event_id])
    @reservation = Reservation.find(params[:reservation_id])
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = Reservation.find(params[:reservation_id])
    @user = current_user
    authorize @review
    average = (review_params["food_rating"].to_i + review_params["host_rating"].to_i + review_params["vibe_rating"].to_i) / 3
    @review.total_rating = average
    if @review.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:heading, :content, :food_rating, :host_rating, :vibe_rating, :photo, :reservation_id, :event_id)
  end
end

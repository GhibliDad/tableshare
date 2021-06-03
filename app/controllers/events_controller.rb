class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = policy_scope(Event).order(created_at: :desc)
    @location = Geocoder.search(params[:address]).first
    @tables = Event.near(@location.coordinates, 2, units: :km)
    @coordinates = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @reservation = Reservation.new
    authorize @event
    @attendees = @event.reservations
    @host = @event.user
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      @chatroom = Chatroom.new
      @chatroom.event = @event
      @chatroom.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :description, :address, :available_seats, :ingredients)
  end
end

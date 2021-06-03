class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @allEvents = policy_scope(Event).order(created_at: :desc)
    @location = Geocoder.search(params[:address]).first
    @tables = Event.near(@location.coordinates, 5, units: :km)
    #query = ("SELECT * FROM events WHERE start_date BETWEEN ? AND ?", params[:date1], params[:date2])
    #@result = @tables.where("start_time = BETWEEN ? AND ?", params[:date1], params[:date2])
    #@result = @tables.where("start_time > ? AND end_time < ?", params[:date1], params[:date2])
    @events = @tables.where("start_time > ?", params[:date1]).where("end_time < ?", params[:date2])
    @coordinates = @tables.geocoded.map do |event|
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
    params.require(:event).permit(:title, :start_time, :end_time, :description, :address, :available_seats, :ingredients, :price)
  end
end

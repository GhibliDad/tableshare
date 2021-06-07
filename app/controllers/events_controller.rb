class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = policy_scope(Event).order(created_at: :desc)
    if params[:address]
      @location = Geocoder.search(params[:address]).first
      @tables = Event.near(@location.coordinates, 10, units: :km)
      @events = @tables.where("date(start_time) >= ? AND date(start_time) <= ?", params[:date1], params[:date2])
      @coordinates = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude
        }
      end
    else
      @coordinates = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude
        }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @chatroom = @event.chatroom
    @messages = Message.where(chatroom_id: @chatroom)
    @message = Message.new
    @reservation = Reservation.new
    authorize @event
    @attendees = @event.reservations
    @guests = @attendees.map { |reser| reser.user }
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
    params.require(:event).permit(:title, :start_time, :end_time, :description,
      :address, :available_seats, :ingredients, :price, :date, :photo)
  end
end

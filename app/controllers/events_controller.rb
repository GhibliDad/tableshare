class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # SORRY FOR THE MOST MESSY CODE EVER...
    @events = policy_scope(Event).order(start_time: :desc)
    search = params[:search]
    if search.nil? || search[:address].empty? && search[:date1].empty?
      @events = Event.all
      @coordinates = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude
        }
      end
    elsif search[:address].empty?
      @tables = Event.all
      date1 = search[:date1].split('to').first.strip
      date2 = search[:date1].split('to').last.strip
      @events = @tables.where("date(start_time) >= ? AND date(start_time) <= ?", date1, date2)
      @coordinates = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude
        }
      end
    elsif search[:date1].empty?
      @location = Geocoder.search(search[:address]).first
      @events = Event.near(@location.coordinates, 10, units: :km)
      @coordinates = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude
        }
      end
    else
      @location = Geocoder.search(search[:address]).first
      @tables = Event.near(@location.coordinates, 10, units: :km)
      date1 = search[:date1].split('to').first.strip
      date2 = search[:date1].split('to').last.strip
      @events = @tables.where("date(start_time) >= ? AND date(start_time) <= ?", date1, date2)
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
    @attendees = @event.reservations.where(status: 'accepted')
    @pending = @event.reservations.where(status: 'pending')
    @guests = @attendees.map do |reser|
      reser.user if reser.status == 'accepted'
    end
    @pending_guests = @pending.map do |reser|
      reser.user if reser.status == 'pending'
    end
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

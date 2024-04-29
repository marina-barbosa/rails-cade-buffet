class EventController < ApplicationController
  def index
    @events = Event.all
    "event/index"
  end

  def show
    @event = Event.find(params[:id])

    @price = Price.find(@event.price_id) if @event.price_id != nil
  end

  def new
    @event = Event.new
  end

  def create
    buffet_id = current_user.buffet_id
    buffet = Buffet.find(buffet_id)
    @event = Event.new(
      name: params[:event][:name],
      description: params[:event][:description],
      min_people: params[:event][:min_people],
      max_people: params[:event][:max_people],
      default_event_duration_minutes: params[:event][:default_event_duration_minutes],
      alcoholic_drinks: params[:event][:alcoholic_drinks],
      decoration: params[:event][:decoration],
      parking_service: params[:event][:alcoholicparking_service_drinks],
      valet: params[:event][:valet],
      exclusive_buffet_location: params[:event][:exclusive_buffet_location],
      price_id: params[:event][:price_id].presence || nil,
      buffet_id: current_user.buffet_id,
    )
    if @event.save!
      return redirect_to buffet_path(buffet_id)
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(
      name: params[:event][:name],
      description: params[:event][:description],
      min_people: params[:event][:min_people],
      max_people: params[:event][:max_people],
      default_event_duration_minutes: params[:event][:default_event_duration_minutes],
      alcoholic_drinks: params[:event][:alcoholic_drinks],
      decoration: params[:event][:decoration],
      parking_service: params[:event][:alcoholicparking_service_drinks],
      valet: params[:event][:valet],
      exclusive_buffet_location: params[:event][:exclusive_buffet_location],
    )
      buffet_id = current_user.buffet_id
      return redirect_to buffet_path(buffet_id)
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :edit
  end
end

class HomeController < ApplicationController
  def index
  end

  def search
    @results = Buffet.where(commercial_name: params[:search_term])

    results_by_city = Address.where(city: params[:search_term])
    results_by_city.each do |address|
      @results += Buffet.where(address_id: address.id)
    end

    results_by_event = Event.where(name: params[:search_term])
    results_by_event.each do |event|
      @results += Buffet.where(id: event.buffet_id)
    end

    @results = @results.sort_by(&:commercial_name)
  end
end

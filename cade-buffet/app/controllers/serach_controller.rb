

class EventController < ApplicationController

    def search
        @buffets = Buffet.where(
        name: params[:search_term],
        city: params[:search_term],
        event: Event.find_by(name: params[:search_term])
        ).order(:name)
    end

end
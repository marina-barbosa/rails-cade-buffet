class HomeController < ApplicationController
    before_action :check_user_owner_has_buffet, if: :user_signed_in?
    def index
      
    end 
end
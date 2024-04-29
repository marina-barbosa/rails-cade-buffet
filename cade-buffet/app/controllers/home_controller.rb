class HomeController < ApplicationController
  before_action :check_user_owner_has_buffet, if: :user_signed_in?

  def index
  end

  def search
    search_terms = ["%#{params[:q]}%", "%#{params[:q]}%"]

    @buffets = Buffet.includes(:address, events)
      .where(
        "trading_name LIKE ? OR addresses.city LIKE ?",
        *search_terms
      )
  end
end

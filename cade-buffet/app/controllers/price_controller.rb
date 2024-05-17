class PriceController < ApplicationController
  def index
    @prices = Price.all
    "price/index"
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(
      base_price_weekdays: params[:price][:base_price_weekdays],
      additional_person_price_weekdays: params[:price][:additional_person_price_weekdays],
      extra_event_hour_price_weekdays: params[:price][:extra_event_hour_price_weekdays],
      base_price_weekend: params[:price][:base_price_weekend],
      additional_person_price_weekend: params[:price][:additional_person_price_weekend],
      extra_event_hour_price_weekend: params[:price][:extra_event_hour_price_weekend],
    )
    if @price.save!
      buffet_id = current_user.buffet_id
      buffet = Buffet.find(buffet_id)
      event = Event.where(buffet_id: buffet.id)
      event.update(price_id: @price.id)
      return redirect_to buffet_path(buffet_id), notice: "Preços cadastrados com sucesso."
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :new
  end

  def edit
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
    if @price.update(
      base_price_weekdays: params[:price][:base_price_weekdays],
      additional_person_price_weekdays: params[:price][:additional_person_price_weekdays],
      extra_event_hour_price_weekdays: params[:price][:extra_event_hour_price_weekdays],
      base_price_weekend: params[:price][:base_price_weekend],
      additional_person_price_weekend: params[:price][:additional_person_price_weekend],
      extra_event_hour_price_weekend: params[:price][:extra_event_hour_price_weekend],
    )
      buffet_id = current_user.buffet_id
      return redirect_to buffet_path(buffet_id)
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :edit
  end
end

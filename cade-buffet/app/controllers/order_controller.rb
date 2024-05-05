class OrderController < ApplicationController
  def index
    if current_user.owner
      @orders = Order.where(buffet_id: current_user.buffet_id).order(status: :asc)
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def new
    @order = Order.new
    @buffet_id = params[:buffet_id]
    @event_id = params[:event_id]
    event = Event.find(params[:event_id])
    @exclusive_buffet_location = event.exclusive_buffet_location
  end

  def create
    @order = Order.new(
      date: params[:order][:date],
      guest_count: params[:order][:guest_count],
      more_details: params[:order][:more_details],
      event_exclusive_address: params[:order][:event_exclusive_address],
      address: params[:order][:address],
      user_id: current_user.id,
      buffet_id: params[:buffet_id],
      event_id: params[:event_id],
    )
    @order.buffet = Buffet.find_by_id(params[:order][:buffet_id])
    @order.event = Event.find_by_id(params[:order][:event_id])
    if @order.save!
      redirect_to order_index_path, notice: "Pedido criado com sucesso."
    else
      Rails.logger.error("Erro de validação: #{e.message}")
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])

    @orders_same_day = Order.where(date: @order.date, buffet_id: @order.buffet_id).where.not(id: @order.id) if current_user.owner
  end

  def edit
    @order = Order.find(params[:id])
    @event = Event.find(@order.event_id)
    @price = Price.find(@event.price_id)
    @buffet = Buffet.find(@order.buffet_id)
    @payment_methods = PaymentMethod.find(@buffet.payment_methods_id)

    @total_value = 0
    if @order.date.saturday? || @order.date.sunday?
      @total_value = @price.base_price_weekend
      additional_person_price = @price.additional_person_price_weekend
    else
      @total_value = @price.base_price_weekdays
      additional_person_price = @price.additional_person_price_weekdays
    end

    if @order.guest_count - @event.min_people > 0
      @total_value = @total_value + (@order.guest_count - @event.min_people) * additional_person_price
    end
  end

  def update
    @order = Order.find(params[:id])

    @order.assign_attributes(
      expiration_date: params[:order][:expiration_date],
      description: params[:order][:description],
      status: 1,
      final_value: params[:order][:final_value],
    )

    if params[:order][:value_type] == "1"
      @order.extra_fee = params[:order][:fee_or_discount]
    elsif params[:order][:value_type] == "0"
      @order.discount = params[:order][:fee_or_discount]
    end

    if @order.save!
      return redirect_to order_index_path, notice: "Pedido aprovado com sucesso."
    else
      Rails.logger.error("Erro de validação: #{e.message}")
      return render :edit
    end
  end

  def conclude
    @order = Order.find(params[:id])

    if @order.update(
      payment_method: params[:order][:payment_method],
      status: 2,
    )
      redirect_to order_index_path
    else
      Rails.logger.error("Erro de validação: #{e.message}")
      render :edit
    end
  end
end

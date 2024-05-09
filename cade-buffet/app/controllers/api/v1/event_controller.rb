class Api::V1::EventController < ActionController::API
  def index
    buffet_id = params[:buffet_id]
    events = Event.where(buffet_id: buffet_id)
    render status: 200, json: events
  end

  def check_availability
    event_id = params[:event_id]
    date = params[:date]
    guest_count = params[:guest_count]

    event = Event.find_by(id: event_id)
    if event && event.available?(date, guest_count)
      final_value = calculate_final_value(event_id, date, guest_count)
      render status: 200, json: { message: "Evento disponível", final_value: final_value }
    else
      render status: 400, json: { error: "Evento não disponível" }
    end
  end

  private

  def available?(date, guest_count)
    return false unless self

    return false if guest_count <= 0 || guest_count > max_people

    return false if date < Date.today

    orders = Order.where(event_id: self.id, date: date, status: 1)
    return false if orders.any?

    true
  end

  def calculate_final_value(event_id, date, guest_count)
    event = Event.find(event_id)
    price = Price.find(event.price_id)

    base_price = date.saturday? || date.sunday? ? price.base_price_weekend : price.base_price_weekdays

    additional_person_price = date.saturday? || date.sunday? ? price.additional_person_price_weekend : price.additional_person_price_weekdays

    extra_guests = guest_count - event.min_people

    total_value = base_price + (extra_guests * additional_person_price)

    total_value
  end
end

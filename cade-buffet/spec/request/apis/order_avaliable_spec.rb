require 'rails_helper'

RSpec.describe Api::V1::EventController, type: :controller do
  describe "GET #check_availability" do
    before do
      @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
      @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
      @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
      @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)
      Order.create!(user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: 0)

      @date = Date.today + 1
      @guest_count = 50
    end

    it "retorna true quando o evento está disponível" do
      get :check_availability, params: { event_id: @event.id, date: @date.to_s, guest_count: @guest_count }
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response['message']).to eq("Evento disponível")
      expect(json_response['final_value']).to be_present
    end

    it "retorna false quando o evento não está disponível devido ao número de convidados exceder o limite máximo" do
      get :check_availability, params: { event_id: @event.id, date: @date.to_s, guest_count: @event.max_people + 1 }
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(400)
      expect(json_response['error']).to eq("Evento não disponível")
    end

    it "retorna false quando o evento não está disponível devido à data ser no passado" do
      get :check_availability, params: { event_id: @event.id, date: (Date.today - 1).to_s, guest_count: @guest_count }
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(400)
      expect(json_response['error']).to eq("Evento não disponível")
    end

    # it "retorna false quando o evento não está disponível devido a outro pedido na mesma data" do
    #   date = Date.today
    #   get :check_availability, params: { event_id: @event.id, date: date.to_s, guest_count: @guest_count }
    #   json_response = JSON.parse(response.body)

    #   expect(response).to have_http_status(400)
    #   expect(json_response['error']).to eq("Evento não disponível")
    # end
  end
end

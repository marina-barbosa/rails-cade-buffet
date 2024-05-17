require 'rails_helper'

RSpec.describe Api::V1::EventController, type: :request do
  describe "GET /api/v1/buffet/:buffet_id/event" do
    before do
      @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
      @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
      @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
      @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)
      @event = Event.create!(name: "Festa de Aniversário Infantil", description: "Uma festa animada com buffet infantil, recreação e decoração temática.", min_people: 20, max_people: 30, default_event_duration_minutes: 180, alcoholic_drinks: false, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
    end

    it "retorna uma lista de eventos para um buffet específico" do
      get "/api/v1/buffet/#{@buffet.id}/event"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")

      events = JSON.parse(response.body)
      expect(events.size).to eq(2)

      expect(events[0]["name"]).to eq("Noite de Mistério")
      expect(events[0]["description"]).to eq("Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.")

      expect(events[1]["name"]).to eq("Festa de Aniversário Infantil")
      expect(events[1]["description"]).to eq("Uma festa animada com buffet infantil, recreação e decoração temática.")
    end

    it "não retorna eventos quando o buffet_id não existe" do
      get "/api/v1/buffet/9999/event"

      expect(response).to have_http_status(404)
    end
  end
end

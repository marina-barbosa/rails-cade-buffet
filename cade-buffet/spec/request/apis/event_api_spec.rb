require 'rails_helper'

RSpec.describe Api::V1::EventController, type: :request do
  describe "GET /api/v1/events" do
    before do
      @buffet = Buffet.create!(commercial_name: "Buffet Teste")
      @event1 = Event.create!(buffet_id: @buffet.id, name: "Evento 1", description: "Descrição do Evento 1")
      @event2 = Event.create!(buffet_id: @buffet.id, name: "Evento 2", description: "Descrição do Evento 2")
    end

    it "retorna uma lista de eventos para um buffet específico" do
      get :index, params: { buffet_id: @buffet.id }

      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")

      events = JSON.parse(response.body)
      expect(events.size).to eq(2)

      expect(events[0]["name"]).to eq("Evento 1")
      expect(events[0]["description"]).to eq("Descrição do Evento 1")

      expect(events[1]["name"]).to eq("Evento 2")
      expect(events[1]["description"]).to eq("Descrição do Evento 2")
    end

    it "não retorna eventos quando o buffet_id não existe" do
      get :index, params: { buffet_id: 9999 }

      expect(response).to have_http_status(404)
    end
  end

  describe "GET /api/v1/events/check_availability" do
    before do
      @buffet = Buffet.create!(commercial_name: "Buffet Teste")
      @event1 = Event.create!(buffet_id: @buffet.id, name: "Evento 1", description: "Descrição do Evento 1")
      @event2 = Event.create!(buffet_id: @buffet.id, name: "Evento 2", description: "Descrição do Evento 2")
    end

    context "when the event is available" do
      it "returns a 200 status and the final value" do
        get :check_availability, params: { event_id: @event1.id, date: Date.today.to_s, guest_count: 10.to_s }

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)["message"]).to eq("Evento disponível")
        expect(JSON.parse(response.body)["final_value"]).to be_a(Float)
      end
    end

    context "when the event is not available" do
      it "returns a 400 status and an error message" do
        get :check_availability, params: { event_id: @event2.id, date: Date.today.to_s, guest_count: 20.to_s }

        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)["error"]).to eq("Evento não disponível")
      end
    end
  end
end

require "rails_helper"

RSpec.describe Event, type: :model do
  describe "#valid?" do
    context "quando os campos obrigatórios estão ausentes" do
      it "retorna false se o nome estiver ausente" do
        event = Event.new(name: nil, description: "Descrição do evento", min_people: 10, max_people: 20, default_event_duration_minutes: 60, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
        expect(event.valid?).to eq(false)
      end

      it "retorna false se a descrição estiver ausente" do
        event = Event.new(name: "Evento de Aniversário", description: nil, min_people: 10, max_people: 20, default_event_duration_minutes: 60, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
        expect(event.valid?).to eq(false)
      end
    end

    context "quando os campos numéricos são inválidos" do
      it "retorna false se min_people for menor que 0" do
        event = Event.new(name: "Evento de Aniversário", description: "Descrição do evento", min_people: -1, max_people: 20, default_event_duration_minutes: 60, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
        expect(event.valid?).to eq(false)
      end

      it "retorna false se max_people for menor que min_people" do
        event = Event.new(name: "Evento de Aniversário", description: "Descrição do evento", min_people: 10, max_people: 5, default_event_duration_minutes: 60, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
        expect(event.valid?).to eq(false)
      end

      it "retorna false se default_event_duration_minutes for menor que 0" do
        event = Event.new(name: "Evento de Aniversário", description: "Descrição do evento", min_people: 10, max_people: 20, default_event_duration_minutes: -1, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: 1)
        expect(event.valid?).to eq(false)
      end
    end

    context "quando buffet_id está ausente" do
      it "retorna false" do
        event = Event.new(name: "Evento de Aniversário", description: "Descrição do evento", min_people: 10, max_people: 20, default_event_duration_minutes: 60, alcoholic_drinks: false, decoration: false, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 1, buffet_id: nil)
        expect(event.valid?).to eq(false)
      end
    end
  end
end

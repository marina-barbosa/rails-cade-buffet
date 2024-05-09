require 'rails_helper'

describe "#available?" do
  before do
    @event = Event.create!(name: "Evento Teste", buffet_id: @buffet.id, min_people: 5, max_people: 20)
    @date = Date.today
    @guest_count = 15
  end

  context "when the event is available" do
    it "returns true when the event is available" do
      expect(@event.available?(@date, @guest_count)).to be true
    end
  end

  context "when the event is not available" do
    it "returns false when the event is not available" do
      expect(@event.available?(@date, @guest_count)).to be false
    end
  end
end

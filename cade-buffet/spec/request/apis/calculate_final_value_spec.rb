require 'rails_helper'

describe "#calculate_final_value" do
  before do
    @event = Event.create!(name: "Evento Teste", buffet_id: @buffet.id, price_id: 1)
    @price = Price.create!(base_price_weekdays: 100, additional_person_price_weekdays: 10)
    allow(Event).to receive(:find).and_return(@event)
    allow(Price).to receive(:find).and_return(@price)
  end

  context "when the event is on a weekend" do
    @date = Date.today.saturday?

    it "calculates the final value correctly" do
      expect(calculate_final_value(@event.id, @date, 10)).to eq(120)
    end
  end

  context "when the event is on a weekday" do
    @date = Date.today.monday

    it "calculates the final value correctly" do
      expect(calculate_final_value(@event.id, @date, 10)).to eq(110)
    end
  end
end

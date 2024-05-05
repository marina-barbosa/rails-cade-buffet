require "rails_helper"

RSpec.describe Price, type: :model do
  describe "#valid?" do
    context "quando os campos obrigatórios estão ausentes" do
      it "retorna false se base_price_weekdays estiver ausente" do
        price = Price.new(base_price_weekdays: nil, additional_person_price_weekdays: 10, extra_event_hour_price_weekdays: 5, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se additional_person_price_weekdays estiver ausente" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: nil, extra_event_hour_price_weekdays: 5, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se extra_event_hour_price_weekdays estiver ausente" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: nil, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se base_price_weekend estiver ausente" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: nil, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se additional_person_price_weekend estiver ausente" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: 15, additional_person_price_weekend: nil, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se extra_event_hour_price_weekend estiver ausente" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: nil)
        expect(price.valid?).to eq(false)
      end
    end

    context "quando os campos numéricos são inválidos" do
      it "retorna false se base_price_weekdays for menor que 0" do
        price = Price.new(base_price_weekdays: -1, additional_person_price_weekdays: 10, extra_event_hour_price_weekdays: 5, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se additional_person_price_weekdays for menor que 0" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: -1, extra_event_hour_price_weekdays: 5, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se extra_event_hour_price_weekdays for menor que 0" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: -1, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se base_price_weekend for menor que 0" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: -1, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se additional_person_price_weekend for menor que 0" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: 15, additional_person_price_weekend: -1, extra_event_hour_price_weekend: 3)
        expect(price.valid?).to eq(false)
      end

      it "retorna false se extra_event_hour_price_weekend for menor que 0" do
        price = Price.new(base_price_weekdays: 10, additional_person_price_weekdays: 5, extra_event_hour_price_weekdays: 3, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: -1)
        expect(price.valid?).to eq(false)
      end
    end
  end
end

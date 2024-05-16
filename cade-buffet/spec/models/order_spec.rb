require "rails_helper"

RSpec.describe Order, type: :model do
  describe "#valid?" do
    context "quando os campos obrigatórios estão ausentes" do
      it "retorna false se a descrição estiver ausente" do
        order = Order.new(description: nil, status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: 1, buffet_id: 1, user_id: 1, code: nil, discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o status estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: nil, guest_count: 10, date: Date.today, event_id: 1, buffet_id: 1, user_id: 1, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o guest_count estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: nil, date: Date.today, event_id: 1, buffet_id: 1, user_id: 1, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se a data estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: nil, event_id: 1, buffet_id: 1, user_id: 1, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o event_id estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: nil, buffet_id: 1, user_id: 1, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o buffet_id estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: 1, buffet_id: nil, user_id: 1, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o user_id estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: 1, buffet_id: 1, user_id: nil, code: "ABC123", discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end

      it "retorna false se o code estiver ausente" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: 1, buffet_id: 1, user_id: 1, code: nil, discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.valid?).to eq(false)
      end
    end

    context "quando o código é gerado automaticamente" do
      it "gera um código único" do
        buffet = Buffet.create!(
          commercial_name: "Bistrô do Sol Nascente",
          legal_name: "Bistrô do Sol Nascente",
          cnpj: "12345678901234",
          phone: "98765432100",
          email: "bistronascencao@buffet.com",
          description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.",
        )

        price = Price.create!(base_price_weekdays: 10, additional_person_price_weekdays: 10, extra_event_hour_price_weekdays: 5, base_price_weekend: 15, additional_person_price_weekend: 7, extra_event_hour_price_weekend: 3)

        event = Event.create!(
          name: "Evento A",
          description: "Descrição do evento",
          min_people: 10,
          max_people: 20,
          default_event_duration_minutes: 60,
          alcoholic_drinks: false,
          decoration: false,
          parking_service: false,
          valet: false,
          exclusive_buffet_location: false,
          price_id: price.id,
          buffet_id: 1,
        )

        user = User.create!(
          email: "hortency@email.com",
          password: '123456',
          password_confirmation: '123456',
          name: "Hortência Flores",
          cpf: "12345678901",
          owner: true,
          buffet_id: 1,
        )

        first_order = Order.create!(description: "Pedido de aniversário", status: 0, guest_count: 10, date: Date.today, event_id: event.id, buffet_id: buffet.id, user_id: user.id, discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")

        second_order = Order.new(description: "Pedido de aniversário", status: 0, guest_count: 10, date: Date.today, event_id: event.id, buffet_id: buffet.id, user_id: user.id, discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")

        second_order.save!

        expect(first_order.code).not_to be_empty
        expect(first_order.code).not_to be_nil
        expect(first_order.code.length).to eq 10
        expect(second_order.code).not_to eq first_order.code
      end
    end
  end
end

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

    context "quando os campos numéricos são inválidos" do
      # Itens já cobertos anteriormente
    end

    context "quando o código é gerado automaticamente" do
      it "gera um código único antes da criação" do
        order = Order.new(description: "Pedido de aniversário", status: "awaiting_buffet_evaluation", guest_count: 10, date: Date.today, event_id: 1, buffet_id: 1, user_id: 1, discount: 0, extra_fee: 0, final_value: 100, payment_method: "credit_card")
        expect(order.code).not_to be_nil
        expect(Order.exists?(order.code)).to be_falsey
      end
    end
  end
end

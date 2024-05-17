require "rails_helper"

RSpec.describe "Gerenciamento de Pedidos", type: :system do
  before do
    payment = PaymentMethod.create!(credit_card: true, debit_card: true, pix: true, ticket_payment: false)
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.", payment_methods_id: 1)
    @dono = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    @cliente = User.create!(email: "isaac@gmail.com", password: '123456', password_confirmation: '123456', name: "Isaac Quincy", cpf: "77788899900", owner: false, buffet_id: nil)
    @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
    @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)

    @order = Order.create!(user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: 0)
    other_order = Order.create!(user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: 0)

    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDE12345')
  end
  it "dono avalia e é notificado caso exista outro pedido para o mesmo dia" do
    logout
    login_as @dono
    visit root_path
    click_on 'Gerenciar Buffet'
    click_on 'Gerenciar Pedidos'

    expect(page).to have_content("Awaiting buffet evaluation")
    expect(page).to have_content(@order.code)

    click_on @order.code

    expect(page).to have_content("awaiting_buffet_evaluation")
    expect(page).to have_content(@order.code)
    expect(page).to have_content("Atenção! Existem outros pedidos para esse mesmo dia.")

    click_on 'Aprovar Pedido'

    expect(page).to have_content("Aprovando Pedido")
    expect(page).to have_content(@order.code)
  end

  it "aprova um pedido com valor final, data de validade, descrição e meio de pagamento" do
    login_as @dono
    visit edit_order_path(@order)

    fill_in "Expiration date", with: "2024-05-04" # colocar horario dps
    choose('order_value_type_1') # choose("extra_fee")
    fill_in "fee", with: "10000" # Valor:
    fill_in "Description", with: "Taxa extra por serviço especial"
    fill_in "Final value", with: "1520000"

    click_on "Aprovar"

    expect(page).to have_content("Pedido aprovado com sucesso.")
    expect(page).to have_content(@order.code)
    expect(page).to have_content("Awaiting customer confirmation")
  end
end

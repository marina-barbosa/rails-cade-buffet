require "rails_helper"

RSpec.describe "Confirmação de Pedidos pelos Clientes", type: :system do
  it "confirma um pedido quando a data atual é anterior à data-limite" do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: false)
    @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
    @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)

    @order = Order.create!(code: "PED123", user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: 1)

    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDE12345')

    allow(Time).to receive(:now).and_return((Time.now - 1.day).to_time)

    login_as @user

    visit root_path

    click_on "Gerenciar Pedidos"

    expect(page).to have_content @order.code
    expect(page).to have_content "Awaiting customer confirmation"

    expect(page).to have_content "Data-limite para confirmação: #{(Time.now + 1.day).strftime("%d/%m/%Y")}"

    click_on @order.code

    expect(page).to have_content "Aprovando Pedido"

    fill_in "Forma de Pagamento", with: "Credit Card"

    click_on "Confirmar Pedido"

    expect(page).to have_content "Pedido confirmado com sucesso!"
  end
end

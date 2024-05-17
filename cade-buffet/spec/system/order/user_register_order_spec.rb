require "rails_helper"

RSpec.describe "Cadastro de Pedidos", type: :system do
  it "cria um pedido com todos os campos necessários e gera um código alfanumérico" do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: false)
    @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
    @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)

    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDE12345')

    login_as @user

    visit root_path

    click_on @buffet.commercial_name

    click_on "Registrar Pedido"

    fill_in "Date", with: "2024-06-15"
    fill_in "Guest count", with: "50"
    fill_in "More details", with: "Requerem mesas longas"
    fill_in "Address", with: "Rua das Flores, 123" if @event.exclusive_buffet_location

    click_on "Concluir"

    expect(page).to have_content "Pedido criado com sucesso."
    order = Order.last
    expect(page).to have_content "ABCDE12345"

    expect(Order.last.date).to eq(Date.parse("2024-06-15"))
    expect(Order.last.guest_count).to eq(50)
    expect(Order.last.more_details).to eq("Requerem mesas longas")
    expect(Order.last.event_exclusive_address).to eq(true)
    expect(Order.last.address).to eq("Rua das Flores, 123") if @event.exclusive_buffet_location

    visit order_index_path(@user)
    expect(page).to have_content "Seus pedidos:"
    expect(page).to have_content "ABCDE12345"
  end
end

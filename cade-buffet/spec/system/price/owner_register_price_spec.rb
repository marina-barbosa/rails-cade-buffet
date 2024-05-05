require "rails_helper"

RSpec.describe "Cadastro de Preços por Evento", type: :system do
  before do
    @user = User.create!(name: "Hortencia", cpf: "20202020202", email: "hortencia@email.com", password: "123456", owner: true)
    @buffet = Buffet.create!(user: @user, commercial_name: "Buffet Original", legal_name: "Buffet Original Ltda", cnpj: "123456789000124", email: "original@buffet.com", phone: "13 3262 1234", description: "Buffet original com pratos tradicionais.")
    @event = Event.create!(buffet: @buffet, name: "Festa de 15 Anos", min_people: 50, max_people: 100, default_event_duration_minutes: 120, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true)
  end

  it "cadastra novos preços para um tipo de evento" do
    login_as @user
    visit new_price_path

    fill_in "Base Price Weekdays", with: 10000
    fill_in "Additional Person Price Weekdays", with: 250
    fill_in "Extra Event Hour Price Weekdays", with: 1000
    fill_in "Base Price Weekend", with: 14000
    fill_in "Additional Person Price Weekend", with: 300
    fill_in "Extra Event Hour Price Weekend", with: 1500
    click_on "Salvar"

    expect(current_path).to eq event_path(@event)
    expect(page).to have_content "Preços cadastrados com sucesso."
  end
end

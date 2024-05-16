require "rails_helper"

describe "Cadastra novos preços para um evento", type: :system do
  before do
    @user = User.create!(name: "Hortencia", cpf: "20202020202", email: "hortencia@email.com", password: "123456", owner: true)
    buffet = Buffet.create!(commercial_name: "Buffet Original", legal_name: "Buffet Original Ltda", cnpj: "123456789000124", email: "original@buffet.com", phone: "13 3262 1234", description: "Buffet original com pratos tradicionais.")
    price = Price.create!(base_price_weekdays: 150000, additional_person_price_weekdays: 10000, extra_event_hour_price_weekdays: 7500, base_price_weekend: 200000, additional_person_price_weekend: 15000, extra_event_hour_price_weekend: 10000)
    event = Event.create!(name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)
  end

  it "com sucesso" do
    login_as @user
    visit new_price_path

    fill_in "Base price weekdays", with: 10000
    fill_in "Additional Person Price Weekdays", with: 250
    fill_in "Extra Event Hour Price Weekdays", with: 1000
    fill_in "Base Price Weekend", with: 14000
    fill_in "Additional Person Price Weekend", with: 300
    fill_in "Extra Event Hour Price Weekend", with: 1500
    click_on "Salvar"

    expect(current_path).to eq event_path(event)
    expect(page).to have_content "Preços cadastrados com sucesso."
  end

  it "sem sucesso/ dados invalidos/ preço negativo" do
  end

  it "e atualiza os preços" do
  end
end

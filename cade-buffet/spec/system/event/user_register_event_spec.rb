require "rails_helper"

RSpec.describe "Cadastro de Evento", type: :system do
  before do
    @user = User.create!(name: "Hortencia", cpf: "20202020202", email: "hortencia@email.com", password: "123456", owner: true)
    @buffet = Buffet.create!(user: @user, commercial_name: "Buffet Original", legal_name: "Buffet Original Ltda", cnpj: "123456789000124", email: "original@buffet.com", phone: "13 3262 1234", description: "Buffet original com pratos tradicionais.")
    @event = Event.new(name: "Festa de 15 Anos", min_people: 50, max_people: 100, default_event_duration_minutes: 120, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, buffet: @buffet)
  end

  it "cadastro de evento pelo proprietário do buffet" do
    login_as @user
    visit new_event_path

    fill_in "Name", with: @event.name
    fill_in "Min People", with: @event.min_people
    fill_in "Max People", with: @event.max_people
    fill_in "Default Event Duration Minutes", with: @event.default_event_duration_minutes
    check "Alcoholic Drinks"
    check "Decoration"
    check "Parking Service"
    check "Valet"
    check "Exclusive Buffet Location"
    click_on "Salvar"

    expect(current_path).to eq event_path(@event)
    expect(page).to have_content @event.name
    expect(page).to have_content "Evento cadastrado com sucesso."
  end
end

require "rails_helper"

RSpec.describe "Cadastro de Evento", type: :system do
  before do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    # @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
    # @event = Event.new(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)

  end

  it "cadastro de evento pelo dono do buffet" do
    login_as @user
    visit new_event_path

    fill_in "Name", with: "Noite de Mistério"
    fill_in "Description", with: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo."
    fill_in "Min people", with: 40
    fill_in "Max people", with: 60
    fill_in "Default event duration minutes", with: 300
    check "Alcoholic drinks"
    check "Decoration"
    check "Parking service"
    check "Valet"
    check "Exclusive buffet location"
    click_on "Salvar"

    expect(current_path).to eq buffet_path(@buffet)
    expect(page).to have_content "Noite de Mistério"
    expect(page).to have_content "Evento cadastrado com sucesso."
  end
end

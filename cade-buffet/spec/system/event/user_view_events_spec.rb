require "rails_helper"

RSpec.describe "Visualização de Detalhes de Evento", type: :system do
  before do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    @price = Price.create!(base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000)
    @event = Event.create!(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)
  end

  it "Dono visualiza detalhes do evento a partir da tela de detalhes do buffet" do
    login_as @user
    visit buffet_path(@buffet)

    expect(page).to have_content @event.name
    expect(page).to have_content @event.description
    expect(page).to have_content "Min. de Pessoas: #{@event.min_people}"
    expect(page).to have_content "Máx. de Pessoas: #{@event.max_people}"
    expect(page).to have_content "Duração Padrão:"
    expect(page).to have_content "#{@event.default_event_duration_minutes / 60} horas (#{@event.default_event_duration_minutes} minutos)"
    expect(page).to have_content "Duração Padrão:\n#{@event.default_event_duration_minutes / 60} horas (#{@event.default_event_duration_minutes} minutos)"
    expect(page).to have_content "Bebidas Alcoólicas: Sim"
    expect(page).to have_content "Decoração: Sim"
    expect(page).to have_content "Serviço de Estacionamento: Não"
    expect(page).to have_content "Serviço de Valet: Não"
    expect(page).to have_content "Local Exclusivo para Buffet: Sim"
  end
end

# fazer depois
# Cliente visualiza detalhes do evento a partir da tela de detalhes do buffet
# Visitante visualiza detalhes do evento a partir da tela de detalhes do buffet

# Dono visualiza detalhes do evento a partir da tela de detalhes do evento
# Cliente visualiza detalhes do evento a partir da tela de detalhes do evento
# Visitante visualiza detalhes do evento a partir da tela de detalhes do evento

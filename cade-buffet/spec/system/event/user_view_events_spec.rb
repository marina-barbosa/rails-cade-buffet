require "rails_helper"

RSpec.describe "Visualização de Detalhes de Evento", type: :system do
  before do
    @user = User.create!(name: "Hortencia", cpf: "20202020202", email: "hortencia@email.com", password: "123456", owner: true)
    @buffet = Buffet.create!(user: @user, commercial_name: "Buffet Original", legal_name: "Buffet Original Ltda", cnpj: "123456789000124", email: "original@buffet.com", phone: "13 3262 1234", description: "Buffet original com pratos tradicionais.")
    @event = Event.create!(buffet: @buffet, name: "Festa de 15 Anos", min_people: 50, max_people: 100, default_event_duration_minutes: 120, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true)
  end

  it "visualiza detalhes do evento pelo usuário" do
    login_as @user
    visit event_path(@event)

    expect(page).to have_content @event.name
    expect(page).to have_content @event.description
    expect(page).to have_content "Min. de Pessoas: #{@event.min_people}"
    expect(page).to have_content "Máx. de Pessoas: #{@event.max_people}"
    expect(page).to have_content "Duração Padrão: #{@event.default_event_duration_minutes / 60} horas (#{@event.default_event_duration_minutes} minutos)"
    expect(page).to have_content "Bebidas Alcoólicas: Sim"
    expect(page).to have_content "Decoração: Sim"
    expect(page).to have_content "Serviço de Estacionamento: Sim"
    expect(page).to have_content "Serviço de Valet: Sim"
    expect(page).to have_content "Local Exclusivo para Buffet: Sim"
  end
end

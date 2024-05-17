require "rails_helper"

RSpec.describe "Busca de Buffets", type: :system do
  before do
    Address.create!(street: "Rua Paulista", number: "1000", neighborhood: "Bela Vista", city: "São Paulo", state: "SP", zip_code: "01310")
    Address.create!(street: "Avenida Brigadeiro Faria Lima", number: "2000", neighborhood: "Itaim Bibi", city: "São Paulo", state: "SP", zip_code: "01452")
    Address.create!(street: "Rua do Lavradio", number: "71", neighborhood: "Centro", city: "Rio de Janeiro", state: "RJ", zip_code: "20230")

    buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.", address_id: 1)
    user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    buffet = Buffet.create!(commercial_name: "Sabor Celestial", legal_name: "Sabor Celestial Gastronomia e Eventos Ltda.", cnpj: "56789012345678", email: "saborcelestial@example.com", phone: "21987654321", description: "Oferece pratos da cozinha internacional com toques criativos.", address_id: 2)
    user = User.create!(email: "partyplanner@example.com", password: '123456', password_confirmation: '123456', name: "PartyPlannerPro", cpf: "98722232109", owner: true, buffet_id: 2)
    buffet = Buffet.create!(commercial_name: "Festa dos Sabores", legal_name: "Festa dos Sabores Organização de Eventos Ltda.", cnpj: "56555512340008", email: "festadossabores@example.com", phone: "31987654321", description: "Buffet especializado em festas temáticas personalizadas.", address_id: 3)
    user = User.create!(email: "banquetking@example.com", password: '123456', password_confirmation: '123456', name: "BanquetKing", cpf: "98733332109", owner: true, buffet_id: 3)

    event = Event.create!(name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, buffet_id: 2)
  end

  it "permite a um visitante não autenticado buscar buffets pelo nome fantasia" do
    visit root_path

    fill_in "Buscar Buffet:", with: "Delícias da Terra"
    click_on "Buscar"

    expect(page).to have_content "Delícias da Terra"
    expect(page).not_to have_content "Sabor Celestial"
    expect(page).not_to have_content "Festa dos Sabores"
  end
  it "permite a um visitante não autenticado buscar buffets pelo tipo de evento" do
    visit root_path

    fill_in "Buscar Buffet:", with: "Casamento Clássico"
    click_on "Buscar"

    expect(page).to have_content "Sabor Celestial"
    expect(page).not_to have_content "Delícias da Terra"
    expect(page).not_to have_content "Festa dos Sabores"
  end
  it "permite a um visitante não autenticado buscar buffets pela cidade" do
    visit root_path

    fill_in "Buscar Buffet:", with: "Rio de Janeiro"
    click_on "Buscar"

    expect(page).to have_content "Festa dos Sabores"
    expect(page).not_to have_content "Delícias da Terra"
    expect(page).not_to have_content "Sabor Celestial"
  end
end

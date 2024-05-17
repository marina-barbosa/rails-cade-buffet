require "rails_helper"

RSpec.describe "Visualização de Buffets", type: :system do
  before do
    buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    buffet = Buffet.create!(commercial_name: "Sabor Celestial", legal_name: "Sabor Celestial Gastronomia e Eventos Ltda.", cnpj: "56789012345678", email: "saborcelestial@example.com", phone: "21987654321", description: "Oferece pratos da cozinha internacional com toques criativos.")
    user = User.create!(email: "partyplanner@example.com", password: '123456', password_confirmation: '123456', name: "PartyPlannerPro", cpf: "98722232109", owner: true, buffet_id: 2)
    buffet = Buffet.create!(commercial_name: "Festa dos Sabores", legal_name: "Festa dos Sabores Organização de Eventos Ltda.", cnpj: "56555512340008", email: "festadossabores@example.com", phone: "31987654321", description: "Buffet especializado em festas temáticas personalizadas.")
    user = User.create!(email: "banquetking@example.com", password: '123456', password_confirmation: '123456', name: "BanquetKing", cpf: "98733332109", owner: true, buffet_id: 3)
  end

  it "exibe todos os buffets cadastrados para um usuário" do
    visit root_path

    expect(page).to have_content "Delícias da Terra"
    expect(page).to have_content "Sabor Celestial"
    expect(page).to have_content "Festa dos Sabores"
  end
end

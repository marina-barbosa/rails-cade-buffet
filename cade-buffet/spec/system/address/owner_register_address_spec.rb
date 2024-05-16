require "rails_helper"

RSpec.describe "Registro de Endereço do Buffet", type: :system do
  it "registra um novo endereço para o buffet" do
    buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")

    user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)

    login_as user

    visit root_path

    click_on 'Gerenciar Buffet'

    click_on 'Adicionar Endereço'

    fill_in "Street", with: "Rua das Flores"
    fill_in "Number", with: "123"
    fill_in "Neighborhood", with: "Centro"
    fill_in "City", with: "São Paulo"
    fill_in "State", with: "SP"
    fill_in "Zip code", with: "01001"

    click_on "Salvar Endereço"

    expect(page).to have_content "Endereço salvo com sucesso!"
    expect(page).to have_content "Rua: Rua das Flores"
    expect(page).to have_content "Numero: 123"
    expect(page).to have_content "Bairro: Centro"
    expect(page).to have_content "Cidade: São Paulo"
    expect(page).to have_content "Estado: SP"
    expect(page).to have_content "CEP: 01001"
  end
end

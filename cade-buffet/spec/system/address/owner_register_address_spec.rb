require "rails_helper"

RSpec.describe "Registro de Endereço do Buffet", type: :system do
  it "registra um novo endereço para o buffet" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: true)
    buffet = Buffet.create!(commercial_name: "Buffet A", city: "São Paulo", user: user)

    visit new_address_path(buffet_id: buffet.id)

    fill_in "Rua", with: "Rua das Flores"
    fill_in "Número", with: "123"
    fill_in "Bairro", with: "Centro"
    fill_in "Cidade", with: "São Paulo"
    fill_in "Estado", with: "SP"
    fill_in "CEP", with: "01001-000"

    click_on "Salvar Endereço"

    expect(page).to have_content "Endereço salvo com sucesso!"
    expect(page).to have_content "Rua: Rua das Flores"
    expect(page).to have_content "Número: 123"
    expect(page).to have_content "Bairro: Centro"
    expect(page).to have_content "Cidade: São Paulo"
    expect(page).to have_content "Estado: SP"
    expect(page).to have_content "CEP: 01001-000"
  end
end

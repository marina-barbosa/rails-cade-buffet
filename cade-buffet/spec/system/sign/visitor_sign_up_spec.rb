require "rails_helper"

RSpec.describe "Registro de Usuários", type: :system do
  it "cria uma conta de cliente com CPF único e válido" do
    visit new_user_registration_path

    fill_in "Nome", with: "João Silva"
    fill_in "CPF", with: "12345678901"
    fill_in "Email", with: "joao.silva@example.com"
    fill_in "Senha", with: "senha123"
    fill_in "Confirme sua Senha", with: "senha123"
    select "Cliente", from: "Tipo de Usuário"

    click_on "Criar conta"

    expect(page).to have_content "Seu pedido foi enviado com sucesso!"
    expect(page).to have_content "João Silva"
    expect(page).to have_content "joao.silva@example.com"

    expect(page).to have_content "Tipo de Usuário: Cliente"

    expect(User.count).to eq(1)
    expect(User.last.cpf).to eq("12345678901")
  end
end

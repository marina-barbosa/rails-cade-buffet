require "rails_helper"

RSpec.describe "Login de Usuários", type: :system do
  it "autentica um usuário com CPF válido e redireciona para a página inicial" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: false)

    visit new_user_session_path

    fill_in "Email", with: "joao.silva@example.com"
    fill_in "Senha", with: "senha123"

    click_on "Entrar"

    expect(page).to have_content "Seu pedido foi enviado com sucesso!"
    expect(page).to have_content "João Silva"
    expect(page).to have_content "joao.silva@example.com"

    expect(page).to have_content "Cade Buffet"
  end
end

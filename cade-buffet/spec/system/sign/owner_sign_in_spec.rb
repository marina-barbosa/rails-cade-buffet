require "rails_helper"

RSpec.describe "Funcionalidades de Login", type: :system do
  before do
    @user = User.create!(email: "dono@buffet.com", password: "password123", password_confirmation: "password123", owner: true)
  end

  describe "Usuário dono de buffet faz login" do
    it "e é redirecionado para a tela de cadastro de buffet" do
      visit new_user_session_path

      fill_in "Email", with: @user.email
      fill_in "Password", with: "password123"
      click_on "Entrar"

      expect(current_path).to eq new_buffet_path
    end
  end

  describe "Usuário dono de buffet tenta acessar outras rotas" do
    it "é redirecionado para a tela de cadastro de buffet" do
      visit new_user_session_path

      fill_in "Email", with: @user.email
      fill_in "Password", with: "password123"
      click_on "Entrar"

      visit root_path

      expect(current_path).to eq new_buffet_path
    end
  end

  describe "Usuário dono de buffet tenta acessar a rota de sair" do
    it "é permitido" do
      visit new_user_session_path

      fill_in "Email", with: @user.email
      fill_in "Password", with: "password123"
      click_on "Entrar"

      visit destroy_user_session_path

      expect(current_path).to eq root_path
    end
  end

  describe "Login com credenciais inválidas" do
    it "e é mostrada uma mensagem de erro" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Password", with: "senhaerrada"
      click_on "Entrar"

      expect(page).to have_content "Usuário não encontrado ou senha incorreta."
    end

    it "e permanece na página de login" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Password", with: "senhaerrada"
      click_on "Entrar"

      expect(current_path).to eq new_user_session_path
    end
  end
end

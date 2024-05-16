require "rails_helper"

RSpec.describe "Login de usuário Dono de buffet", type: :system do
  before do
    @user = User.create!(email: "dono@buffet.com", password: "password123", password_confirmation: "password123", name: "Dono", cpf: "12300078901", owner: true)
  end

  describe "faz o primeiro login" do
    it "e é redirecionado para a tela de cadastro de buffet" do
      visit new_user_session_path

      fill_in "Email", with: @user.email
      fill_in "Senha", with: "password123"
      within(".actions") do
        click_button("Entrar")
      end

      expect(current_path).to eq new_buffet_path
      expect(page).to have_content "Você precisa cadastrar seu buffet primeiro!"
    end
  end

  describe "sem buffet cadastrado, tenta acessar outras rotas" do
    it "é redirecionado para a tela de cadastro de buffet" do
      login_as @user

      visit root_path

      expect(current_path).to eq new_buffet_path
      expect(page).to have_content "Você precisa cadastrar seu buffet primeiro!"
    end
  end

  describe "Usuário dono de buffet tenta acessar a rota de sair" do
    it "e é permitido" do
      login_as @user

      visit new_buffet_path

      click_button("Sair")

      expect(current_path).to eq root_path
      expect(page).to have_content "Signed out successfully."
    end
  end

  describe "faz login com credenciais inválidas" do
    it "e é mostrada uma mensagem de erro" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Senha", with: "senhaerrada"
      within(".actions") do
        click_button("Entrar")
      end

      expect(page).to have_content "Invalid Email or password."
    end

    it "e permanece na página de login" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Senha", with: "senhaerrada"
      within(".actions") do
        click_button("Entrar")
      end

      expect(current_path).to eq new_user_session_path
    end
  end
end

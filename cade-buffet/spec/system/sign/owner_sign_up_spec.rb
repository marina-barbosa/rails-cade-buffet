require "rails_helper"

RSpec.describe "Registro de usuário", type: :system do
  describe "Usuário registra como dono de um buffet" do
    it "a partir da página de cadastro" do
      visit new_user_registration_path

      expect(page).to have_field("Nome")
      expect(page).to have_field("CPF")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password confirmation")
      expect(page).to have_field("Owner")
    end

    it "e deve ser bem-sucedido" do
      visit new_user_registration_path

      fill_in "Nome", with: "João Silva"
      fill_in "CPF", with: "12345678901"
      fill_in "Email", with: "joao.silva@example.com"
      fill_in "Password", with: "senha123"
      fill_in "Password confirmation", with: "senha123"
      select "Dono", from: "Owner"

      click_on "Criar conta"

      expect(current_path).to eq root_path
      expect(page).to have_content "Usuário cadastrado com sucesso."
    end

    it "com dados incompletos e deve ser inválido" do
      visit new_user_registration_path

      fill_in "Nome", with: ""
      fill_in "CPF", with: ""
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: ""
      select "Dono", from: "Owner"

      click_on "Criar conta"

      expect(current_path).to eq new_user_registration_path
      expect(page).to have_content "Usuário não cadastrado."
      expect(page).to have_content "Nome não pode ficar em branco"
      expect(page).to have_content "CPF não pode ficar em branco"
      expect(page).to have_content "Email não pode ficar em branco"
      expect(page).to have_content "Password não pode ficar em branco"
      expect(page).to have_content "Password confirmation não pode ficar em branco"
    end
  end
end

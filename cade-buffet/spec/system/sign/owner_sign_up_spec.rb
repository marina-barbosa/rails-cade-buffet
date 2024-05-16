require "rails_helper"

RSpec.describe "Registro de usuário dono", type: :system do
  describe "Usuário registra como dono de um buffet" do
    it "a partir da Home" do
      visit root_path
      click_on "Entrar"
      click_on "Criar uma conta"

      expect(current_path).to eq new_user_registration_path
      expect(page).to have_field("Nome")
      expect(page).to have_field("CPF")
      expect(page).to have_field("Email")
      expect(page).to have_field("Senha")
      expect(page).to have_field("Confirme sua Senha")
      expect(page).to have_field("Dono")
      expect(page).to have_button("Criar conta")
    end

    it "e deve ser bem-sucedido" do
      visit new_user_registration_path

      fill_in "Nome", with: "João Silva"
      fill_in "CPF", with: "12345678901"
      fill_in "Email", with: "joao.silva@example.com"
      fill_in "Senha", with: "senha123"
      fill_in "Confirme sua Senha", with: "senha123"
      choose("Dono")

      click_on "Criar conta"

      expect(current_path).to eq new_buffet_path
      expect(page).to have_content "Você precisa cadastrar seu buffet primeiro!"
      expect(page).to have_content 'joao.silva@example.com'
      expect(page).to have_button 'Sair'
      user = User.last
      expect(user.name).to eq 'João Silva'
      # expect(user.cpf).to eq '12345678901'
      expect(user.owner).to eq true
      expect(User.last.cpf).to eq("12345678901")
    end

    it "com dados incompletos e deve ser inválido" do
      visit new_user_registration_path

      fill_in "Nome", with: ""
      fill_in "CPF", with: ""
      fill_in "Email", with: ""
      fill_in("Senha", with: "")
      fill_in "Confirme sua Senha", with: ""
      choose("Dono")

      click_on "Criar conta"

      expect(current_path).to eq user_registration_path
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Name is too short (minimum is 2 characters)"
      expect(page).to have_content "Cpf can't be blank"
      expect(page).to have_content "Cpf deve conter apenas números e ter 11 dígitos"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end
  end
end

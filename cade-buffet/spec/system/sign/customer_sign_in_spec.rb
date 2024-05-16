require 'rails_helper'

describe 'Cliente se autentica' do
  before do
    @user = User.create!(email: "hortency@email.com", password: "password123", password_confirmation: "password123", name: "Hortência", cpf: "10000000001", owner: false)
  end
  it 'com sucesso' do
    # Arrange
    visit root_path
    # Act

    click_on "Entrar"

    fill_in "Email", with: @user.email
    fill_in "Senha", with: "password123"

    within(".actions") do
      click_button("Entrar")
    end

    # Assert
    expect(page).to have_content 'Signed in successfully.'
    within('nav') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'hortency@email.com'
    end
  end

  it 'e faz logout' do
    # Arrange
    login_as @user
    visit root_path
    # Act
    click_button("Sair")
    # Assert
    expect(page).to have_content 'Signed out successfully.'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'hortency@email.com'
  end

  describe "com credenciais inválidas" do
    it "e é mostrada uma mensagem de erro" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Senha", with: "senhaerrada"
      within(".actions") do
        click_button("Entrar")
      end

      expect(page).to have_content "Invalid Email or password."
      expect(page).to have_link 'Entrar'
      expect(page).not_to have_button 'Sair'
    end

    it "e permanece na página de login" do
      visit new_user_session_path

      fill_in "Email", with: "usuario@errado.com"
      fill_in "Senha", with: "senhaerrada"
      within(".actions") do
        click_button("Entrar")
      end

      expect(current_path).to eq new_user_session_path
      expect(page).to have_link 'Entrar'
      expect(page).not_to have_button 'Sair'
    end
  end
end

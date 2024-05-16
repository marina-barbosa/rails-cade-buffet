require 'rails_helper'

describe 'Usuário se cadastra como cliente' do
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
    expect(page).to have_field("Cliente")
    expect(page).to have_button("Criar conta")
  end

  it "com sucesso" do
    visit new_user_registration_path

    fill_in "Nome", with: "João Silva"
    fill_in "CPF", with: "12345678901"
    fill_in "Email", with: "joao.silva@example.com"
    fill_in "Senha", with: "senha123"
    fill_in "Confirme sua Senha", with: "senha123"
    choose("Cliente")

    click_on "Criar conta"

    expect(current_path).to eq root_path
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content 'joao.silva@example.com'
    expect(page).to have_button 'Sair'
    expect(page).not_to have_link 'Entrar'
    expect(page).not_to have_button 'Entrar'
    user = User.last
    expect(user.name).to eq 'João Silva'
    expect(user.cpf).to eq '12345678901'
    expect(user.owner).to eq false
  end

  it "com dados incompletos e deve ser inválido" do
    visit new_user_registration_path

    fill_in "Nome", with: ""
    fill_in "CPF", with: ""
    fill_in "Email", with: ""
    fill_in("Senha", with: "")
    fill_in "Confirme sua Senha", with: ""
    choose("Cliente")

    click_on "Criar conta"

    expect(current_path).to eq user_registration_path
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Name is too short (minimum is 2 characters)"
    expect(page).to have_content "Cpf can't be blank"
    expect(page).to have_content "Cpf deve conter apenas números e ter 11 dígitos"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(User.count).to eq(0)
  end

  it "com CPF não único e inválido" do
    @user = User.create!(email: "hortency@email.com", password: "password123", password_confirmation: "password123", name: "Hortência", cpf: "10000000001", owner: false)

    visit new_user_registration_path
    fill_in "Nome", with: "João Silva"
    fill_in "CPF", with: "10000000001"
    fill_in "Email", with: "joao.silva@example.com"
    fill_in "Senha", with: "senha123"
    fill_in "Confirme sua Senha", with: "senha123"

    click_on "Criar conta"

    expect(page).to have_content "error prohibited this user from being saved"
    expect(User.count).to eq(1)
    expect(User.last.email).to eq("hortency@email.com")
  end
end

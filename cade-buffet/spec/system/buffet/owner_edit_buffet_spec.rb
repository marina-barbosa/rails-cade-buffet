require "rails_helper"

RSpec.describe "Owner edit buffet", type: :system do
  before do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    @visitor = User.create!(email: "isaac@gmail.com", password: '123456', password_confirmation: '123456', name: "Isaac Quincy", cpf: "77788899900", owner: false)
  end

  it "exige autenticação do usuário dono do buffet" do
    logout

    visit edit_buffet_path(@buffet)

    expect(current_path).to eq new_user_session_path
  end

  it "exibe os dados do buffet atualizado" do
    login_as @user
    visit edit_buffet_path(@buffet)

    fill_in "Commercial name", with: "Buffet Atualizado"
    fill_in "Legal name", with: "Buffet Atualizado Ltda"
    fill_in "Cnpj", with: "23456789012345"
    fill_in "Email", with: "atualizacao@buffet.com"
    fill_in "Phone", with: "22 87654-3210"
    fill_in "Description", with: "Buffet atualizado, com novos pratos e serviços."
    click_on "Salvar Buffet"

    expect(current_path).to eq buffet_path(@buffet)
    expect(page).to have_content "Buffet atualizado com sucesso."
    expect(page).to have_content "Buffet Atualizado"
    expect(page).to have_content "23456789012345"
    expect(page).to have_content "atualizacao@buffet.com"
    expect(page).to have_content "22 87654-3210"
    expect(page).to have_content "Buffet atualizado, com novos pratos e serviços."
  end

  it "não permite a edição de buffet por usuários não proprietários" do
    logout
    login_as @visitor
    visit edit_buffet_path(@buffet)

    expect(page).to have_content "Você não tem permissão para editar este buffet."
  end
end

require "rails_helper"

RSpec.describe "Owner edit buffet", type: :system do
  before do
    @user = User.create!(name: "Hortencia", cpf: "20202020202", email: "hortencia@email.com", password: "123456", owner: true)
    @buffet = Buffet.create!(user: @user, commercial_name: "Buffet Original", legal_name: "Buffet Original Ltda", cnpj: "123456789000124", email: "original@buffet.com", phone: "13 3262 1234", description: "Buffet original com pratos tradicionais.")
  end

  it "exige autenticação do usuário dono do buffet" do
    logout
    visit edit_buffet_path(@buffet)

    expect(page).to have_content "Você precisa estar logado para editar este buffet."
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
    expect(page).to have_content "Buffet Atualizado Ltda"
    expect(page).to have_content "23456789012345"
    expect(page).to have_content "atualizacao@buffet.com"
    expect(page).to have_content "22 87654-3210"
    expect(page).to have_content "Buffet atualizado, com novos pratos e serviços."
  end

  it "não permite a edição de buffet por usuários não proprietários" do
    logout
    login_as create(:user, owner: false)
    visit edit_buffet_path(@buffet)

    expect(page).to have_content "Você não tem permissão para editar este buffet."
  end
end

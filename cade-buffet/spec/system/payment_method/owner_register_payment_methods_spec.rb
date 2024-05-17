require "rails_helper"

RSpec.describe "Registro de Métodos de Pagamento do Buffet", type: :system do
  before do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
  end

  it "registra novos métodos de pagamento para o buffet" do
    login_as @user

    visit new_payment_method_path(buffet_id: @buffet.id)

    check "Credit card"
    check "Debit card"
    check "Pix"
    uncheck "Ticket payment"

    click_on "Salvar"

    expect(page).to have_content "Métodos de pagamento salvos com sucesso!"
    expect(page).to have_content "Credit Card: Sim"
    expect(page).to have_content "Debit Card: Sim"
    expect(page).to have_content "PIX: Sim"
    expect(page).to have_content "Ticket Payment: Não"
  end
end

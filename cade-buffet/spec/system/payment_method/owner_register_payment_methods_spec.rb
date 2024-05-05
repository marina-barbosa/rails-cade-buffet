require "rails_helper"

RSpec.describe "Registro de Métodos de Pagamento do Buffet", type: :system do
  it "registra novos métodos de pagamento para o buffet" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: true)
    buffet = Buffet.create!(commercial_name: "Buffet A", city: "São Paulo", user: user)

    visit new_payment_method_path(buffet_id: buffet.id)

    check "credit_card"
    check "debit_card"
    check "pix"
    check "ticket_payment"

    click_on "Salvar"

    expect(page).to have_content "Métodos de pagamento salvos com sucesso!"
    expect(page).to have_content "Credit Card: Sim"
    expect(page).to have_content "Debit Card: Sim"
    expect(page).to have_content "PIX: Sim"
    expect(page).to have_content "Ticket Payment: Sim"
  end
end

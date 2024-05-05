require "rails_helper"

RSpec.describe "Confirmação de Pedidos pelos Clientes", type: :system do
  it "confirma um pedido quando a data atual é anterior à data-limite" do
    user = User.create!(name: "Maria Oliveira", cpf: "98765432109", email: "maria.oliveira@example.com", password: "senha123", password_confirmation: "senha123")
    order = Order.create!(user: user, buffet: Buffet.first, event: Event.first, date: Date.today, guest_count: 20, more_details: "Requerem cadeiras", status: "order_confirmed")

    allow(Time).to receive(:now).and_return(Date.today - 1.day)

    visit root_path

    click_on "Meus Pedidos"

    expect(page).to have_content order.code
    expect(page).to have_content "Aguardando confirmação"

    expect(page).to have_content "Data-limite para confirmação: #{Date.today + 1.day}"

    click_on order.code

    expect(page).to have_content "Aprovando Pedido"

    fill_in "Forma de Pagamento", with: "Credit Card"

    click_on "Confirmar Pedido"

    expect(page).to have_content "Pedido confirmado com sucesso!"
  end
end

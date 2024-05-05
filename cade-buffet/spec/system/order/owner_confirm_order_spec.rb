require "rails_helper"

RSpec.describe "Avaliação e Confirmação de Pedidos", type: :system do
  it "avalia e confirma um pedido, e notifica caso exista outro pedido para o mesmo dia" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: true)
    buffet = Buffet.create!(commercial_name: "Buffet A", city: "São Paulo")

    event = Event.create!(buffet: buffet, name: "Aniversário", description: "Aniversário de 30 anos", exclusive_buffet_location: true)

    order = Order.create!(buffet: buffet, event: event, date: Date.today, guest_count: 50, more_details: "Requerem mesas longas", status: "awaiting_buffet_evaluation")

    visit order_index_path

    expect(page).to have_content("Aguardando avaliação")
    expect(page).to have_content(order.code)

    visit edit_order_path(order)

    expect(page).to have_content("Aprovando Pedido")
    expect(page).to have_content(order.code)

    click_on "Aprovar"

    expect(page).to have_content("Pedido confirmado com sucesso!")

    visit order_index_path
    expect(page).not_to have_content("Aguardando avaliação")
    expect(page).to have_content(order.code)

    another_order = Order.create!(buffet: buffet, event: event, date: Date.today, guest_count: 100, more_details: "Requerem cadeiras", status: "awaiting_buffet_evaluation")

    visit order_index_path

    expect(page).to have_content("Atenção Existem outros pedidos para esse mesmo dia.")
  end

  it "aprova um pedido com valor final, data de validade, descrição e meio de pagamento" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: true)
    buffet = Buffet.create!(commercial_name: "Buffet A", city: "São Paulo")

    event = Event.create!(buffet: buffet, name: "Aniversário", description: "Aniversário de 30 anos", exclusive_buffet_location: true)

    order = Order.create!(buffet: buffet, event: event, date: Date.today, guest_count: 50, more_details: "Requerem mesas longas", status: "awaiting_buffet_evaluation")

    visit edit_order_path(order)

    fill_in "Valor Final", with: "500.00"
    fill_in "Data de Validade", with: "2024-05-04 22:30"
    fill_in "Descrição", with: "Taxa extra por serviço especial"
    select "Credit Card", from: "Meio de Pagamento"

    click_on "Aprovar"

    expect(page).to have_content("Pedido aprovado com sucesso!")
    expect(page).to have_content("Finalizada - Finalizada em: 04 de Maio, 22:30")
    expect(page).to have_content("Valor Final: R$ 500,00")
    expect(page).to have_content("Data de Validade: 04 de Maio, 22:30")
    expect(page).to have_content("Descrição: Taxa extra por serviço especial")
    expect(page).to have_content("Meio de Pagamento: Credit Card")
  end
end

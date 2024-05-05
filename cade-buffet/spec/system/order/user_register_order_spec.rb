require "rails_helper"

RSpec.describe "Cadastro de Pedidos", type: :system do
  it "cria um pedido com todos os campos necessários e gera um código alfanumérico" do
    user = User.create!(name: "João Silva", cpf: "12345678901", email: "joao.silva@example.com", password: "senha123", password_confirmation: "senha123", owner: false)
    buffet = Buffet.create!(commercial_name: "Buffet A", city: "São Paulo")

    event = Event.create!(buffet: buffet, name: "Aniversário", description: "Aniversário de 30 anos", exclusive_buffet_location: true)

    visit new_order_path(buffet_id: buffet.id, event_id: event.id)

    fill_in "Data do Evento", with: "2024-06-15"
    fill_in "Quantidade de Convidados", with: "50"
    fill_in "Detalhes Adicionais", with: "Requerem mesas longas"
    fill_in "Endereço", with: "Rua das Flores, 123" if event.exclusive_buffet_location

    click_on "Concluir"

    expect(page).to have_content "Pedido criado com sucesso!"
    expect(page).to have_content "Código do Pedido: #{Order.last.code}"

    expect(Order.last.date).to eq(Date.parse("2024-06-15"))
    expect(Order.last.guest_count).to eq(50)
    expect(Order.last.more_details).to eq("Requerem mesas longas")
    expect(Order.last.event_exclusive_address).to eq(true)
    expect(Order.last.address).to eq("Rua das Flores, 123") if event.exclusive_buffet_location

    visit orders_path(user)
    expect(page).to have_content "Meus Pedidos"
    expect(page).to have_content Order.last.code
  end
end

require 'rails_helper'

describe 'Usuario visita tela de detalhes de Buffets' do
  before do
    Address.create!(street: "Rua Paulista", number: "1000", neighborhood: "Bela Vista", city: "São Paulo", state: "SP", zip_code: "01310")

    PaymentMethod.create!(credit_card: true, debit_card: true, pix: true, ticket_payment: false)

    Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.", address_id: 1, payment_methods_id: 1)

    User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)

    Event.create!(name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, buffet_id: 1)
  end
  it 'clica em ver detalhes e vê detalhes do buffet' do
    # Arrange
    # Act
    visit buffet_index_path
    click_on('Delícias da Terra')
    # Assert
    expect(page).to have_content('Delícias da Terra')
    expect(page).to have_content('12345678901234')
    expect(page).to have_content('deliciasdaterra@example.com')
    expect(page).to have_content('11987654321')
    expect(page).to have_content('Especializado em culinária regional brasileira.')

    expect(page).to have_content('Rua Paulista')
    expect(page).to have_content('1000')
    expect(page).to have_content('Bela Vista')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('SP')
    expect(page).to have_content('01310')

    expect(page).to have_content('Metodos de Pagamento')
    expect(page).to have_content('Credit Card')
    expect(page).to have_content('Debit Card')

    expect(page).to have_content('Casamento Clássico')
    expect(page).to have_content('Um casamento tradicional com buffet completo e decoração elegante.')
  end
end

require 'rails_helper'

describe 'Usuario visita tela de detalhes de Buffets' do 
    it 'clica em ver detalhes e vê detalhes do buffet' do
        # Arrange
        address1 = Address.create!(
                 street: "Rua XV de Novembro",
                 number: "12",
                 neighborhood: "Centro",
                 city: "Campo Grande",
                 state: "MS",
                 zip_code: "11005-000"
                )
        address2 = Address.create!(
                 street: "Rua 15 de Novembro",
                 number: "13",
                 neighborhood: "Centro",
                 city: "Santos",
                 state: "SP",
                 zip_code: "11000-000"
                )
        payments1 = PaymentMethod.create!(
            credit_card: true,
            debit_card: true,
            pix: true,
            ticket_payment: true
                )
        payments2 = PaymentMethod.create!(
            credit_card: true,
            debit_card: true,
            pix: false,
            ticket_payment: false
                )
        buffet1 = Buffet.create!(
            commercial_name: "Buffet do Gonzaga",
            legal_name: "Buffet do Gonzaga Ltda.",
            cnpj: "123456789000124",
            email: "contato@buffetgonzaga.com.br",
            phone: "(13) 3262-1234",
            description: "Buffet tradicional com vista para o mar.",
            address_id: 1,
            payment_methods_id: 1
            )
        buffet2 = Buffet.create!(
            commercial_name: "Buffet Sabores",
            legal_name: "Buffet Delícias Ltda.",
            cnpj: "123456789000000",
            email: "contato@buffetdelicias.com.br",
            phone: "(13) 3222-1111",
            description: "Buffet especializado em festas infantis.",
            address: address2,
            payment_methods_id: 2
            )
        # Act
        visit buffet_index_path
        click_on('Buffet Sabores')
        # Assert
        expect(page).to have_content('Buffet Sabores')
        expect(page).to have_content('123456789000000')
        expect(page).to have_content('contato@buffetdelicias.com.br')
        expect(page).to have_content('(13) 3222-1111')
        expect(page).to have_content('Buffet especializado em festas infantis.')

        expect(page).to have_content('Rua 15 de Novembro')
        expect(page).to have_content('13')
        expect(page).to have_content('Centro')
        expect(page).to have_content('Santos')
        expect(page).to have_content('SP')
        expect(page).to have_content('11000-000')
        
        expect(page).to have_content('Credit Card')
        expect(page).to have_content('Debit Card')
    end

    # it '' do
    #     # Arrange
    #         # cadastrar buffet
    #     # Act
    #     visit('')
    #     # Assert
    #     expect(page).to have_content()
    # end
end
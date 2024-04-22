require 'rails_helper'

describe 'Usuario visita tela de Buffets' do
    it 'e vê os buffets cadastrados' do
        # Arrange
        address1 = Address.create!(
                 street: "Rua XV de Novembro",
                 number: "12",
                 neighborhood: "Centro",
                 city: "Santos",
                 state: "SP",
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
        # Assert
        expect(page).to have_content(buffet1.commercial_name)
        expect(page).to have_content(buffet2.commercial_name)
    end

    it 'clica em ver detalhes e vê detalhes do buffet' do
        # Arrange
        address1 = Address.create!(
                 street: "Rua XV de Novembro",
                 number: "12",
                 neighborhood: "Centro",
                 city: "Santos",
                 state: "SP",
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
        expect(page).to have_content('Buffet especializado em festas infantis.')
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
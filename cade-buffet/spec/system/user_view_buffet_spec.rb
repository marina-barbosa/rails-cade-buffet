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
        buffet1 = Buffet.create!(
            commercial_name: "Buffet do Gonzaga",
            legal_name: "Buffet do Gonzaga Ltda.",
            cnpj: "123456789000124",
            email: "contato@buffetgonzaga.com.br",
            phone: "(13) 3262-1234",
            description: "Buffet tradicional com vista para o mar.",
            address_id: 1
            )
        buffet2 = Buffet.create!(
            commercial_name: "Buffet Sabores",
            legal_name: "Buffet Delícias Ltda.",
            cnpj: "123456789000000",
            email: "contato@buffetdelicias.com.br",
            phone: "(13) 3222-1111",
            description: "Buffet especializado em festas infantis.",
            address: address2
            )
        # Act
        visit buffets_path
        # Assert
        expect(page).to have_content(buffet1.commercial_name)
        expect(page).to have_content(buffet2.commercial_name)
    end

    # it ', clica em ver detalhes e vê detalhes do buffet' do
    #     # Arrange
    #         # cadastrar 2 buffet
    #     # Act
    #     visit('/buffet')
    #     # Assert
    #         # garantir que vejo na tela 2 buffets
    #     expect(page).to gave_content()
    # end

    # it '' do
    #     # Arrange
    #         # cadastrar 2 buffet
    #     # Act
    #     visit('/buffet')
    #     # Assert
    #     expect(page).to gave_content()
    # end
end
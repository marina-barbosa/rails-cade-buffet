require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        # Arrange
        User.create!(email: 'flores@email.com', password: '123456')
        # Act
        visit root_path
        click_on 'Login'
        within('form') do
            fill_in 'Email', with: 'flores@email.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end
        # Assert
        expect(page).not_to have_link 'Entrar'
        expect(page).to have_link 'Sair'
        within('nav') do
            expect(page).to have_content 'flores@email.com'
        end
    end
end
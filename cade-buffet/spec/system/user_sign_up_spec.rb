require 'rails_helper'

describe 'Usuário se cadastra' do
    it 'com sucesso' do 
        # Arrange
        # Act
        visit root_path
        click_on 'Login'
        click_on 'Criar uma conta'
        fill_in 'Email', with: 'dob@email.com'
        fill_in 'Senha', with: '123456'
        fill_in 'Confirme sua Senha', with: '123456'
        click_on 'Criar conta'
        # Assert
        expect(page).to have_content 'dob@email.com'
        expect(page).to have_button 'Sair'
        expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
end
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
        expect(page).to have_content 'Signed in successfully.'
        within('nav') do
            expect(page).not_to have_link 'Login'
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'flores@email.com'
        end
    end

    it 'e faz logout' do
        # Arrange
        User.create!(email: 'flores@email.com', password: '123456')
        # Act
        visit root_path
        click_on 'Login'
        within('form') do
            fill_in 'Email', with: 'flores@email.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
            click_on 'Sair'
        end
        # Assert
        expect(page).to have_content 'Signed out successfully.'
        expect(page).to have_link 'Login'
        expect(page).not_to have_button 'Sair'
        expect(page).not_to have_content 'flores@email.com'
    end
end
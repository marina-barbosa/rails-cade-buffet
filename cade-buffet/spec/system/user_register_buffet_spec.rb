require 'rails_helper'

describe 'Usuário cadastrar buffet' do
  it 'partindo da home' do
    user = User.create!(
      name: 'bob', cpf: '20202020202',
      email: 'bob@email.com', password: '123456', owner: true, 
      buffet_id: nil
    )

    login_as user
    visit root_path

    expect(current_path).to eq new_buffet_path
    expect(page).to have_content 'Cadastrar Novo Buffet'
    expect(page).to have_field 'Commercial name'
    expect(page).to have_field 'Legal name'
    expect(page).to have_field 'Cnpj'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Phone'
    expect(page).to have_field 'Description'
  end

  it 'com sucesso quando utiliza dados válidos' do
    user = User.create!(
      name: 'Hortencia', cpf: '20202020202',
      email: 'hortencia@email.com', password: '123456', owner: true, 
      buffet_id: nil
    )

    login_as(user)
    visit root_path

    fill_in 'Commercial name', with: 'Buffet Royal'
    fill_in 'Legal name', with: 'Buffet Royal Ltda'
    fill_in 'Cnpj', with: '123456789000124'
    fill_in 'Email', with: 'contato@buffetroyal.com.br'
    fill_in 'Phone', with: '13 3262 1234'
    fill_in 'Description', with: 'Buffet tradicional com vista para o mar.'
    click_on 'Salvar Buffet'

    expect(current_path).to eq buffet_index_path
    expect(page).to have_content Buffet.last.id
    expect(page).to have_content Buffet.last.commercial_name
  end

#   it 'sem sucesso quando utiliza dados inválidos' do    
#   end
end
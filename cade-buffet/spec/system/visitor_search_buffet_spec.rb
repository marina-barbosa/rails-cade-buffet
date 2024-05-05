require "rails_helper"

RSpec.describe "Busca de Buffets", type: :system do
  it "permite a um visitante não autenticado buscar buffets pelo nome fantasia, cidade ou tipos de festas" do
    visit root_path

    Buffet.create!(commercial_name: "Buffet A", city: "São Paulo", types_of_events: ["Casamento", "Aniversário"])
    Buffet.create!(commercial_name: "Buffet B", city: "Rio de Janeiro", types_of_events: ["Batizado", "Formatura"])
    Buffet.create!(commercial_name: "Buffet C", city: "Belo Horizonte", types_of_events: ["Casamento", "Aniversário"])

    fill_in "Pesquisar Buffet:", with: "Buffet A"
    click_on "Buscar"

    expect(page).to have_content "Buffet A"
    expect(page).not_to have_content "Buffet B"
    expect(page).not_to have_content "Buffet C"

    fill_in "Pesquisar Buffet:", with: "São Paulo"
    click_on "Buscar"

    expect(page).to have_content "Buffet A"
    expect(page).not_to have_content "Buffet B"
    expect(page).not_to have_content "Buffet C"

    fill_in "Pesquisar Buffet:", with: "Casamento"
    click_on "Buscar"

    expect(page).to have_content "Buffet A"
    expect(page).not_to have_content "Buffet B"
    expect(page).not_to have_content "Buffet C"
  end
end

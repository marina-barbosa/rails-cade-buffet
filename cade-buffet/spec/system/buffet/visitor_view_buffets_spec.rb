require "rails_helper"

RSpec.describe "Visualização de Buffets", type: :system do
  it "exibe todos os buffets cadastrados para um visitante não autenticado" do
    visit root_path

    Buffet.create!(commercial_name: "Buffet A", city: "São Paulo", state: "SP")
    Buffet.create!(commercial_name: "Buffet B", city: "Rio de Janeiro", state: "RJ")
    Buffet.create!(commercial_name: "Buffet C", city: "Belo Horizonte", state: "MG")

    expect(page).to have_content "Buffet A - São Paulo, SP"
    expect(page).to have_content "Buffet B - Rio de Janeiro, RJ"
    expect(page).to have_content "Buffet C - Belo Horizonte, MG"

    visit buffet_path(Buffet.first)
    expect(page).to have_content "Buffet A"
    expect(page).not_to have_content "Legal Name"
  end
end

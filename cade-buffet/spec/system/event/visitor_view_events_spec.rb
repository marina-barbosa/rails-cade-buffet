require "rails_helper"

RSpec.describe "Visualização de Tipos de Festas em Buffets", type: :system do
  it "exibe todos os tipos de festas disponíveis para um buffet" do
    visit root_path

    Buffet.create!(commercial_name: "Buffet A", city: "São Paulo", types_of_events: ["Casamento", "Aniversário"])
    Buffet.create!(commercial_name: "Buffet B", city: "Rio de Janeiro", types_of_events: ["Batizado", "Formatura"])
    Buffet.create!(commercial_name: "Buffet C", city: "Belo Horizonte", types_of_events: ["Casamento", "Aniversário"])

    visit buffet_path(Buffet.first)

    expect(page).to have_content "Casamento"
    expect(page).to have_content "Aniversário"
    expect(page).not_to have_content "Batizado"
    expect(page).not_to have_content "Formatura"

    within("div[data-event-id='#{Buffet.first.events.first.id}']") do
      expect(page).to have_content "Preço Base: #{Price.find(Buffet.first.events.first.price_id).base_price_weekdays}"
      expect(page).to have_content "Taxa Adicional por Pessoa: #{Price.find(Buffet.first.events.first.price_id).additional_person_price_weekdays}"
      expect(page).to have_content "Hora Extra: #{Price.find(Buffet.first.events.first.price_id).extra_event_hour_price_weekdays}"
    end
  end
end

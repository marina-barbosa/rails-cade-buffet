require "rails_helper"

describe "Cadastra novos preços para um evento", type: :system do
  before do
    @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    @user = User.create!(email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1)
    event = Event.new(name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1)
  end

  it "com sucesso" do
    login_as @user
    visit new_price_path

    fill_in "Base price weekdays", with: 10000
    fill_in "Additional person price weekdays", with: 250
    fill_in "Extra event hour price weekdays", with: 1000
    fill_in "Base price weekend", with: 14000
    fill_in "Additional person price weekend", with: 300
    fill_in "Extra event hour price weekend", with: 1500
    click_on "Salvar"

    expect(current_path).to eq buffet_path(@buffet)
    expect(page).to have_content "Preços cadastrados com sucesso."
  end

  # it "sem sucesso/ dados invalidos/ preço negativo" do
  # end

  # it "e atualiza os preços" do
  # end
end

require "rails_helper"

RSpec.describe "Buffet API", type: :request do
  describe "GET /api/v1/buffet" do
    it "retorna uma lista de buffets" do
      # Arrange
      buffet1 = Buffet.create!(
        commercial_name: "Sabor do Oriente",
        legal_name: "Sabor do Oriente Gastronomia e Eventos Ltda",
        cnpj: "12345678901234",
        email: "contato@sabordooriente.com",
        phone: "(00) 1234-5678",
        description: "O Sabor do Oriente traz o melhor da culinária árabe.",
      )
      buffet2 = Buffet.create!(
        commercial_name: "La Dolce Vita",
        legal_name: "La Dolce Vita Gastronomia Italiana S/A",
        cnpj: "98765432109876",
        email: "contato@ladolcevita.com",
        phone: "(00) 9876-5432",
        description: "La Dolce Vita oferece autêntica comida italiana para todos os paladares.",
      )

      # Act
      get "/api/v1/buffet"

      # Assert
      expect(response).to have_http_status(200)
      expect(response.body).to include('Sabor do Oriente')
      expect(response.body).to include('La Dolce Vita')
      expect(response.content_type).to include("application/json")

      buffets = JSON.parse(response.body)
      expect(buffets.size).to eq(2)

      expect(buffets[0]["commercial_name"]).to eq("Sabor do Oriente")
      expect(buffets[0]["legal_name"]).to eq("Sabor do Oriente Gastronomia e Eventos Ltda")
      expect(buffets[0]["description"]).to eq("O Sabor do Oriente traz o melhor da culinária árabe.")

      expect(buffets[1]["commercial_name"]).to eq("La Dolce Vita")
      expect(buffets[1]["legal_name"]).to eq("La Dolce Vita Gastronomia Italiana S/A")
      expect(buffets[1]["description"]).to eq("La Dolce Vita oferece autêntica comida italiana para todos os paladares.")
    end

    it "retorna buffets filtrados por nome" do
      # Arrange
      buffet1 = Buffet.create!(
        commercial_name: "Sabor do Oriente",
        legal_name: "Sabor do Oriente Gastronomia e Eventos Ltda",
        cnpj: "12345678901234",
        email: "contato@sabordooriente.com",
        phone: "(00) 1234-5678",
        description: "O Sabor do Oriente traz o melhor da culinária árabe.",
      )
      buffet2 = Buffet.create!(
        commercial_name: "La Dolce Vita",
        legal_name: "La Dolce Vita Gastronomia Italiana S/A",
        cnpj: "98765432109876",
        email: "contato@ladolcevita.com",
        phone: "(00) 9876-5432",
        description: "La Dolce Vita oferece autêntica comida italiana para todos os paladares.",
      )

      # Act
      get "/api/v1/buffet", params: { commercial_name: "Sabor do Oriente" }

      # Assert
      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")

      buffets = JSON.parse(response.body)
      expect(buffets.size).to eq(1)

      expect(buffets[0]["commercial_name"]).to eq("Sabor do Oriente")
      expect(buffets[0]["legal_name"]).to eq("Sabor do Oriente Gastronomia e Eventos Ltda")
      expect(buffets[0]["description"]).to eq("O Sabor do Oriente traz o melhor da culinária árabe.")
    end
  end
end

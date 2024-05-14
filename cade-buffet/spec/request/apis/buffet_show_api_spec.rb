require "rails_helper"

RSpec.describe "Buffet API", type: :request do
  describe "GET /api/v1/buffet/:id" do
    # Arrange
    before(:each) do
      Buffet.delete_all
      buffet1 = Buffet.create!(
        commercial_name: "Sabor do Oriente",
        legal_name: "Sabor do Oriente Gastronomia e Eventos Ltda",
        cnpj: "12345678901234",
        email: "contato@sabordooriente.com",
        phone: "(00) 1234-5678",
        description: "O Sabor do Oriente traz o melhor da culinária árabe.",
      )
    end

    it "retorna detalhes de um buffet específico sem CNPJ e razão social" do
      # Act
      get "/api/v1/buffet/#{buffet1.id}"

      # Assert
      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")

      buffet_response = JSON.parse(response.body)
      expect(buffet_response["commercial_name"]).to eq("Sabor do Oriente")

      expect(buffet_response).not_to have_key("cnpj")
      expect(buffet_response).not_to have_key("legal_name")
    end
  end
end

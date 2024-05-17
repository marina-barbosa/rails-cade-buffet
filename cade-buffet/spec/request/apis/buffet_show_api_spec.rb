require "rails_helper"

RSpec.describe "Buffet API", type: :request do
  describe "GET /api/v1/buffet/:id" do
    # Arrange
    before do
      @buffet = Buffet.create!(commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.")
    end

    it "retorna detalhes de um buffet específico sem CNPJ e razão social" do
      # Act
      get "/api/v1/buffet/#{@buffet.id}"

      # Assert
      expect(response).to have_http_status(200)
      expect(response.content_type).to include("application/json")

      buffet_response = JSON.parse(response.body)
      expect(buffet_response["commercial_name"]).to eq("Delícias da Terra")

      expect(buffet_response).not_to have_key("cnpj")
      expect(buffet_response).not_to have_key("legal_name")
    end
  end
end

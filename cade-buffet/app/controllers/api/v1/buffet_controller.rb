class Api::V1::BuffetController < ActionController::API
  def index
    commercial_name = params[:commercial_name]
    if commercial_name.present?
      buffets = Buffet.where(commercial_name: commercial_name)
    else
      buffets = Buffet.all
    end
    render status: 200, json: buffets
  end

  def show
    buffet = Buffet.find(params[:id])
    render status: 200, json: buffet.attributes.except('cnpj', 'legal_name')
  end
end

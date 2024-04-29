class AddressController < ApplicationController
  def index
    @addresses = Address.all
    "address/index"
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(
      street: params[:address][:street],
      number: params[:address][:number],
      neighborhood: params[:address][:neighborhood],
      state: params[:address][:state],
      city: params[:address][:city],
      zip_code: params[:address][:zip_code],
    )
    if @address.save!
      buffet_id = current_user.buffet_id
      buffet = Buffet.find(buffet_id)
      buffet.update(address_id: @address.id)
      return redirect_to buffet_path(buffet_id)
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :new
  end

  def edit
    # buffet_id = current_user.buffet_id
    # buffet = Buffet.find(buffet_id)
    # address_id = buffet.address_id
    # @address = Address.find(address_id)
    @address = Address.find(params[:id])
  end

  def update
    # buffet_id = current_user.buffet_id
    # buffet = Buffet.find(buffet_id)
    # address_id = buffet.address_id
    # @address = Address.find(address_id)
    @address = Address.find(params[:id])
    puts @address.id
    puts @address.id
    puts @address.id
    puts @address.id
    if @address.update(
      street: params[:address][:street],
      number: params[:address][:number],
      neighborhood: params[:address][:neighborhood],
      state: params[:address][:state],
      city: params[:address][:city],
      zip_code: params[:address][:zip_code],
    )
      buffet_id = current_user.buffet_id
      return redirect_to buffet_path(buffet_id)
    end
    Rails.logger.error("Erro de validação: #{e.message}")
    render :edit
  end
end

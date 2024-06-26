class BuffetController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @buffets = Buffet.all

    "buffet/index"
  end

  def show
    @buffet = Buffet.find(params[:id])

    @events = Event.where(buffet_id: @buffet.id)

    @address = Address.find(@buffet.address_id) unless @buffet.address_id.nil?

    @payments = PaymentMethod.find(@buffet.payment_methods_id) unless @buffet.payment_methods_id.nil?
  end

  def new
    @buffet = Buffet.new
  end

  def create
    @buffet = Buffet.new(
      commercial_name: params[:buffet][:commercial_name],
      legal_name: params[:buffet][:legal_name],
      cnpj: params[:buffet][:cnpj],
      email: params[:buffet][:email],
      phone: params[:buffet][:phone],
      description: params[:buffet][:description],
      address_id: params[:buffet][:address_id].presence || nil,
      payment_methods_id: params[:buffet][:payment_methods_id].presence || nil,
    )

    if @buffet.save!
      current_user.update(buffet_id: @buffet.id)

      return redirect_to buffet_index_path
    end

    Rails.logger.error("Erro de validação: #{e.message}")

    render :new
  end

  def edit
    @buffet = Buffet.find(params[:id])

    if current_user.buffet_id != @buffet.id
      return redirect_to buffet_path(@buffet), notice: "Você não tem permissão para editar este buffet."
    end
  end

  def update
    @buffet = Buffet.find(params[:id])

    if current_user.buffet_id != @buffet.id
      return redirect_to buffet_path(@buffet), notice: "Você não tem permissão para editar este buffet."
    end

    if @buffet.update(
      commercial_name: params[:buffet][:commercial_name],
      legal_name: params[:buffet][:legal_name],
      cnpj: params[:buffet][:cnpj],
      email: params[:buffet][:email],
      phone: params[:buffet][:phone],
      description: params[:buffet][:description],

    )
      return redirect_to buffet_path(@buffet), notice: "Buffet atualizado com sucesso."
    end

    Rails.logger.error("Erro de validação: #{e.message}")

    render :edit
  end
end

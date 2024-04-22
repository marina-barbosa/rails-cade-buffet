class BuffetController < ApplicationController
    def index
        @buffets = Buffet.all
        'buffet/index'
    end

    def show
        @buffet = Buffet.find(params[:id])
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
            address_id: params[:buffet][:address_id],
            payment_methods_id: params[:buffet][:payment_method_id]
            )
        if @buffet.save
            return  redirect_to buffet_path
        end
        render :new
    end

    def edit
        @buffet = Buffet.find(params[:id])
    end
    def update
        @buffet = Buffet.find(params[:id])
        if @buffet.update(
            commercial_name: params[:buffet][:commercial_name],
            legal_name: params[:buffet][:legal_name],
            cnpj: params[:buffet][:cnpj],
            email: params[:buffet][:email],
            phone: params[:buffet][:phone],
            description: params[:buffet][:description],
            address_id: params[:buffet][:address_id],
            payment_methods_id: params[:buffet][:payment_method_id]
            )
        return  redirect_to buffet_path
        end
        render :edit 
    end
end
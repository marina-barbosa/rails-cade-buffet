class PaymentMethodController < ApplicationController
    def index
        @payment_methods = PaymentMethod.all
        'payment_methods/index'
    end

    def show
        @payment_method = PaymentMethod.find(params[:id])
    end

    def new
        @payment_method = PaymentMethod.new
    end
    def create
        @payment_method = PaymentMethod.new(
            credit_card: params[:payment_method][:credit_card],
            debit_card: params[:payment_method][:debit_card],
            pix: params[:payment_method][:pix],
            ticket_payment: params[:payment_method][:ticket_payment]          
            )
        if @payment_method.save!
            buffet_id = current_user.buffet_id
            buffet = Buffet.find(buffet_id)
            buffet.update(payment_methods_id: @payment_method.id)
            return  redirect_to buffet_path(buffet_id)
        end
        Rails.logger.error("Erro de validação: #{e.message}")
        render :new
    end

    def edit
        @payment_method = PaymentMethod.find(params[:id])
    end
    def update
        @payment_method = PaymentMethod.find(params[:id])
        if @payment_method.update(
            credit_card: params[:payment_method][:credit_card],
            debit_card: params[:payment_method][:debit_card],
            pix: params[:payment_method][:pix],
            ticket_payment: params[:payment_method][:ticket_payment]   
            )
            buffet_id = current_user.buffet_id            
            return  redirect_to buffet_path(buffet_id)
        end
        Rails.logger.error("Erro de validação: #{e.message}")
        render :edit 
    end
end
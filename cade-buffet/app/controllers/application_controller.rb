class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :owner])
  end

  def check_user_owner_has_buffet
    if current_user.owner == true && current_user.buffet_id == nil
      redirect_to new_buffet_path, notice: 'Você precisa cadastrar seu buffet primeiro!'
    end
  end


end

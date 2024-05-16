class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_owner_needs_redirect, if: :user_signed_in?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :owner])
  end

  def check_user_owner_needs_redirect
    if current_user.owner? &&
       current_user.buffet_id.nil? &&
       request.path != destroy_user_session_path &&
       request.path != new_buffet_path &&
       request.path != create_buffet_path
      redirect_to new_buffet_path, notice: 'Você precisa cadastrar seu buffet primeiro!'
    end
  end
end

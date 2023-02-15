class ApplicationController < ActionController::Base
  before_action :user_params, if: :devise_controller?

  protected

  def user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end

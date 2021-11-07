class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_FURIMA_USER"] && password == ENV["BASIC_FURIMA_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :last_name, :first_name, :last_rename, :first_rename, :birthday])
  end

end

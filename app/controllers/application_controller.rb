class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!, except: [:index ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'bata' && password == '1211'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :kfirst_name, :klast_name, :birthday])
  end
end

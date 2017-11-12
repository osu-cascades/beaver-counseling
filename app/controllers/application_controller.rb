class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def devise_parameter_sanitizer
    if resource_class == Users
      Users::ParameterSanitizer.new(Users, :users, params)
    else
      super # Use the default one
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
end

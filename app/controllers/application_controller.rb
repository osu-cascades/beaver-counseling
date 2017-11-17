class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    if current_user.role == 1
      pages_adminhome_path
    elsif current_user.role == 2
      pages_counselorviewmore_path
    else
      root_path
    end
  end

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

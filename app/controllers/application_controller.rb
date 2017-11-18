class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    #byebug
    if current_user.role == 1
      pages_adminhome_path
    elsif current_user.role == 2
      pages_counselorviewmore_path
    else
      root_path
    end
  end

    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
     # devise_parameter_sanitizer.permit(:sign_in) do |user_params|
     #   user_params.permit(:username, :email)
     # end
    # added_attrs = [:role, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
#devise_parameter_sanitizer.permit(:sign_up, keys: [:subscribe_newsletter])
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email, :role)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :role, :password)
    end
    #devise_paraeter_sanitzier.for[:sign_up]
  end

end

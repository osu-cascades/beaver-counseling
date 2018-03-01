class AdminController < ApplicationController
	before_action :authorize_admin 

  def adminhome
    if current_user.nil?
      return
    end
    render :adminhome
  end

  def adminclientreports
    if current_user.nil?
      return
    end
    render :adminclientreports
  end

  def adminmanageusers
    if current_user.nil?
      return
    end
    render :adminmanageusers
  end

  private

  def authorize_admin
    if (current_user.admin? == false)
      redirect_to root_path, alert: 'Admins only!'
    end
  end

end

class UsersController < ApplicationController
  before_action :authorize_admin, only: :create

  def create
    # user create code (can't get here if not admin)
    puts request.raw_post
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.role = params[:user][:role]

  end

  private

  # This should probably be abstracted to ApplicationController
  # as shown by diego.greyrobot
  def authorize_admin
    return unless current_user.role != 1
    redirect_to root_path, alert: 'Admins only!'
  end

end

class UsersController < ApplicationController
  before_action :authorize_admin, only: :create

  # arhive user

  def create
    # user create code (can't get here if not admin)
    #puts request.raw_post
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to pages_adminmanageusers_path, notice: 'User was successfully created.' }
        format.json { render inline: "location.reload();", status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # This should probably be abstracted to ApplicationController
  # as shown by diego.greyrobot
  def authorize_admin
    return unless current_user.role != 1
    redirect_to root_path, alert: 'Admins only!'
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

end

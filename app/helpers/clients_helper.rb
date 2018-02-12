module ClientsHelper
  def find_version_counselor_name(version)
    begin
      user = User.find_version_counselor(version)
      user ? user.name : ''
    rescue # clients initially have no counselor
      #user.name = "None" # we don't have a null counselor
      admin = ""
      @users = User.all
      @users.each do |user| # find user where role is admin
        if (user.role == 'admin')
          admin = user
          break
        end
      end
      user ? admin.name : ''
    end
  end
end

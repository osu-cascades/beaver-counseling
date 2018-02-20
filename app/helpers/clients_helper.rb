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

  def diff(content1, content2)
   changes = Diffy::Diff.new(content1, content2,
                             include_plus_and_minus_in_html: true,
                             include_diff_info: true)
   changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end
end

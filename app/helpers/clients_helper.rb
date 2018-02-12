module ClientsHelper
  def find_version_counselor_name(version)
    user = User.find_version_counselor(version)
    user ? user.name : ''
  end
end

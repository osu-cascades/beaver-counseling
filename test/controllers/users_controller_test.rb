require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get adminhome" do
    get users_adminhome_url
    assert_response :success
  end

end

require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get clientregistration" do
    get register_clientregistration_url
    assert_response :success
  end

end

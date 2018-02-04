require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit clients_url
  
    assert_selector "h1", text: "Welcome to OSU Cascades Counseling Clinic"
  end

  test "visiting the homepage" do
  	visit welcome

  	assert_selector "h1", text: "Welcome to OSU Cascades Counseling Clinic"
  end

end
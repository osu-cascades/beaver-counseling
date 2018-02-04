require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit clients_url
  
    assert_selector "h1", text: "Clients"
  end
end
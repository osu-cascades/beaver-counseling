require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test "Client should exist" do
    assert_nothing_raised { Client.new }
  end

  test "Client should have a first_name" do
    client_name = "Jack"
    client = clients(:valid)
    assert_equal(client_name, client.first_name)
  end

  test "Client without a first name is not valid" do
    invalid_client = clients(:invalid)
    assert_not(invalid_client.valid?)
  end

  test "Client first name must be a string" do
    invalid_client = clients(:invalid)
    assert_not(invalid_client.valid?)
  end

end

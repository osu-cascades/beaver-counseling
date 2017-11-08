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

  test "Client with a first name is valid" do
    valid_client = clients(:valid)
    assert(valid_client.valid?)
  end

  test "Client first name must be a string" do
    invalid_client = clients(:invalid)
    assert_not(invalid_client.valid?)
  end

end

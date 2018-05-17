require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test "without a first name is invalid" do
    client = clients(:valid)
    assert(client.valid?)
    client.first_name = nil
    refute client.valid?
  end

  test "without a last name is invalid" do
    client = clients(:valid)
    client.last_name = nil
    refute client.valid?
  end

  test "without a date of birth is invalid" do
    client = clients(:valid)
    client.dob = nil
    refute client.valid?
  end

  test "a phone number string is invalid" do
    client = clients(:valid)
    client.phone_number = "ralph"
    refute client.valid?
  end

  test "emergency_relation cannot be number" do
    client = clients(:valid)
    client.emergency_relation = "547"
    refute client.valid?
  end

  test "without emergency_name is invalid" do
    client = clients(:valid)
    client.emergency_name = nil
    refute client.valid?
  end

  test "without emergency_phone is invalid" do
    client = clients(:valid)
    client.emergency_phone = nil
    refute client.valid?
  end

  test "without counselor_seen_before is invalid" do
    client = clients(:valid)
    client.counselor_seen_before = nil
    refute client.valid?
  end

  test "first name with apostrophe is valid" do
    client_with_apostrophe = clients(:with_apostrophe_in_name)
    assert(client_with_apostrophe.valid?)
  end

  test "insurance_company cannot have non-alphanumeric characters" do
    client = clients(:non_alphanumeric_in_insurance_company)
    assert_not(client.valid?)
  end

end



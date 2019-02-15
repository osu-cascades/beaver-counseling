require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = clients(:valid)
  end

  test "without a first name is invalid" do
    @client.first_name = nil
    refute @client.valid?
  end

  test "without a last name is invalid" do
    @client.last_name = nil
    refute @client.valid?
  end

  test "first name cannot be a number" do
    @client.first_name = "123"
    refute @client.valid?
  end

  test "last name cannot be a number" do 
    @client.last_name = "123"
    refute @client.valid?
  end

  test "a zipcode string is invalid" do 
    @client.local_zipcode = "xyz" 
    refute @client.valid?
  end

  test "a city cannot be a number" do 
    @client.local_city = "123"
    refute @client.valid?
  end

  test "a state cannot be a number" do 
    @client.local_state = "123"
   refute @client.valid?
  end

  test "without a date of birth is invalid" do
    @client.dob = nil
    refute @client.valid?
  end

  test "a phone number string is invalid" do
    @client.phone_number = "ralph"
    refute @client.valid?
  end

  test "emergency_relation cannot be number" do
    @client.emergency_relation = "547"
    refute @client.valid?
  end

  test "without emergency_name is invalid" do
    @client.emergency_name = nil
    refute @client.valid?
  end

  test "emergency_name cannot be a number" do 
    @client.emergency_name = "123"
    refute @client.valid?
  end

  test "without emergency_phone is invalid" do
    @client.emergency_phone = nil
    refute @client.valid?
  end

  test "emergency_phone string is invalid" do 
    @client.emergency_phone = "ralph"
    refute @client.valid?
  end

  test "without counselor_seen_before is invalid" do
    @client.counselor_seen_before = nil
    refute @client.valid?
  end

  test "without insurance_company is invalid" do
    @client.insurance_company = nil
    refute @client.valid?
  end

  test "first name with apostrophe is valid" do
    client_with_apostrophe = clients(:with_apostrophe_in_name)
    assert(client_with_apostrophe.valid?)
  end

  test "insurance_company cannot have non-alphanumeric characters" do
    client = clients(:non_alphanumeric_in_insurance_company)
    assert_not(client.valid?)
  end

  test "to_s returns client's full name as a string" do
    assert_equal("Jack Bauer", @client.to_s)
  end
end

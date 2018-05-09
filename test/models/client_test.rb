require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  # tests would be useful if client.rb had any interesting methods but it doesn't

  test "without a first name is invalid" do
    client = clients(:valid)
    assert(client.valid?)
    client.first_name = nil
    refute client.valid?
  end

  test "should not save client without name" do
    client = Client.new
    assert_not client.save, "saved the client without a name"
    valid_client = Client.new( first_name: "Bob",last_name: "Smith", dob: DateTime.now,
        phone_number: "541-000-0000", emergency_name: "Mom", emergency_relation: "Mother",
        emergency_phone: '999-888-7777', insurance_company: "aflac", counselor_seen_before: false)
    assert(valid_client.valid?)
  end

  test "first name with apostrophe is valid" do
    client_with_apostrophe = clients(:with_apostrophe_in_name)
    assert(client_with_apostrophe.valid?)
  end

  test "dob must be a date" do
    client = clients(:valid)
    client.dob = "string"
    refute client.valid?
  end

  test "ascii charaters are invalid in insurance_company" do
    client = clients(:with_ascii_in_insurance_name)
    assert_not_nil client, "client is not returning nil."
    assert_not(client.valid?)
  end

end

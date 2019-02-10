require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
	test "new client fills out form correctly" do
    visit 'clients/new'

    fill_in 'client_phone_number', with: '555-123-1234'
    select 'Cell', :from => 'client_phone_type'
    check 'client_leave_message'
    fill_in 'client_email', with: 'example@mail.com'
    check 'client_email_leave_message'
    fill_in 'client_emergency_name', with: 'Max'
    fill_in 'client_emergency_phone', with: '555-321-4321'
    fill_in 'client_emergency_relation', with: 'Father'
    select 'OHP', :from => 'client_insurance_company'
    fill_in 'client_first_name', with: 'Stephen'
    fill_in 'client_last_name', with: 'Smith'
    fill_in 'client_local_street', with: '123 NW 2nd St.'
    fill_in 'client_local_city', with: 'Bend'
    fill_in 'client_local_state', with: 'OR'
    fill_in 'client_local_zipcode', with: '97701'
    fill_in 'client_occupation', with: 'Barista'
    fill_in 'client_employer', with: 'Starbucks'
    page.execute_script("$('client_dob').val('21/12/1990')")
    fill_in 'client_highest_edu', with: 'High school'
    fill_in 'client_identified_gender', with: 'Male'
    fill_in 'client_culture_background', with: 'White'
    fill_in 'client_sexual_orientation', with: 'Straight'
    fill_in 'client_relationship', with: 'single'
    uncheck 'client_counselor_seen_before'
    find('input[type="submit"]').click

    assert(has_text?('Client was successfully created.'))
  end

  test "new client fills out form incorrectly" do
    visit 'clients/new'

    fill_in 'client_phone_number', with: '5551231234'
    select 'Cell', :from => 'client_phone_type'
    check 'client_leave_message'
    fill_in 'client_email', with: 'example@mail.com'
    check 'client_email_leave_message'
    fill_in 'client_emergency_name', with: 'Max'
    fill_in 'client_emergency_phone', with: '555-321-4321'
    fill_in 'client_emergency_relation', with: 'Father'
    select 'OHP', :from => 'client_insurance_company'
    fill_in 'client_first_name', with: 'Stephen'
    fill_in 'client_last_name', with: 'Smith'
    fill_in 'client_local_street', with: '123 NW 2nd St.'
    fill_in 'client_local_city', with: 'Bend'
    fill_in 'client_local_state', with: 'OR'
    fill_in 'client_local_zipcode', with: '97701'
    fill_in 'client_occupation', with: 'Barista'
    fill_in 'client_employer', with: 'Starbucks'
    page.execute_script("$('client_dob').val('21/12/1990')")
    fill_in 'client_highest_edu', with: 'High school'
    fill_in 'client_identified_gender', with: 'Male'
    fill_in 'client_culture_background', with: 'White'
    fill_in 'client_sexual_orientation', with: 'Straight'
    fill_in 'client_relationship', with: 'single'
    uncheck 'client_counselor_seen_before'
    find('input[type="submit"]').click

    refute(has_text?('Client was successfully created.'))
  end
end

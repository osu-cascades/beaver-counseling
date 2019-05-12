require "application_system_test_case"

class SessionRatingsTest < ApplicationSystemTestCase

  test "client fills out session rating form correctly" do
    visit 'session_ratings/new'

    select '133', :from => 'roomNum'
    #select '4', :from => 'rb-1'
    fill_in 'optionalInfo', with: 'Some message given to the Counselor'
    #find('input[type="send"]').click

    assert(has_text?('Client has successfully submitted session rating.'))
  end
  
  test "client fills out session rating form incorrectly" do
    visit 'session_ratings/new'
  end
end

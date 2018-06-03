require 'test_helper'

class SessionRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_rating = session_ratings(:one)
  end

  test "should get index" do
    get session_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_session_rating_url
    assert_response :success
  end

  test "should create session_rating" do
    assert_difference('SessionRating.count') do
      post session_ratings_url, params: { session_rating: { care: @session_rating.care, client_number: @session_rating.client_number, date: @session_rating.date, effectiveness: @session_rating.effectiveness, end_stress: @session_rating.end_stress, focus: @session_rating.focus, optional_info: @session_rating.optional_info, relationship: @session_rating.relationship, room_num: @session_rating.room_num, start_stress: @session_rating.start_stress } }
    end

    assert_redirected_to session_rating_url(SessionRating.last)
  end

  test "should show session_rating" do
    get session_rating_url(@session_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_rating_url(@session_rating)
    assert_response :success
  end

  test "should update session_rating" do
    patch session_rating_url(@session_rating), params: { session_rating: { care: @session_rating.care, client_number: @session_rating.client_number, date: @session_rating.date, effectiveness: @session_rating.effectiveness, end_stress: @session_rating.end_stress, focus: @session_rating.focus, optional_info: @session_rating.optional_info, relationship: @session_rating.relationship, room_num: @session_rating.room_num, start_stress: @session_rating.start_stress } }
    assert_redirected_to session_rating_url(@session_rating)
  end

  test "should destroy session_rating" do
    assert_difference('SessionRating.count', -1) do
      delete session_rating_url(@session_rating)
    end

    assert_redirected_to session_ratings_url
  end
end

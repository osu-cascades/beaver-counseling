require 'test_helper'

class SessionRatingFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_rating_form = session_rating_forms(:one)
  end

  test "should get index" do
    get session_rating_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_session_rating_form_url
    assert_response :success
  end

  test "should create session_rating_form" do
    assert_difference('SessionRatingForm.count') do
      post session_rating_forms_url, params: { session_rating_form: { care: @session_rating_form.care, client_number: @session_rating_form.client_number, date: @session_rating_form.date, effectiveness: @session_rating_form.effectiveness, end_stress: @session_rating_form.end_stress, focus: @session_rating_form.focus, optional_info: @session_rating_form.optional_info, relationship: @session_rating_form.relationship, room_num: @session_rating_form.room_num, start_stress: @session_rating_form.start_stress } }
    end

    assert_redirected_to session_rating_form_url(SessionRatingForm.last)
  end

  test "should show session_rating_form" do
    get session_rating_form_url(@session_rating_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_rating_form_url(@session_rating_form)
    assert_response :success
  end

  test "should update session_rating_form" do
    patch session_rating_form_url(@session_rating_form), params: { session_rating_form: { care: @session_rating_form.care, client_number: @session_rating_form.client_number, date: @session_rating_form.date, effectiveness: @session_rating_form.effectiveness, end_stress: @session_rating_form.end_stress, focus: @session_rating_form.focus, optional_info: @session_rating_form.optional_info, relationship: @session_rating_form.relationship, room_num: @session_rating_form.room_num, start_stress: @session_rating_form.start_stress } }
    assert_redirected_to session_rating_form_url(@session_rating_form)
  end

  test "should destroy session_rating_form" do
    assert_difference('SessionRatingForm.count', -1) do
      delete session_rating_form_url(@session_rating_form)
    end

    assert_redirected_to session_rating_forms_url
  end
end

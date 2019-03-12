require 'test_helper'

class PatientAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get patient_answers_new_url
    assert_response :success
  end

  test "should get create" do
    get patient_answers_create_url
    assert_response :success
  end

end

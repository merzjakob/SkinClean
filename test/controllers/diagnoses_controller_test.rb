require 'test_helper'

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get diagnoses_create_url
    assert_response :success
  end

  test "should get show" do
    get diagnoses_show_url
    assert_response :success
  end

  test "should get index" do
    get diagnoses_index_url
    assert_response :success
  end

end

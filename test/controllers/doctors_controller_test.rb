require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctors_new_url
    assert_response :success
  end

  test "should get create" do
    get doctors_create_url
    assert_response :success
  end

  test "should get update" do
    get doctors_update_url
    assert_response :success
  end

  test "should get edit" do
    get doctors_edit_url
    assert_response :success
  end

end

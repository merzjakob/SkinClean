require 'test_helper'

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prescriptions_new_url
    assert_response :success
  end

  test "should get create" do
    get prescriptions_create_url
    assert_response :success
  end

  test "should get show" do
    get prescriptions_show_url
    assert_response :success
  end

end

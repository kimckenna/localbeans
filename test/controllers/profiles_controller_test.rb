require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get profiles_user_url
    assert_response :success
  end

  test "should get stockist" do
    get profiles_stockist_url
    assert_response :success
  end

end

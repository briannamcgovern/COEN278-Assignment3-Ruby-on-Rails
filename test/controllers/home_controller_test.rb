require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get page1" do
    get home_page1_url
    assert_response :success
  end

  test "should get page2" do
    get home_page2_url
    assert_response :success
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Course App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Course App"
  end

end

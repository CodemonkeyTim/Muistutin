require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get save_reminder" do
    get :save_reminder
    assert_response :success
  end

  test "should get create_new" do
    get :create_new
    assert_response :success
  end

end

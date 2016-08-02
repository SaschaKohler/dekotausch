require 'test_helper'

class OmniauthCallbacksControllerControllerTest < ActionController::TestCase
  test "should get :google_oauth2" do
    get ::google_oauth2
    assert_response :success
  end

end

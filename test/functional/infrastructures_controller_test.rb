require 'test_helper'

class InfrastructuresControllerTest < ActionController::TestCase
  test "should get buildable" do
    get :buildable
    assert_response :success
  end

end

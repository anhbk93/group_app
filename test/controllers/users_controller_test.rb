require 'test_helper'

# Test Users Controller
class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end
end

require 'test_helper'
# Testing User controller
class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end
end

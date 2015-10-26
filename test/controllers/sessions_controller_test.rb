require 'test_helper'
# Testing for Sessions Controllers
class SessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end
end

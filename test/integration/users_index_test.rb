require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    assert_not_nil session[:forwarding_url]
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = 'Foo Bar'
    email = 'foo@bar.com'
    patch user_path(@user), user: { name: name,
                                    email: email,
                                    password: 'foobar',
                                    password_confirmation: 'foobar' }
    assert_not flash.empty?
    assert_redirected_to @user
    assert_nil session[:forwarding_url]
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end

require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:micheal)
  end
  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: "", password: ""}}
    assert_not is_logged_in?
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: "password"}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    # assert_select "button[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    # delete logout_path
    # assert_not is_logged_in?
    # assert_redirected_to root_url
    # follow_redirect!
    # assert_select "a[href=?]", login_path, count: 0
    # assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with valid and invalid email" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: "invalid"}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end

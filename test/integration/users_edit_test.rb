require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:micheal)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: { name: '', email: "foo@invalid", password: "foo", password_confirmation: "bar" }
    }
    assert_template  'users/edit'
    # assert_select "div.alert.flash-banner", "The form contains 4 errors"
  end
end

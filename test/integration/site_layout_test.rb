require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contract_path
    get contract_path
    assert_select "title", full_title("Contract")
  end

  test "sign up page" do
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end

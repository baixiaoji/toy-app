require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "nam should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.name = "a" * 201 + "@example.com"
    assert_not @user.valid?
  end


  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com User@fooo.com A_US-Er@foo.bar.org first.last@fpp.jp alice+bob@bza.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email save should downcase" do
    mixed_CASE_Email = "AJEA@fire.com"
    @user.email = mixed_CASE_Email
    @user.save
    assert_equal mixed_CASE_Email.downcase, @user.reload.email
  end
end

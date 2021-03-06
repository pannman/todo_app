require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'ul.error_message'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    user = User.new(name:  "Example User",
                     email: "user@example.com",
                     password:              "password",
                     password_confirmation: "password")
    log_in_as(user)
    follow_redirect!
    assert_template 'users/show'
  end

  test "layout links" do
    get signup_path
    assert_template 'users/new'
    assert_select "a[href=?]", "/"
    assert_select "a[href=?]", login_path
  end
end

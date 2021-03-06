require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", "/"
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path, count: 3
  end
end

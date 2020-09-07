require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @todo = todos(:one)
  end

  test "should get new" do
    log_in_as(@user)
    get addtodo_path
    assert_response :success
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Todo.count' do
      post addtodo_path, params: { todo: { todo: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch todo_path(@todo), params: { todo: { todo: @todo.todo }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update for wrong todo" do
    log_in_as(@user)
    todo = todos(:three)
    patch todo_path(todo), params: {todo: { todo: "todo"}}

    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Todo.count' do
      delete todo_path(@todo)
    end
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong todo" do
    log_in_as(@user)
    todo = todos(:three)
    assert_no_difference 'Todo.count' do
      delete todo_path(todo)
    end
    assert_redirected_to root_url
  end
end

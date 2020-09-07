require 'test_helper'

class TodosInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "todo interface" do
    log_in_as(@user)
    get user_path(@user)
    assert_no_difference 'Todo.count' do
      post addtodo_path, params: { todo: { todo: "" } }
    end
    todo = "Todo"
    assert_difference 'Todo.count', 1 do
      post addtodo_path, params: { todo: { todo: todo } }
    end
    assert_redirected_to @user
    follow_redirect!
    assert_match todo, response.body
    first_todo = @user.todos.first
    assert_difference 'Todo.count', -1 do
      delete todo_path(first_todo)
    end
  end
end

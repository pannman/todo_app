require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # このコードは慣習的に正しくない
    @todo = Todo.new(todo: "todo", user_id: @user.id)
  end

  test "should be valid" do
    assert @todo.valid?
  end

  test "user id should be present" do
    @todo.user_id = nil
    assert_not @todo.valid?
  end
  test "todo should be present" do
    @todo.todo = "   "
    assert_not @todo.valid?
  end

  test "todo should be at most 140 characters" do
    @todo.todo = "a" * 141
    assert_not @todo.valid?
  end

end

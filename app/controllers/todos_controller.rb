class TodosController < ApplicationController
  before_action :logged_in_user, only: [:create,:edit,:update, :destroy]
  before_action :correct_user,   only: [:edit,:update,:destroy]

  def new
    @todo = Todo.new
    if(user_id = session[:user_id])
      @user = User.find_by(id: user_id)
    else
      redirect_to root_url
    end
  end

  def create
    if(user_id = session[:user_id])
      @user = User.find_by(id: user_id)
    end
    @todo = current_user.todos.build(todo_params)
    if @todo.save && @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    if(user_id = session[:user_id])
      @user = User.find_by(id: user_id)
    else
      redirect_to root_url
    end
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy
    redirect_to request.referrer || root_url
  end

  private

    def todo_params
      params.require(:todo).permit(:todo)
    end

    def correct_user
      @todo = current_user.todos.find_by(id: params[:id])
      redirect_to root_url if @todo.nil?
    end
end
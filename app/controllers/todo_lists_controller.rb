class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end
  def show
    @todo_list = TodoList.find(params[:id])
  end
  def new
    @todo_list = TodoList.new
  end
  def edit
    @todo_list = TodoList.find(params[:id])
  end
  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      redirect_to @todo_list
    else

    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end
end

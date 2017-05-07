class TodoItemsController < ApplicationController
  before_action :find_todo_list
  def index
  end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      redirect_to @todo_list
    else

    end
  end

  def complete
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.toggle_completion!
    redirect_to @todo_list, notice: "Todo item updated."
  end

  private
  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end

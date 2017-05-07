class TodoItemsController < ApplicationController

  def index
  end

  private
  def find_todo_list
    @todo_list = todo_lists.find(params[:todo_list_id])
  end
end

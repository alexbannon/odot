class Api::TodoListsController < Api::ApiController
  def index
    render json: TodoList.all
  end

  def show
    render json: TodoList.find(params[:id])
  end

  def create
    list = TodoList.new(list_params)
    if list.save
      render status: 200, json: {
        message: "Successfully created To-do List",
        todo_list: list
      }.to_json
    else
      render status: 422, json: {
        message: list.errors
      }.to_json
    end
  end

  def update
    list = TodoList.find(params[:id])
    if list.update(list_params)
      render status: 200, json: {
        message: "Successfully Updated Todo List with ID: #{params[:id]}",
        todo_list: list
      }
    else
      render status: 422, json: {
        message: list.errors
      }.to_json
    end
  end

  def destroy
    list = TodoList.find(params[:id])
    list.destroy
    render status: 200, json: {
      message: "Successfully deleted Todo List with id of #{params[:id]}"
    }
  end

  private
  def list_params
    params.require("todo_list").permit("title")
  end
end

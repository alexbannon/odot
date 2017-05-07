class AddTodoItemsToTodoList < ActiveRecord::Migration
  def change
    change_table(:todo_items) do |t|
      t.references :todo_list, :todo_item, index: true, foreign_key: true
    end
  end
end

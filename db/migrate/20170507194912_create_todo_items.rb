class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :content, :limit => 255
      t.timestamps null: false
    end
  end
end

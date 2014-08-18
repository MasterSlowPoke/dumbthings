class RemoveUsesColorFromTodoItems < ActiveRecord::Migration
  def change
    remove_column :todo_items, :usescolor
  end
end

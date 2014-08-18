class AddUsesColorToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :uses_color, :boolean
  end
end

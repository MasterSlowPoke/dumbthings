class ModifyUsesColorInTodoItems < ActiveRecord::Migration
  def up
    change_column :todo_items, :uses_color, :boolean, default: true
  end

  def down
    change_column :todo_items, :uses_color, :boolean, default: nil
  end
end

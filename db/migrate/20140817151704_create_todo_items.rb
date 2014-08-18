class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :description
      t.date :due
      t.date :assigned
      t.text :owner
      t.boolean :completed
      t.text :color

      t.timestamps
    end
  end
end

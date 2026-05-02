class AddNotesToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :notes, :text
  end
end

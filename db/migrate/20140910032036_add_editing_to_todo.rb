class AddEditingToTodo < ActiveRecord::Migration
  def change
  	add_column :items, :editing, :boolean, default: false
  end
end

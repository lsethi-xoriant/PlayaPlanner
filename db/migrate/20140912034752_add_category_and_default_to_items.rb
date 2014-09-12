class AddCategoryAndDefaultToItems < ActiveRecord::Migration
  def change
  	add_column :items, :category, :string
  	add_column :items, :default, :boolean, default: false
  	add_column :items, :necessity, :boolean, default: false
	end
end

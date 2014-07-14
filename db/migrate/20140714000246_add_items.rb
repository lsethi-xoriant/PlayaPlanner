class AddItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.integer :list_id, null: false
  		t.timestamps
  	end
  	add_index :items, :list_id
  end
end

class AddItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.integer :user_id
  		t.string :name, null: false
  		t.boolean :checked, null: false, default: false
  		t.timestamps
  	end
  	add_index :items, :user_id
  end
end

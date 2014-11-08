class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :session_token, null: false
      t.boolean :guest
      
      t.timestamps
    end
    add_index :users, :session_token, unique: true
  end
end

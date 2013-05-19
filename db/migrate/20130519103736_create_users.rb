class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :password, :null => false
      t.string :real_name
      t.string :email, :null => false
      t.boolean :active, :default => 0
      t.string :guid, :null => false, :unique => true

      t.timestamps
    end
    
    add_index :users, :username
    add_index :users, :password
    add_index :users, :guid    
  end
end

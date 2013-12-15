class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :subject, :null => false
      t.string :message, :null => false

      t.timestamps
    end
    add_index :email_messages, :name
    add_index :email_messages, :email
    add_index :email_messages, :subject
  end
end

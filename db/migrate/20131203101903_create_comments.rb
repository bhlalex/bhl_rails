class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :volume
      t.references :collection
      t.references :comment
      t.references :user
      t.integer :number_of_marks, :default => 0

      t.timestamps
    end
    add_index :comments, :volume_id
    add_index :comments, :collection_id
    add_index :comments, :comment_id
    add_index :comments, :user_id
  end
end

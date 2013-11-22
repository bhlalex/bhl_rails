class CreateBookCollections < ActiveRecord::Migration
  def change
    drop_table :book_collections if ActiveRecord::Base.connection.table_exists?('book_collections')
    
    create_table :book_collections do |t|
      t.references :volume
      t.references :collection
      t.integer :position

      t.timestamps
    end
    add_index :book_collections, :volume_id
    add_index :book_collections, :collection_id
    add_index :book_collections, :position
  end
end

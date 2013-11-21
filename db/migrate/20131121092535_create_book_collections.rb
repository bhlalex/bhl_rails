class CreateBookCollections < ActiveRecord::Migration
  def change
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

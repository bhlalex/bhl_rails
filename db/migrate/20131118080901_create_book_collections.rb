class CreateBookCollections < ActiveRecord::Migration
  def change
    create_table :book_collections do |t|
      t.references :book
      t.references :collection
      t.integer :order

      t.timestamps
    end
    add_index :book_collections, :book_id
    add_index :book_collections, :collection_id
    add_index :book_collections, :order
  end
end

class CreateCollectionRatings < ActiveRecord::Migration
  def change
    create_table :collection_ratings do |t|
      t.references :collection
      t.references :user
      t.decimal :rate, :precision => 2, :scale => 1

      t.timestamps
    end
    add_index :collection_ratings, :collection_id
    add_index :collection_ratings, :user_id
  end
end

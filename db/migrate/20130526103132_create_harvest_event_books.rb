class CreateHarvestEventBooks < ActiveRecord::Migration
  def change
    create_table :harvest_event_books do |t|
      t.references :harvest_event
      t.references :book
      t.boolean :success

      t.timestamps
    end
    add_index :harvest_event_books, :harvest_event_id
    add_index :harvest_event_books, :book_id
  end
end

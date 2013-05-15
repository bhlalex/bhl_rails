class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :bibid
      t.string :title, :length => 1000
      t.string :title_alternative, :length => 1000
      t.datetime :start_date
      t.datetime :end_date
      t.string :publisher, :length => 1000
      t.references :language
      t.text :note
      t.string :edition
      t.string :format_extent, :length => 1000
      t.string :collection
      t.string :contributor
      t.integer :fill_metadata_fail
      t.integer :metadata_index_status
      t.integer :generate_format_fail

      t.timestamps
    end
    add_index :books, :language_id
  end
end

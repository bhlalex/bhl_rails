class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bibid
      t.string :title, :limit => 2000
      t.string :title_alternative, :limit => 2000
      t.string :start_date
      t.string :end_date
      t.string :publisher, :limit => 1000
      t.references :language
      t.text :note
      t.string :edition, :limit => 1000
      t.string :format_extent, :limit => 1000
      t.string :collection, :limit => 500
      t.string :contributor, :limit => 500
      t.integer :fill_metadata_fail
      t.integer :metadata_index_status
      t.integer :generate_format_fail
      t.text :mods

      t.timestamps
    end
    add_index :books, :language_id
  end
end

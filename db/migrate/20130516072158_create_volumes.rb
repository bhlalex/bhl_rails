class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.references :book
      t.integer :job_id
      t.integer :copyright
      t.string :name
      t.integer :volume_number
      t.integer :fill_content_fail
      t.integer :get_thumbnail_fail
      t.integer :content_index_status
      t.integer :generate_names_xml_fail
      t.integer :ubio_in_dar_fail
      t.integer :get_pages_names_fail

      t.timestamps
    end
    add_index :volumes, :book_id
  end
end

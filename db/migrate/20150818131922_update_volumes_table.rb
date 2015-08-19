class UpdateVolumesTable < ActiveRecord::Migration
  def up
    remove_column :volumes, :copyright
    remove_column :volumes, :name
    remove_column :volumes, :fill_content_fail
    remove_column :volumes, :get_thumbnail_fail
    remove_column :volumes, :content_index_status
    remove_column :volumes, :ubio_in_dar_fail
    remove_column :volumes, :get_pages_names_fail
    add_column :volumes, :status_code, :string, references: :volumetatuses
  end

  def down
  end
end

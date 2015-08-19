class UpdateTableBooks < ActiveRecord::Migration
  def up
    remove_column :books, :end_date
    rename_column :books, :start_date, :published_at
    remove_column :books, :note
    remove_column :books, :edition
    remove_column :books, :format_extent
    remove_column :books, :collection
    remove_column :books, :contributor
    remove_column :books, :fill_metadata_fail
    remove_column :books, :metadata_index_status
    remove_column :books, :generate_format_fail
    add_column :books, :status_code, :string, references: :bookstatuses
  end

  def down
  end
end

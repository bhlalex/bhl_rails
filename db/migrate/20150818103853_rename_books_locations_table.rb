class RenameBooksLocationsTable < ActiveRecord::Migration
  def up
    rename_table :books_locations, :book_locations
  end

  def down
  end
end

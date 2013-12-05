class RemoveLastModifiedDateFromCollections < ActiveRecord::Migration
  def up
    remove_column :collections, :last_modified_date
  end

  def down
    add_column :collections, :last_modified_date, :datetime
  end
end

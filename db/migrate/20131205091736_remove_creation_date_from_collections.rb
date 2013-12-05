class RemoveCreationDateFromCollections < ActiveRecord::Migration
  def up
    remove_column :collections, :creation_date
  end

  def down
    add_column :collections, :creation_date, :datetime
  end
end

class RenameCollectionStatusToColectionPublic < ActiveRecord::Migration
  def up
    rename_column :collections, :status, :is_public
  end

  def down
    rename_column :collections, :is_public, :status
  end
end
